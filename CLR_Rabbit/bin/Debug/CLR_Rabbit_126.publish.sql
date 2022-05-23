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
PRINT N'Altering Assembly [Library]...';


GO
ALTER ASSEMBLY [Library]
    DROP FILE ALL;


GO
ALTER ASSEMBLY [Library]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300A9C404A00000000000000000E00022200B01300000120000000600000000000096300000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000443000004F000000004000006803000000000000000000000000000000000000006000000C000000AC2F0000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E746578740000009C100000002000000012000000020000000000000000000000000000200000602E7273726300000068030000004000000004000000140000000000000000000000000000400000402E72656C6F6300000C00000000600000000200000018000000000000000000000000000040000042000000000000000000000000000000007830000000000000480000000200050098210000140E000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E027B010000042A2202037D010000042A1E027B020000042A2202037D020000042A1E027B030000042A2202037D030000042A1E027B040000042A2202037D040000042A2202281200000A002A00000013300400E0000000010000110072010000700A720D0000700B7221000070281300000A06723700007007281400000A6F1500000A281600000A0C723B0000700D7E1700000A1304723E0100701305724A010070281800000A1306281900000A11066F1A00000A007298010070731B00000A1307281900000A11076F1C00000A6F1D00000A6F1A00000A00721B020070731E00000A130811087225020070723F0200706F1F00000A2611087261020070727D02007008282000000A6F1F00000A261108723F020070096F2100000A26110711086F2200000A13090211096F2300000A282400000A81150000012A2202281200000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C0000005C040000237E0000C80400002805000023537472696E677300000000F00900008C020000235553007C0C00001000000023475549440000008C0C00008801000023426C6F6200000000000000020000015715A2010900000000FA013300160000010000002000000003000000040000000B00000005000000240000001F0000000100000001000000040000000800000001000000040000000000490301000000000006003A0214040600A702140406003D01E2030F003404000006008001680306001D0268030600FE01680306008E02680306005A0268030600730268030600AD01680306006C01F50306002F01F5030600E10168030600C80109030600860461030600140114040600FD00E20306005101E2030A009701C1030A00320361040E00A804A0030E00C804A0030E00EF00A0030600D602D40406003E0361030600BF0461030E00130531000A00E004C1030A00E700C1031200450361030E00C704A0030000000001000000000001000100010010008B030000410001000100010010008D040000410005000A000100960049000100B200490001005B004900010074004900502000000000860843045B00010058200000000086085204100001006120000000008608EB045B0002006920000000008608FB0410000200722000000000860843005B0003007A200000000086084F00100003008320000000008608DF025B0004008B20000000008608F402100004009420000000008618DC0306000500A0200000000096007A038C0005008C21000000008618DC030600060000000100CD0200000100CD0200000100CD0200000100CD02020001000A000900DC0301001100DC0306001900DC030A002900DC0310003100DC0310003900DC0310004100DC0310004900DC0310005100DC0310005900DC0310006100DC0315006900DC0310007100DC0310007900DC0310008900DC0306009900DC031A00A100DC0306008100DC030600C900D3023000D1007F043600C90076043D00D90023034300D1001F054900E100D4004C00E900DE005100F100CF001000B100DC031000B1005503560081003C035B00B900DC031000B900AA035F00D1007F046700B900B4036D00B100C5027500C100B3045B00A9009C047D0020007B00780121007B007801210083007D012E000B0097002E001300A0002E001B00BF002E002300C8002E002B00D5002E003300D5002E003B00D5002E004300C8002E004B00DB002E005300D5002E005B00D5002E006300F3002E006B001D012E0073002A0140007B00780141007B007801410083007D0160007B00780161007B007801610083007D0180007B00780181007B007801810083007D01A0007B007801C0007B007801E0007B00780100017B00780140018B0078012000020001000000560493000000FF0493000000530093000000F80293000200010003000100020003000200030005000100040005000200050007000100060007000200070009000100080009000480000001000000000000000000000000000B050000040000000000000000000000830028000000000004000000000000000000000083001C00000000006900010000000000000000000000A0030000000004000000000000000000000083006103000000000000003C4D6F64756C653E0044735F5265746F726E6F5F4F55545055540053797374656D2E44617461006D73636F726C6962005265737453686172702E436F6E74726962006765745F7061796C6F6164007365745F7061796C6F6164003C7061796C6F61643E6B5F5F4261636B696E674669656C64003C7061796C6F61645F656E636F64696E673E6B5F5F4261636B696E674669656C64003C70726F706572746965733E6B5F5F4261636B696E674669656C64003C726F7574696E675F6B65793E6B5F5F4261636B696E674669656C640053656E640055726C456E636F6465006765745F506970650053716C50697065004952657374526573706F6E736500446562756767657242726F777361626C65537461746500436F6D70696C657247656E65726174656441747472696275746500477569644174747269627574650044656275676761626C6541747472696275746500446562756767657242726F777361626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500457865637574650076616C756500476574456E636F64696E67006765745F7061796C6F61645F656E636F64696E67007365745F7061796C6F61645F656E636F64696E670053797374656D2E52756E74696D652E56657273696F6E696E6700546F426173653634537472696E670053716C537472696E6700546F537472696E6700557269004C6962726172792E646C6C006765745F4261736555726C0053797374656D0053797374656D2E5265666C656374696F6E0073747057735F5265717569736963616F004765745261626269744170694E6577446F63746F005265737453686172700041646448656164657200416464506172616D65746572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F646573006765745F70726F70657274696573007365745F70726F706572746965730053797374656D2E446174612E53716C547970657300476574427974657300436F6E636174004F626A65637400526571756573745F526162626974006F705F496D706C696369740052657374436C69656E74006765745F436F6E74656E7400436F6E76657274004952657374526571756573740053797374656D2E546578740053716C436F6E74657874006765745F726F7574696E675F6B6579007365745F726F7574696E675F6B6579004C69627261727900487474705574696C69747900456D70747900000000000B6100670075006900610000136100670075006900610032003000320032000015490053004F002D0038003800350039002D00310001033A000081017B002200700072006F00700065007200740069006500730022003A007B007D002C00220072006F007500740069006E0067005F006B006500790022003A0022007200650063006500690076006500500065006400690064006F00460069006C00610022002C0022007000610079006C006F006100640022003A002200300031004400350042003100350037002D0030003500430044002D0034004400300043002D0039003800460038002D0035003100300036003500430039003800430034003900370022002C0022007000610079006C006F00610064005F0065006E0063006F00640069006E00670022003A00220073007400720069006E00670022007D00010B5500540046002D003800014D68007400740070003A002F002F007700770077002E0067006F006F0067006C0065002E0063006F006D002F007300650061007200630068003F0071003D004500780061006D0070006C00650000808168007400740070003A002F002F006C006F00630061006C0068006F00730074003A00310035003600370032002F006100700069002F00650078006300680061006E006700650073002F00250032003500320046002F007200650063006500690076006500500065006400690064006F002F007000750062006C00690073006800000950004F0053005400001943006F006E00740065006E0074002D00540079007000650001216100700070006C00690063006100740069006F006E002F006A0073006F006E00001B41007500740068006F00720069007A006100740069006F006E00000D420061007300690063002000000044B25DC44049A143A7854F08A3B9636200042001010803200001052001011111042001010E04200101020520010111490F070A0E0E0E0E0E0E0E1259125D126105000112650E0600030E0E0E0E0520011D050E0500010E1D0502060E0400010E0E0400001279042000127D0320000E0720021280810E0E0500020E0E0E0720021280810E1C072001126112808105000111550E08B77A5C561934E089060001011011550328000E0801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000C0100074C696272617279000005010000000017010012436F7079726967687420C2A920203230323200002901002466326362383934302D373863302D343631392D393233302D30323034633965393732613800000C010007312E302E302E3000004D01001C2E4E45544672616D65776F726B2C56657273696F6E3D76342E362E310100540E144672616D65776F726B446973706C61794E616D65142E4E4554204672616D65776F726B20342E362E310401000000080100000000000000000000000000D47C12CA000000000200000060000000E42F0000E41100000000000000000000000000001000000000000000000000000000000052534453F8F7B42996251249898865064B9E0D6601000000443A5C5265706F7369746F72696F735C4769745C434C525F5261626269745C434C525F5261626269745C4C6962726172795C6F626A5C44656275675C4C6962726172792E706462006C30000000000000000000008630000000200000000000000000000000000000000000000000000078300000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000000C03000000000000000000000C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0046C020000010053007400720069006E006700460069006C00650049006E0066006F0000004802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D0065000000000000000000380008000100460069006C0065004400650073006300720069007000740069006F006E00000000004C006900620072006100720079000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000038000C00010049006E007400650072006E0061006C004E0061006D00650000004C006900620072006100720079002E0064006C006C0000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003200320000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000040000C0001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004C006900620072006100720079002E0064006C006C000000300008000100500072006F0064007500630074004E0061006D006500000000004C006900620072006100720079000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000C000000983000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
PRINT N'Update complete.';


GO
