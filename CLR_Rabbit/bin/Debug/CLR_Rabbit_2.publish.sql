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
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
PRINT N'Creating Assembly [Library]...';


GO
CREATE ASSEMBLY [Library]
    AUTHORIZATION [dbo]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300AD1B3A9A0000000000000000E00022200B013000000E000000060000000000009A2C0000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000482C00004F000000004000006803000000000000000000000000000000000000006000000C000000B02B0000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000A00C000000200000000E000000020000000000000000000000000000200000602E7273726300000068030000004000000004000000100000000000000000000000000000400000402E72656C6F6300000C00000000600000000200000014000000000000000000000000000040000042000000000000000000000000000000007C2C0000000000004800000002000500DC210000D409000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3004006401000001000011000F02281000000A2D090F02281100000A2B0572010000700A0F01281000000A2D0E0F01281100000A6F1200000A2B0572030000700B0F00281100000A0C7E1300000A0D0F03281000000A2D090F03281100000A2B05720B00007013040008281400000A741300000113051105076F1500000A00110572170000706F1600000A0007725B000070281700000A2C0B066F1800000A16FE022B0116130911092C400006130A281900000A110A6F1A00000A130B1105110B8E696A6F1B00000A0011056F1C00000A130C110C110B16110B8E696F1D00000A00110C6F1E00000A000011056F1F00000A7414000001130611066F2000000A130711071104282100000A732200000A130811086F2300000A0D11066F2400000A0011072D022B081107282500000A0011086F2600000A0000DE26130D00282700000A14FE03130E110E2C12282700000A110D6F2800000A6F2900000A0000DE000E0409282A00000A81120000012A0110000000005D00D3300126170000012202282B00000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C00000008030000237E0000740300006004000023537472696E677300000000D407000068000000235553003C0800001000000023475549440000004C0800008801000023426C6F620000000000000002000001471502000900000000FA013300160000010000001E0000000200000002000000050000002B0000000F000000010000000100000003000000000094020100000000000600B201950306001F0295030600D00063030F00B50300000600F800DC0206009501DC0206007601DC0206000602DC020600D201DC020600EB01DC0206002501DC020600E40076030600C200760306005901DC020600400153020600F003D5020A000F0142030A006D02C4030E001D04F7030E008B00F7030600CE0213000600220313000600EE02D50206007002D5020E002104F70306004A022C040E008F00F70306002F0313000A00380442030A0073004203000000000A00000000000100010001001000020400004100010001005020000000009600070392000100D0210000000086185D030600060000000100AB0200000200180300000300E20300000400F802020005001D0009005D03010011005D03060019005D030A0029005D03100031005D03100039005D03100041005D03100049005D03100051005D03100059005D03100061005D03150069005D03100071005D03100079005D03100089005D0306009100A002330091003D023700C1003A033700C10057043B00C900B5003E00C90053001000C9007B001000C1004B044400C10077024A00D10001004E00D100D9035300C90082025900C900C4025E00A900BC006300A900A7000600C9009B006B00D900B2025E00D10047027000B1005D037600E10044003700D900A7000600A900AD000600E100AD000600E9006A007E00B9005E003700F1004E00100091001104830081005D03060020007B0082012E000B00A1002E001300AA002E001B00C9002E002300D2002E002B00DF002E003300DF002E003B00DF002E004300D2002E004B00E5002E005300DF002E005B00DF002E006300FD002E006B0027012E00730034011A000480000001000000000000000000000000004304000004000000000000000000000089003B000000000004000000000000000000000089002F00000000000400000000000000000000008900D5020000000000000000006765745F55544638003C4D6F64756C653E0053797374656D2E494F0044735F5265746F726E6F5F4F55545055540053797374656D2E44617461006D73636F726C69620052656164546F456E640053656E64007365745F4D6574686F64006765745F4D657373616765006765745F506970650053716C50697065007365745F436F6E74656E74547970650048747470576562526573706F6E736500476574526573706F6E736500436C6F736500446973706F73650043726561746500577269746500477569644174747269627574650044656275676761626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C697479417474726962757465006765745F56616C756500476574456E636F64696E670053797374656D2E52756E74696D652E56657273696F6E696E670053716C537472696E67006765745F4C656E677468007365745F436F6E74656E744C656E677468004C6962726172792E646C6C006765745F49734E756C6C0044735F55726C00476574526573706F6E736553747265616D004765745265717565737453747265616D0053797374656D0053797374656D2E5265666C656374696F6E00457863657074696F6E0044735F436F64696669636163616F0073747057735F5265717569736963616F0044735F4D65746F646F0053747265616D526561646572005465787452656164657200546F5570706572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F6465730053797374656D2E446174612E53716C54797065730047657442797465730044735F506172616D6574726F73004F626A6563740053797374656D2E4E657400526571756573745F526162626974006F705F496D706C696369740048747470576562526571756573740053797374656D2E546578740053716C436F6E74657874004C696272617279006F705F457175616C69747900456D7074790000000000010007470045005400000B5500540046002D00380001436100700070006C00690063006100740069006F006E002F0078002D007700770077002D0066006F0072006D002D00750072006C0065006E0063006F00640065006400010950004F00530054000000000006646EA1346A0A4C9B8D97CD78A8341400042001010803200001052001011111042001010E042001010218070F0E0E0E0E0E124D125112551259020E1D051255125D02032000020320000E02060E05000112650E050002020E0E0320000804000012690520011D050E042001010A0420001255072003011D050808042000126D05000112690E0720020112551269040000127905000111490E08B77A5C561934E0890E00050111491149114911491011490801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000C0100074C696272617279000005010000000017010012436F7079726967687420C2A920203230323200002901002466326362383934302D373863302D343631392D393233302D30323034633965393732613800000C010007312E302E302E3000004D01001C2E4E45544672616D65776F726B2C56657273696F6E3D76342E362E310100540E144672616D65776F726B446973706C61794E616D65142E4E4554204672616D65776F726B20342E362E310401000000000000000061B369B3000000000200000060000000E82B0000E80D00000000000000000000000000001000000000000000000000000000000052534453B06B1F081870784698AB5639DA50B7F801000000443A5C5265706F7369746F72696F735C4769745C434C525F5261626269745C434C525F5261626269745C4C6962726172795C6F626A5C44656275675C4C6962726172792E70646200702C000000000000000000008A2C00000020000000000000000000000000000000000000000000007C2C0000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF250020001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000000C03000000000000000000000C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0046C020000010053007400720069006E006700460069006C00650049006E0066006F0000004802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D0065000000000000000000380008000100460069006C0065004400650073006300720069007000740069006F006E00000000004C006900620072006100720079000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000038000C00010049006E007400650072006E0061006C004E0061006D00650000004C006900620072006100720079002E0064006C006C0000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003200320000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000040000C0001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004C006900620072006100720079002E0064006C006C000000300008000100500072006F0064007500630074004E0061006D006500000000004C006900620072006100720079000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C0000009C3C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    WITH PERMISSION_SET = EXTERNAL_ACCESS;


GO
PRINT N'Creating Procedure [dbo].[stpWs_Requisicao]...';


GO
CREATE PROCEDURE [dbo].[stpWs_Requisicao]
@Ds_Url NVARCHAR (MAX) NULL, @Ds_Metodo NVARCHAR (MAX) NULL, @Ds_Parametros NVARCHAR (MAX) NULL, @Ds_Codificacao NVARCHAR (MAX) NULL, @Ds_Retorno_OUTPUT NVARCHAR (MAX) NULL OUTPUT
AS EXTERNAL NAME [Library].[Request_Rabbit].[stpWs_Requisicao]


GO
PRINT N'Update complete.';


GO
