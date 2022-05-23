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
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103009A1E54FE0000000000000000E00022200B0130000016000000060000000000004E340000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000FC3300004F000000004000006803000000000000000000000000000000000000006000000C00000064330000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000054140000002000000016000000020000000000000000000000000000200000602E7273726300000068030000004000000004000000180000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001C0000000000000000000000000000400000420000000000000000000000000000000030340000000000004800000002000500282300003C10000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E027B010000042A2202037D010000042A1E027B020000042A2202037D020000042A1E027B030000042A2202037D030000042A1E027B040000042A2202037D040000042A2202281200000A002A0000001B3004003B0200000100001100281300000A72010000706F1400000A00720F0000700A281300000A728D0000706F1400000A00281300000A066F1400000A0073090000060B07146F02000006000772950000706F04000006000772B90000706F06000006000772030100706F080000060072110100700C721D0100700D7231010070281500000A08724701007009281600000A6F1700000A281800000A1304281300000A724B0100706F1400000A00281300000A11046F1400000A00725B0100701305281300000A725E0200706F1400000A00281300000A11056F1400000A007E1900000A13060F03281A00000A2D090F03281B00000A2B05726802007013070006281C00000A1308110872740200706F1D00000A001108727E0200706F1E00000A0011086F1F00000A72A002007072BC0200701104282000000A6F2100000A0011086F2200000A732300000A130C00110C11056F2400000A00110C6F2500000A0000DE0D110C2C08110C6F2600000A00DC11086F2700000A74170000011309281300000A72CA0200706F1400000A0011096F2800000A130A281300000A72DC0200706F1400000A00110A1107281500000A732900000A130B281300000A72EA0200706F1400000A00110B6F2A00000A1306281300000A72040300706F1400000A00281300000A11066F1400000A0011096F2B00000A00110A2D022B08110A282C00000A00110B6F2D00000A0000DE28130D00281300000A72160300706F1400000A00281300000A110D6F2E00000A6F1400000A0000DE000E041106282F00000A81150000012A0041340000020000004301000016000000590100000D0000000000000000000000F40000001001000004020000280000001B0000012202281200000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C000000CC040000237E0000380500002406000023537472696E6773000000005C0B00002C03000023555300880E0000100000002347554944000000980E0000A401000023426C6F6200000000000000020000015715A2010900000000FA013300160000010000002700000003000000040000000B000000090000002F0000001F0000000100000001000000040000000800000001000000030000000000B4030100000000000600AA020D05060017030D050600AD01DB040F002D0500000600F001FC0306008D02FC0306006E02FC030600FE02FC030600CA02FC030600E302FC0306001D02FC030600DC01EE0406009F01EE0406005102FC03060038027B0306009905F503060084010D0506006701DB040600C101DB040A000702BA040A00A4035A050E00CE05A0050E003D01A0050600EE030A0006008A040A000600A2040A0006003604F5030A00E905BA040A002501BA0406004803DD050600A703F5030600C605F5030E00D205A0050E002204A0050E000E0457000600AF040A0006001001F5030E004101A005060097040A000000000001000000000001000100010010006A04000041000100010001001000AB050000410005000A000100B10056000100CD00560001007600560001008F00560050200000000086083C055D00010058200000000086084B05100001006120000000008608F4055D000200692000000000860804061000020072200000000086083B005D0003007A20000000008608470010000300832000000000860851035D0004008B200000000086086603100004009420000000008618D50406000500A0200000000096004F04A10005001C23000000008618D50406000A00000001003F03000001003F03000001003F03000001003F0300000100CB030000020060040000030078050000040040040200050014000900D50401001100D50406001900D5040A002900D50410003100D50410003900D50410004100D50410004900D50410005100D50410005900D50410006100D50415006900D50410007100D50410007900D50410008900D50406009900D5041A00A100D50406008100D5040600E1001C013800E900F4001000F10045033D00F90092054300F1006F054A00010195035000F9001C065600A900C0035900A90035035D0009017F0461000901F900100009012D011000090186056700F90092056D001901530073000901E4037900D100D5047E0021017E0110002101AE03060029015F01060009014D0184003101D2037900C900D5048A003901EA005D00310159010600C1005F01060039015F010600D90004015D00A900BA05920020007B00950121007B009501210083009A012E000B00B4002E001300BD002E001B00DC002E002300E5002E002B00F2002E003300F2002E003B00F2002E004300E5002E004B00F8002E005300F2002E005B00F2002E00630010012E006B003A012E007300470140007B00950141007B009501410083009A0160007B00950161007B009501610083009A0180007B00950181007B009501810083009A01A0007B009501C0007B009501E0007B00950100017B00950140018B00950120000200010000004F05B00000000806B00000004B00B00000006A03B00002000100030001000200030002000300050001000400050002000500070001000600070002000700090001000800090004800000010000000000000000000000000014060000040000000000000000000000980032000000000004000000000000000000000098002600000000000400000000000000000000009800F503000000000000003C4D6F64756C653E0053797374656D2E494F0044735F5265746F726E6F5F4F55545055540053797374656D2E44617461006D73636F726C6962006765745F7061796C6F6164007365745F7061796C6F6164004164640053797374656D2E436F6C6C656374696F6E732E5370656369616C697A6564003C7061796C6F61643E6B5F5F4261636B696E674669656C64003C7061796C6F61645F656E636F64696E673E6B5F5F4261636B696E674669656C64003C70726F706572746965733E6B5F5F4261636B696E674669656C64003C726F7574696E675F6B65793E6B5F5F4261636B696E674669656C640052656164546F456E640053656E64007365745F4D6574686F64006765745F4D6573736167650049446973706F7361626C65006765745F506970650053716C50697065007365745F436F6E74656E74547970650048747470576562526573706F6E736500476574526573706F6E736500436C6F736500446973706F736500446562756767657242726F777361626C65537461746500577269746500436F6D70696C657247656E65726174656441747472696275746500477569644174747269627574650044656275676761626C6541747472696275746500446562756767657242726F777361626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C697479417474726962757465006765745F56616C75650076616C756500476574456E636F64696E67006765745F7061796C6F61645F656E636F64696E67007365745F7061796C6F61645F656E636F64696E670053797374656D2E52756E74696D652E56657273696F6E696E6700546F426173653634537472696E670053716C537472696E6700466C757368004C6962726172792E646C6C006765745F49734E756C6C0044735F55726C00476574526573706F6E736553747265616D004765745265717565737453747265616D0053797374656D0053797374656D2E5265666C656374696F6E004E616D6556616C7565436F6C6C656374696F6E00576562486561646572436F6C6C656374696F6E00457863657074696F6E0044735F436F64696669636163616F0073747057735F5265717569736963616F0044735F4D65746F646F004765745261626269744170694E6577446F63746F00437265617465487474700053747265616D52656164657200546578745265616465720053747265616D5772697465720054657874577269746572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F646573006765745F70726F70657274696573007365745F70726F706572746965730053797374656D2E446174612E53716C54797065730047657442797465730044735F506172616D6574726F73006765745F4865616465727300436F6E636174004F626A6563740053797374656D2E4E657400526571756573745F526162626974006F705F496D706C6963697400436F6E766572740048747470576562526571756573740053797374656D2E546578740053716C436F6E74657874006765745F726F7574696E675F6B6579007365745F726F7574696E675F6B6579004C69627261727900456D707479000000000D49006E006900630069006F00007D68007400740070003A002F002F006C006F00630061006C0068006F00730074003A00310035003600370032002F006100700069002F00650078006300680061006E006700650073002F002500320066002F007200650063006500690076006500500065006400690064006F002F007000750062006C006900730068000007550052004C0000237200650063006500690076006500500065006400690064006F00460069006C0061000049300031004400350042003100350037002D0030003500430044002D0034004400300043002D0039003800460038002D00350031003000360035004300390038004300340039003700010D73007400720069006E006700000B6100670075006900610000136100670075006900610032003000320032000015490053004F002D0038003800350039002D00310001033A00000F65006E0063006F006400650064000081017B002200700072006F00700065007200740069006500730022003A0022007B007D0022002C00220072006F007500740069006E0067005F006B006500790022003A0022007200650063006500690076006500500065006400690064006F00460069006C006100220022007000610079006C006F006100640022003A002200300031004400350042003100350037002D0030003500430044002D0034004400300043002D0039003800460038002D00350031003000360035004300390038004300340039003700220022007000610079006C006F00610064005F0065006E0063006F00640069006E00670022003A00220073007400720069006E00670022007D0001096A0073006F006E00000B5500540046002D003800010950004F005300540000216100700070006C00690063006100740069006F006E002F006A0073006F006E00001B41007500740068006F00720069007A006100740069006F006E00000D420061007300690063002000001172006500730070006F006E0073006500000D730074007200650061006D000019730074007200650061006D00520065006100640065007200001166006500650064004400610074006100001345007800630065007000740069006F006E0000000052C7B7836E91774FA605D2AC6573297500042001010803200001052001011111042001010E042001010205200101114917070E0E12080E0E0E0E0E0E1259125D126112651269126D040000127505000112790E0600030E0E0E0E0520011D050E0500010E1D0502060E032000020320000E05000112590E0520001280890500020E0E0E052002010E0E0420001261052001011261052000128099072002011261127905000111550E08B77A5C561934E0890E00050111551155115511551011550328000E0801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000C0100074C696272617279000005010000000017010012436F7079726967687420C2A920203230323200002901002466326362383934302D373863302D343631392D393233302D30323034633965393732613800000C010007312E302E302E3000004D01001C2E4E45544672616D65776F726B2C56657273696F6E3D76342E362E310100540E144672616D65776F726B446973706C61794E616D65142E4E4554204672616D65776F726B20342E362E31040100000008010000000000000000000000006BF62E9D0000000002000000600000009C3300009C1500000000000000000000000000001000000000000000000000000000000052534453477651002B133042B581F5E8EAB3B34701000000443A5C5265706F7369746F72696F735C4769745C434C525F5261626269745C434C525F5261626269745C4C6962726172795C6F626A5C44656275675C4C6962726172792E706462002434000000000000000000003E34000000200000000000000000000000000000000000000000000030340000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000000C03000000000000000000000C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0046C020000010053007400720069006E006700460069006C00650049006E0066006F0000004802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D0065000000000000000000380008000100460069006C0065004400650073006300720069007000740069006F006E00000000004C006900620072006100720079000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000038000C00010049006E007400650072006E0061006C004E0061006D00650000004C006900620072006100720079002E0064006C006C0000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003200320000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000040000C0001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004C006900620072006100720079002E0064006C006C000000300008000100500072006F0064007500630074004E0061006D006500000000004C006900620072006100720079000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000C000000503400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
PRINT N'Update complete.';


GO
