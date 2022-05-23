﻿/*
Deployment script for PICKTOLIGHTBR

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PICKTOLIGHTBR"
:setvar DefaultFilePrefix "PICKTOLIGHTBR"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping Procedure [dbo].[stpWs_Requisicao]...';


GO
DROP PROCEDURE [dbo].[stpWs_Requisicao];


GO
PRINT N'Dropping Assembly [Library]...';


GO
DROP ASSEMBLY [Library];


GO
PRINT N'Creating Assembly [Library]...';


GO
CREATE ASSEMBLY [Library]
    AUTHORIZATION [dbo]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103005CD5D0FC0000000000000000E00022200B013000000E000000060000000000009E2D00000020000000400000000000100020000000020000040000000000000006000000000000000080000000020000000000000300608500001000001000000000100000100000000000001000000000000000000000004C2D00004F000000004000006803000000000000000000000000000000000000006000000C000000B42C0000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000A40D000000200000000E000000020000000000000000000000000000200000602E7273726300000068030000004000000004000000100000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001400000000000000000000000000004000004200000000000000000000000000000000802D000000000000480000000200050008220000AC0A000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3004008D01000001000011000F02281000000A2D090F02281100000A2B0572010000700A0F01281000000A2D0E0F01281100000A6F1200000A2B0572030000700B0F00281100000A0C7E1300000A0D0F03281000000A2D090F03281100000A2B05720B00007013040008281400000A741300000113051105076F1500000A00110572170000706F1600000A0007725B000070281700000A2C0B066F1800000A16FE022B0116130911092C690006130A281900000A110A6F1A00000A130B11056F1B00000A726500007072810000700F04FE16120000016F1C00000A281D00000A6F1E00000A001105110B8E696A6F1F00000A0011056F2000000A130C110C110B16110B8E696F2100000A00110C6F2200000A000011056F2300000A7414000001130611066F2400000A130711071104282500000A732600000A130811086F2700000A0D11066F2800000A0011072D022B081107282900000A0011086F2A00000A0000DE26130D00282B00000A14FE03130E110E2C12282B00000A110D6F2C00000A6F2D00000A0000DE000E0509282E00000A81120000012A0000000110000000005D00FC590126170000012202282F00000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C00000030030000237E00009C030000D004000023537472696E6773000000006C080000940000002355530000090000100000002347554944000000100900009C01000023426C6F620000000000000002000001471502000900000000FA01330016000001000000200000000200000002000000060000002F0000000F0000000100000001000000030000000000C0020100000000000600D501F20306004202F2030600F300C0030F001204000006001B0111030600B80111030600990111030600290211030600F501110306000E02110306004801110306000701D3030600E500D30306007C0111030600630176020600600401030A0032019F030A00900221040E008D0467040E00AE0067040600FA02130006007F03130006004B03010306009C0201030E009104670406006D029C040E00370367040E00230348000E00B200670406008C0313000A00A8049F030A0096009F03000000000A000000000001000100010010007204000041000100010050200000000096006403A4000100FC21000000008618BA030600070000000100D702000002007503000003003F04000004005503000005000803020006001D000900BA0301001100BA0306001900BA030A002900BA0310003100BA0310003900BA0310004100BA0310004900BA0310005100BA0310005900BA0310006100BA0315006900BA0310007100BA0310007900BA0310008900BA0306009100CC023300910060023700C10097033700C100C7043B00C900D8003E00C90076001000C9009E001000C100BB044400C100A3024A00D10001004E00D10036045300C9004D04590081009A023700C10059045E00E10044006400C900AE026A00C900F0026F00A900DF007400A900CA000600C900BE007C00E900DE026F00D1006A028100B100BA038700F10067003700E900CA000600A900D0000600F100D0000600F9008D008F00B900810037000101710010009100810495008100BA03060020007B0096012E000B00B5002E001300BE002E001B00DD002E002300E6002E002B00F3002E003300F3002E003B00F3002E004300E6002E004B00F9002E005300F3002E005B00F3002E00630011012E006B003B012E00730048011A00048000000100000000000000000000000000B30400000400000000000000000000009B003B00000000000400000000000000000000009B002F00000000000400000000000000000000009B000103000000000000006765745F55544638003C4D6F64756C653E0053797374656D2E494F0044735F5265746F726E6F5F4F55545055540053797374656D2E44617461006D73636F726C6962004164640053797374656D2E436F6C6C656374696F6E732E5370656369616C697A65640052656164546F456E640053656E64007365745F4D6574686F64006765745F4D657373616765006765745F506970650053716C50697065007365745F436F6E74656E74547970650048747470576562526573706F6E736500476574526573706F6E736500436C6F736500446973706F73650043726561746500577269746500477569644174747269627574650044656275676761626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C697479417474726962757465006765745F56616C756500476574456E636F64696E670053797374656D2E52756E74696D652E56657273696F6E696E670053716C537472696E6700546F537472696E67006765745F4C656E677468007365745F436F6E74656E744C656E677468004C6962726172792E646C6C006765745F49734E756C6C0044735F55726C00476574526573706F6E736553747265616D004765745265717565737453747265616D0053797374656D0044735F746F6B656E0053797374656D2E5265666C656374696F6E004E616D6556616C7565436F6C6C656374696F6E00576562486561646572436F6C6C656374696F6E00457863657074696F6E0044735F436F64696669636163616F0073747057735F5265717569736963616F0044735F4D65746F646F0053747265616D526561646572005465787452656164657200546F5570706572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F6465730053797374656D2E446174612E53716C54797065730047657442797465730044735F506172616D6574726F73006765745F4865616465727300436F6E636174004F626A6563740053797374656D2E4E657400526571756573745F526162626974006F705F496D706C696369740048747470576562526571756573740053797374656D2E546578740053716C436F6E74657874004C696272617279006F705F457175616C69747900456D7074790000000000010007470045005400000B5500540046002D00380001436100700070006C00690063006100740069006F006E002F0078002D007700770077002D0066006F0072006D002D00750072006C0065006E0063006F00640065006400010950004F0053005400001B41007500740068006F00720069007A006100740069006F006E00000F42006500610072006500720020000000000005FC6AA7FCE844488380F85E4D75C8C100042001010803200001052001011111042001010E042001010218070F0E0E0E0E0E124D125112551259020E1D051255125D02032000020320000E02060E05000112650E050002020E0E0320000804000012690520011D050E042000126D0500020E0E0E052002010E0E042001010A0420001255072003011D050808042000127505000112690E072002011255126905000012808105000111490E08B77A5C561934E08910000601114911491149114911491011490801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000C0100074C696272617279000005010000000017010012436F7079726967687420C2A920203230323200002901002466326362383934302D373863302D343631392D393233302D30323034633965393732613800000C010007312E302E302E3000004D01001C2E4E45544672616D65776F726B2C56657273696F6E3D76342E362E310100540E144672616D65776F726B446973706C61794E616D65142E4E4554204672616D65776F726B20342E362E310401000000000000000053B545AB000000000200000060000000EC2C0000EC0E00000000000000000000000000001000000000000000000000000000000052534453130DF5A3310E4744B9C362BBD093675301000000443A5C5265706F7369746F72696F735C4769745C434C525F5261626269745C434C525F5261626269745C4C6962726172795C6F626A5C44656275675C4C6962726172792E70646200742D000000000000000000008E2D0000002000000000000000000000000000000000000000000000802D0000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000000C03000000000000000000000C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0046C020000010053007400720069006E006700460069006C00650049006E0066006F0000004802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D0065000000000000000000380008000100460069006C0065004400650073006300720069007000740069006F006E00000000004C006900620072006100720079000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000038000C00010049006E007400650072006E0061006C004E0061006D00650000004C006900620072006100720079002E0064006C006C0000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003200320000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000040000C0001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004C006900620072006100720079002E0064006C006C000000300008000100500072006F0064007500630074004E0061006D006500000000004C006900620072006100720079000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000A03D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    WITH PERMISSION_SET = EXTERNAL_ACCESS;


GO
PRINT N'Creating Procedure [dbo].[stpWs_Requisicao]...';


GO
CREATE PROCEDURE [dbo].[stpWs_Requisicao]
@Ds_Url NVARCHAR (MAX) NULL, @Ds_Metodo NVARCHAR (MAX) NULL, @Ds_Parametros NVARCHAR (MAX) NULL, @Ds_Codificacao NVARCHAR (MAX) NULL, @Ds_token NVARCHAR (MAX) NULL, @Ds_Retorno_OUTPUT NVARCHAR (MAX) NULL OUTPUT
AS EXTERNAL NAME [Library].[Request_Rabbit].[stpWs_Requisicao]


GO
PRINT N'Update complete.';


GO
