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
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300D377F7CA0000000000000000E00022200B013000001200000006000000000000FA310000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000A83100004F000000004000006803000000000000000000000000000000000000006000000C00000010310000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000000120000002000000012000000020000000000000000000000000000200000602E7273726300000068030000004000000004000000140000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001800000000000000000000000000004000004200000000000000000000000000000000DC3100000000000048000000020005000C220000040F000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E027B010000042A2202037D010000042A1E027B020000042A2202037D020000042A1E027B030000042A2202037D030000042A1E027B040000042A2202037D040000042A2202281200000A002A0000001B30040042010000010000110072010000700A727F0000700B728B0000700C729F000070281300000A0772B500007008281400000A6F1500000A281600000A0D72B900007013047E1700000A13050F03281800000A2D090F03281900000A2B0572B8010070130606281A00000A1307110772C40100706F1B00000A00110772CE0100706F1C00000A0011076F1D00000A72F0010070720C02007009281E00000A6F1F00000A00282000000A11046F2100000A0011076F2200000A732300000A130B00110B11046F2400000A00110B6F2500000A0000DE0D110B2C08110B6F2600000A00DC11076F2700000A7417000001130811086F2800000A130911091106281300000A732900000A130A110A6F2A00000A1305282000000A11056F2100000A0011086F2B00000A0011092D022B081109282C00000A00110A6F2D00000A000E041105282E00000A81150000012A0000011000000200B50016CB000D000000002202281200000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C000000C0040000237E00002C0500000C06000023537472696E677300000000380B00001C02000023555300540D0000100000002347554944000000640D0000A001000023426C6F6200000000000000020000015715A2010900000000FA013300160000010000002600000003000000040000000B000000090000002E0000001F0000000100000001000000040000000800000001000000030000000000A80301000000000006009E02F70406000B03F7040600A101C5040F00170500000600E401F00306008102F00306006202F0030600F202F0030600BE02F0030600D702F00306001102F0030600D001D80406009301D80406004502F00306002C026F0306008305E90306007801F70406005B01C5040600B501C5040A00FB01A4040A00980344050E00B8058A050E0031018A050600E2030A00060074040A0006008C040A0006003C03C70506009B03E9030600B005E9030E00BC058A050E0016048A050E00020457000A00D305A4040A001901A404060099040A0006000401E9030E0035018A05060081040A00000000000100000000000100010001001000540400004100010001000100100095050000410005000A000100B1004D000100CD004D00010076004D0001008F004D00502000000000860826055400010058200000000086083505100001006120000000008608DE05540002006920000000008608EE051000020072200000000086083B00540003007A2000000000860847001000030083200000000086084503540004008B200000000086085A03100004009420000000008618BF0406000500A02000000000960039049D0005000022000000008618BF0406000A0000000100330300000100330300000100330300000100330300000100BF03000002004A04000003006205000004002A040200050014000900BF0401001100BF0406001900BF040A002900BF0410003100BF0410003900BF0410004100BF0410004900BF0410005100BF0410005900BF0410006100BF0415006900BF0410007100BF0410007900BF0410008900BF0406009900BF041A00A100BF0406008100BF040600D90039033400E1007C053A00D90059054100E90089034700E10006064D00A900B4035000A90029035400F10069045800F100F9001000F10021011000F10070055E00E1007C056300010153006900090110016F001101F4001000F100D8037500D100BF047A001901720110001901A2030600210153010600F100410180002901C6037500C900BF0486003101EA00540029014D010600C10053010600310153010600A900A4058E0020007B00910121007B0091012100830096012E000B00B0002E001300B9002E001B00D8002E002300E1002E002B00EE002E003300EE002E003B00EE002E004300E1002E004B00F4002E005300EE002E005B00EE002E0063000C012E006B0036012E007300430140007B00910141007B00910141008300960160007B00910161007B00910161008300960180007B00910181007B009101810083009601A0007B009101C0007B009101E0007B00910100017B00910140018B00910120000200010000003905AC000000F205AC0000004B00AC0000005E03AC00020001000300010002000300020003000500010004000500020005000700010006000700020007000900010008000900048000000100000000000000000000000000FE050000040000000000000000000000940032000000000004000000000000000000000094002600000000000400000000000000000000009400E903000000000000003C4D6F64756C653E0053797374656D2E494F0044735F5265746F726E6F5F4F55545055540053797374656D2E44617461006D73636F726C6962006765745F7061796C6F6164007365745F7061796C6F6164004164640053797374656D2E436F6C6C656374696F6E732E5370656369616C697A6564003C7061796C6F61643E6B5F5F4261636B696E674669656C64003C7061796C6F61645F656E636F64696E673E6B5F5F4261636B696E674669656C64003C70726F706572746965733E6B5F5F4261636B696E674669656C64003C726F7574696E675F6B65793E6B5F5F4261636B696E674669656C640052656164546F456E640053656E64007365745F4D6574686F640049446973706F7361626C65006765745F506970650053716C50697065007365745F436F6E74656E74547970650048747470576562526573706F6E736500476574526573706F6E736500436C6F736500446973706F736500446562756767657242726F777361626C65537461746500577269746500436F6D70696C657247656E65726174656441747472696275746500477569644174747269627574650044656275676761626C6541747472696275746500446562756767657242726F777361626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C697479417474726962757465006765745F56616C75650076616C756500476574456E636F64696E67006765745F7061796C6F61645F656E636F64696E67007365745F7061796C6F61645F656E636F64696E670053797374656D2E52756E74696D652E56657273696F6E696E6700546F426173653634537472696E670053716C537472696E6700466C757368004C6962726172792E646C6C006765745F49734E756C6C0044735F55726C00476574526573706F6E736553747265616D004765745265717565737453747265616D0053797374656D0053797374656D2E5265666C656374696F6E004E616D6556616C7565436F6C6C656374696F6E00576562486561646572436F6C6C656374696F6E0044735F436F64696669636163616F0073747057735F5265717569736963616F0044735F4D65746F646F004765745261626269744170694E6577446F63746F00437265617465487474700053747265616D52656164657200546578745265616465720053747265616D5772697465720054657874577269746572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F646573006765745F70726F70657274696573007365745F70726F706572746965730053797374656D2E446174612E53716C54797065730047657442797465730044735F506172616D6574726F73006765745F4865616465727300436F6E636174004F626A6563740053797374656D2E4E657400526571756573745F526162626974006F705F496D706C6963697400436F6E766572740048747470576562526571756573740053797374656D2E546578740053716C436F6E74657874006765745F726F7574696E675F6B6579007365745F726F7574696E675F6B6579004C69627261727900456D70747900007D68007400740070003A002F002F006C006F00630061006C0068006F00730074003A00310035003600370032002F006100700069002F00650078006300680061006E006700650073002F002500320066002F007200650063006500690076006500500065006400690064006F002F007000750062006C00690073006800000B6100670075006900610000136100670075006900610032003000320032000015490053004F002D0038003800350039002D00310001033A000080FD7B002200700072006F00700065007200740069006500730022003A007B007D002C00220072006F007500740069006E0067005F006B006500790022003A0022007200650063006500690076006500500065006400690064006F00460069006C006100220022007000610079006C006F006100640022003A002200300031004400350042003100350037002D0030003500430044002D0034004400300043002D0039003800460038002D00350031003000360035004300390038004300340039003700220022007000610079006C006F00610064005F0065006E0063006F00640069006E00670022003A00220073007400720069006E00670022007D00010B5500540046002D003800010950004F005300540000216100700070006C00690063006100740069006F006E002F006A0073006F006E00001B41007500740068006F00720069007A006100740069006F006E00000D420061007300690063002000000000CC579F7C35177E43B84E761AF2F2C7F400042001010803200001052001011111042001010E042001010205200101114913070C0E0E0E0E0E0E0E1259125D126112651269050001126D0E0600030E0E0E0E0520011D050E0500010E1D0502060E032000020320000E05000112590E042000127D0500020E0E0E052002010E0E0500001280890420001261052001011261052000128095072002011261126D05000111550E08B77A5C561934E0890E00050111551155115511551011550328000E0801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000C0100074C696272617279000005010000000017010012436F7079726967687420C2A920203230323200002901002466326362383934302D373863302D343631392D393233302D30323034633965393732613800000C010007312E302E302E3000004D01001C2E4E45544672616D65776F726B2C56657273696F6E3D76342E362E310100540E144672616D65776F726B446973706C61794E616D65142E4E4554204672616D65776F726B20342E362E3104010000000801000000000000000000000000E3D3938D000000000200000060000000483100004813000000000000000000000000000010000000000000000000000000000000525344536F1C64AF93688C47B0378102A99A43C801000000443A5C5265706F7369746F72696F735C4769745C434C525F5261626269745C434C525F5261626269745C4C6962726172795C6F626A5C44656275675C4C6962726172792E70646200D03100000000000000000000EA310000002000000000000000000000000000000000000000000000DC310000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF2500200010000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000000C03000000000000000000000C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0046C020000010053007400720069006E006700460069006C00650049006E0066006F0000004802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D0065000000000000000000380008000100460069006C0065004400650073006300720069007000740069006F006E00000000004C006900620072006100720079000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000038000C00010049006E007400650072006E0061006C004E0061006D00650000004C006900620072006100720079002E0064006C006C0000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003200320000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000040000C0001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004C006900620072006100720079002E0064006C006C000000300008000100500072006F0064007500630074004E0061006D006500000000004C006900620072006100720079000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000C000000FC3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
PRINT N'Update complete.';


GO
