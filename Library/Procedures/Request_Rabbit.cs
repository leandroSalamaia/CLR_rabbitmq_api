using System;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Net;
using System.IO;
using System.Text;
using System.Reflection;

public partial class Request_Rabbit
{

    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void stpWs_Requisicao(SqlString Url, SqlString Method, SqlString Parameters, SqlString user, SqlString password, out SqlString OUTPUT)
    {
        Uri url = new Uri(Url.Value);
        var feedData = string.Empty;

        string encoded = System.Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1")
                           .GetBytes(user.Value + ":" + password.Value));

        //string json = "{\"properties\":{},\"routing_key\":\"receivePedidoFila\",\"payload\":\"01D5B157-05CD-4D0C-98F8-51065C98C497\",\"payload_encoding\":\"string\"}";

        var encoding = "UTF-8";

        try
        {
            ForceCanonicalPathAndQuery(url);
            var request = WebRequest.CreateHttp(url);
            request.Method = Method.Value;
            request.ContentType = "application/json";
            request.Headers.Add("Authorization", "Basic " + encoded);



            if (Method == "POST" && Parameters.Value.Length > 0)
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    streamWriter.Write(Parameters.Value);
                }
            }

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            SqlContext.Pipe.Send(response.StatusDescription);

            var stream = response.GetResponseStream();
            var streamReader = new StreamReader(stream, Encoding.GetEncoding(encoding));
            feedData = streamReader.ReadToEnd();

            response.Close();
            stream?.Dispose();
            streamReader.Dispose();
        }
        catch (Exception ex)
        {
            SqlContext.Pipe.Send(ex.Message);
        }

        OUTPUT = feedData;

        void ForceCanonicalPathAndQuery(Uri uri)
        {
            string paq = uri.PathAndQuery;
            FieldInfo flagsFieldInfo = typeof(Uri).GetField("m_Flags", BindingFlags.Instance | BindingFlags.NonPublic);
            ulong flags = (ulong)flagsFieldInfo.GetValue(uri);
            flags &= ~((ulong)0x30);
            flagsFieldInfo.SetValue(uri, flags);
        }

    }
}
