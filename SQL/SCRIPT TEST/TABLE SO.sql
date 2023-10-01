USE [E_MKA]
GO
ALTER TABLE [dbo].[CMS01133003C3] DROP CONSTRAINT [CK__CMS011330__TODAT__04B1AC9D]
GO
ALTER TABLE [dbo].[CMS01133003C3] DROP CONSTRAINT [CK__CMS011330__From___03BD8864]
GO
ALTER TABLE [dbo].[CMS01133003C3] DROP CONSTRAINT [CK__CMS011330__DOCDA__02C9642B]
GO
ALTER TABLE [dbo].[CMS01133002C3] DROP CONSTRAINT [CK__CMS011330__DOCDA__793FF9F1]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__MODIF__6FB68FB7]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__MODIF__6EC26B7E]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__DOCDA__6AF1DA9A]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__CREAT__6DCE4745]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__CREAT__6CDA230C]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__CMS_S__6BE5FED3]
GO
ALTER TABLE [dbo].[CMS01133001C3] DROP CONSTRAINT [CK__CMS011330__CMS_S__69FDB661]
GO
/****** Object:  Table [dbo].[CMS01133007C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133007C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133007C3]
GO
/****** Object:  Table [dbo].[CMS01133006C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133006C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133006C3]
GO
/****** Object:  Table [dbo].[CMS01133005C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133005C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133005C3]
GO
/****** Object:  Table [dbo].[CMS01133004C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133004C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133004C3]
GO
/****** Object:  Table [dbo].[CMS01133003C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133003C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133003C3]
GO
/****** Object:  Table [dbo].[CMS01133002C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133002C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133002C3]
GO
/****** Object:  Table [dbo].[CMS01133001C3]    Script Date: 05/31/2023 10:19:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01133001C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01133001C3]
GO
/****** Object:  Table [dbo].[CMS01133001C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133001C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[CMS_SUBMITTED_DATE] [datetime] NOT NULL,
	[CMS_CONTRACT_NO] [char](21) NOT NULL,
	[CMS_SALES_TYPE] [smallint] NOT NULL,
	[CMS_ORDER_TYPE] [smallint] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[LOCNCODE] [char](11) NOT NULL,
	[LOCNDSCR] [char](31) NOT NULL,
	[CURNCYID] [char](15) NOT NULL,
	[CRNCYDSC] [char](31) NOT NULL,
	[CUSTNMBR] [char](15) NOT NULL,
	[CUSTNAME] [char](65) NOT NULL,
	[PYMTTYPE] [smallint] NOT NULL,
	[PYMTRMID] [char](21) NOT NULL,
	[CMS_CUSTNMBR_BTA] [char](31) NOT NULL,
	[CMS_STUFFING_DATE] [datetime] NOT NULL,
	[CMS_CONT_TYPE] [smallint] NOT NULL,
	[CMS_CONT_NO] [char](25) NOT NULL,
	[CMS_DESC] [char](251) NOT NULL,
	[CMS_Status] [smallint] NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[CREATETIME] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[MODIFTIME] [datetime] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133001C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133002C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133002C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[DOCNUMBR] [char](21) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[CMS_SO_FILENAME] [char](501) NOT NULL,
	[CMS_SO_FILEPATH] [char](501) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133002C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[DOCNUMBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133003C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133003C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[CMS_CONTRACT_NO] [char](21) NOT NULL,
	[CUSTNMBR] [char](15) NOT NULL,
	[CMS_QUOTATION_NO] [char](31) NOT NULL,
	[CMS_QUOTATION_TYPE] [smallint] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[CMS_DESC] [char](251) NOT NULL,
	[From_Date] [datetime] NOT NULL,
	[TODATE] [datetime] NOT NULL,
	[CURNCYID] [char](15) NOT NULL,
	[CMS_DPP] [numeric](19, 5) NOT NULL,
	[CMS_SELECTED] [smallint] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133003C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[CMS_CONTRACT_NO] ASC,
	[CUSTNMBR] ASC,
	[CMS_QUOTATION_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133004C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133004C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[CMS_QUOTATION_NO] [char](31) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[LNSEQNBR] [numeric](19, 5) NOT NULL,
	[CMS_ROUTEID_FROM] [char](21) NOT NULL,
	[CMS_ROUTEID_TO] [char](21) NOT NULL,
	[CMS_CONT_UKURAN_ID] [char](25) NOT NULL,
	[CMS_CONT_UKURAN] [char](51) NOT NULL,
	[CMS_KETERANGAN] [char](501) NOT NULL,
	[CMS_FLAGGING] [smallint] NOT NULL,
	[CMS_STUFF_LOCATION] [char](101) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[UNITPRCE] [numeric](19, 5) NOT NULL,
	[XTNDPRCE] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[TAXDTLID] [char](15) NOT NULL,
	[TXDTLPCT] [numeric](19, 5) NOT NULL,
	[TAXAMNT] [numeric](19, 5) NOT NULL,
	[TOTAL] [numeric](19, 5) NOT NULL,
	[CMS_SELECTED] [smallint] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133004C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[CMS_QUOTATION_NO] ASC,
	[LNITMSEQ] ASC,
	[LNSEQNBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133005C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133005C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[CMS_QUOTATION_NO] [char](31) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[ITEMNMBR] [char](31) NOT NULL,
	[ITEMDESC] [char](101) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[CHRGAMNT] [numeric](19, 5) NOT NULL,
	[TAXAMNT] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[TOTAL] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133005C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[CMS_QUOTATION_NO] ASC,
	[LNITMSEQ] ASC,
	[ITEMNMBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133006C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133006C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[CMS_COMMODITY_DESC] [char](251) NOT NULL,
	[UOFM] [char](9) NOT NULL,
	[UMDPQTYS] [smallint] NOT NULL,
	[QTYSHPPD] [numeric](19, 5) NOT NULL,
	[CMS_WEIGHT] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133006C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[LNITMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01133007C3]    Script Date: 05/31/2023 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01133007C3](
	[CMS_SO_NO] [char](31) NOT NULL,
	[CUSTNMBR] [char](15) NOT NULL,
	[DOCNUMBR] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[CMS_SELECTED] [smallint] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01133007C3] PRIMARY KEY CLUSTERED 
(
	[CMS_SO_NO] ASC,
	[CUSTNMBR] ASC,
	[DOCNUMBR] ASC,
	[LNITMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CMS01133001C3] ON 
GO
INSERT [dbo].[CMS01133001C3] ([CMS_SO_NO], [CMS_SUBMITTED_DATE], [CMS_CONTRACT_NO], [CMS_SALES_TYPE], [CMS_ORDER_TYPE], [DOCDATE], [LOCNCODE], [LOCNDSCR], [CURNCYID], [CRNCYDSC], [CUSTNMBR], [CUSTNAME], [PYMTTYPE], [PYMTRMID], [CMS_CUSTNMBR_BTA], [CMS_STUFFING_DATE], [CMS_CONT_TYPE], [CMS_CONT_NO], [CMS_DESC], [CMS_Status], [CRUSRID], [CREATDDT], [CREATETIME], [MDFUSRID], [MODIFDT], [MODIFTIME], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', CAST(N'2023-05-31T00:00:00.000' AS DateTime), N'CONTRACT/ID/00002    ', 1, 1, CAST(N'2023-05-31T00:00:00.000' AS DateTime), N'010010     ', N'HO                             ', N'IDR            ', N'Rupiah                         ', N'AAM            ', N'PT. ANUGRAH ARGON MEDICA                                         ', 1, N'7 Days               ', N'BILLING                        ', CAST(N'2023-05-31T00:00:00.000' AS DateTime), 1, N'AKLU 6900451             ', N'test data dummy                                                                                                                                                                                                                                            ', 2, N'teg01          ', CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'1900-01-01T09:51:43.530' AS DateTime), N'teg01          ', CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'1900-01-01T09:51:43.530' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CMS01133001C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01133003C3] ON 
GO
INSERT [dbo].[CMS01133003C3] ([CMS_SO_NO], [CMS_CONTRACT_NO], [CUSTNMBR], [CMS_QUOTATION_NO], [CMS_QUOTATION_TYPE], [DOCDATE], [CMS_DESC], [From_Date], [TODATE], [CURNCYID], [CMS_DPP], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'CONTRACT/ID/00002    ', N'AAM            ', N'QUOTATION/00001                ', 2, CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'test abdul 2                                                                                                                                                                                                                                               ', CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'IDR            ', CAST(2.00000 AS Numeric(19, 5)), 1, 1)
GO
INSERT [dbo].[CMS01133003C3] ([CMS_SO_NO], [CMS_CONTRACT_NO], [CUSTNMBR], [CMS_QUOTATION_NO], [CMS_QUOTATION_TYPE], [DOCDATE], [CMS_DESC], [From_Date], [TODATE], [CURNCYID], [CMS_DPP], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'CONTRACT/ID/00002    ', N'AAM            ', N'QUOTATION/00002                ', 2, CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'test abdul 2                                                                                                                                                                                                                                               ', CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'IDR            ', CAST(2.00000 AS Numeric(19, 5)), 1, 2)
GO
SET IDENTITY_INSERT [dbo].[CMS01133003C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01133004C3] ON 
GO
INSERT [dbo].[CMS01133004C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [LNSEQNBR], [CMS_ROUTEID_FROM], [CMS_ROUTEID_TO], [CMS_CONT_UKURAN_ID], [CMS_CONT_UKURAN], [CMS_KETERANGAN], [CMS_FLAGGING], [CMS_STUFF_LOCATION], [QUANTITY], [UNITPRCE], [XTNDPRCE], [SUBTOTAL], [TAXDTLID], [TXDTLPCT], [TAXAMNT], [TOTAL], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00001                ', 16384, CAST(0.00000 AS Numeric(19, 5)), N'JKT                  ', N'RUTE2                ', N'20Dry                    ', N'20Dry                                              ', N'remark baru                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 1, N'jepang                                                                                               ', CAST(1.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), N'30000          ', CAST(10.00000 AS Numeric(19, 5)), CAST(3000.00000 AS Numeric(19, 5)), CAST(33000.00000 AS Numeric(19, 5)), 1, 1)
GO
INSERT [dbo].[CMS01133004C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [LNSEQNBR], [CMS_ROUTEID_FROM], [CMS_ROUTEID_TO], [CMS_CONT_UKURAN_ID], [CMS_CONT_UKURAN], [CMS_KETERANGAN], [CMS_FLAGGING], [CMS_STUFF_LOCATION], [QUANTITY], [UNITPRCE], [XTNDPRCE], [SUBTOTAL], [TAXDTLID], [TXDTLPCT], [TAXAMNT], [TOTAL], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00001                ', 16384, CAST(16384.00000 AS Numeric(19, 5)), N'JKT                  ', N'RUTE2                ', N'20Dry                    ', N'20Dry                                              ', N'remarks detail 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', 1, N'bandung                                                                                              ', CAST(1.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), N'30000          ', CAST(10.00000 AS Numeric(19, 5)), CAST(3000.00000 AS Numeric(19, 5)), CAST(33000.00000 AS Numeric(19, 5)), 1, 2)
GO
INSERT [dbo].[CMS01133004C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [LNSEQNBR], [CMS_ROUTEID_FROM], [CMS_ROUTEID_TO], [CMS_CONT_UKURAN_ID], [CMS_CONT_UKURAN], [CMS_KETERANGAN], [CMS_FLAGGING], [CMS_STUFF_LOCATION], [QUANTITY], [UNITPRCE], [XTNDPRCE], [SUBTOTAL], [TAXDTLID], [TXDTLPCT], [TAXAMNT], [TOTAL], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00002                ', 16384, CAST(0.00000 AS Numeric(19, 5)), N'JKT                  ', N'RUTE2                ', N'20Dry                    ', N'20Dry                                              ', N'remarks clon                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1, N'jepang                                                                                               ', CAST(1.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), N'30000          ', CAST(10.00000 AS Numeric(19, 5)), CAST(3000.00000 AS Numeric(19, 5)), CAST(33000.00000 AS Numeric(19, 5)), 1, 3)
GO
INSERT [dbo].[CMS01133004C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [LNSEQNBR], [CMS_ROUTEID_FROM], [CMS_ROUTEID_TO], [CMS_CONT_UKURAN_ID], [CMS_CONT_UKURAN], [CMS_KETERANGAN], [CMS_FLAGGING], [CMS_STUFF_LOCATION], [QUANTITY], [UNITPRCE], [XTNDPRCE], [SUBTOTAL], [TAXDTLID], [TXDTLPCT], [TAXAMNT], [TOTAL], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00002                ', 16384, CAST(16384.00000 AS Numeric(19, 5)), N'JKT                  ', N'RUTE2                ', N'20Dry                    ', N'20Dry                                              ', N'remarks clon                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1, N'bandung                                                                                              ', CAST(1.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), N'30000          ', CAST(10.00000 AS Numeric(19, 5)), CAST(3000.00000 AS Numeric(19, 5)), CAST(33000.00000 AS Numeric(19, 5)), 1, 4)
GO
SET IDENTITY_INSERT [dbo].[CMS01133004C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01133005C3] ON 
GO
INSERT [dbo].[CMS01133005C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [ITEMNMBR], [ITEMDESC], [QUANTITY], [CHRGAMNT], [TAXAMNT], [SUBTOTAL], [TOTAL], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00001                ', 16384, N'AU-100T                        ', N'AU-100T                                                                                              ', CAST(1.00000 AS Numeric(19, 5)), CAST(2000.00000 AS Numeric(19, 5)), CAST(200.00000 AS Numeric(19, 5)), CAST(2200.00000 AS Numeric(19, 5)), CAST(2200.00000 AS Numeric(19, 5)), 1)
GO
INSERT [dbo].[CMS01133005C3] ([CMS_SO_NO], [CMS_QUOTATION_NO], [LNITMSEQ], [ITEMNMBR], [ITEMDESC], [QUANTITY], [CHRGAMNT], [TAXAMNT], [SUBTOTAL], [TOTAL], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'QUOTATION/00002                ', 16384, N'AU-100T                        ', N'AU-100T                                                                                              ', CAST(2.00000 AS Numeric(19, 5)), CAST(2000.00000 AS Numeric(19, 5)), CAST(200.00000 AS Numeric(19, 5)), CAST(2200.00000 AS Numeric(19, 5)), CAST(2200.00000 AS Numeric(19, 5)), 2)
GO
SET IDENTITY_INSERT [dbo].[CMS01133005C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01133006C3] ON 
GO
INSERT [dbo].[CMS01133006C3] ([CMS_SO_NO], [LNITMSEQ], [CMS_COMMODITY_DESC], [UOFM], [UMDPQTYS], [QTYSHPPD], [CMS_WEIGHT], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', 16384, N'coommodity 1 free text                                                                                                                                                                                                                                     ', N'PCS      ', 1, CAST(1.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), 1)
GO
INSERT [dbo].[CMS01133006C3] ([CMS_SO_NO], [LNITMSEQ], [CMS_COMMODITY_DESC], [UOFM], [UMDPQTYS], [QTYSHPPD], [CMS_WEIGHT], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', 32768, N'coommodity 2 test                                                                                                                                                                                                                                          ', N'PCS      ', 1, CAST(1.00000 AS Numeric(19, 5)), CAST(1.00000 AS Numeric(19, 5)), 2)
GO
SET IDENTITY_INSERT [dbo].[CMS01133006C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01133007C3] ON 
GO
INSERT [dbo].[CMS01133007C3] ([CMS_SO_NO], [CUSTNMBR], [DOCNUMBR], [DSCRIPTN], [QUANTITY], [LNITMSEQ], [CMS_SELECTED], [DEX_ROW_ID]) VALUES (N'SO/2305/0001                   ', N'AAM            ', N'SJ                   ', N'Surat Jalan                    ', CAST(1.00000 AS Numeric(19, 5)), 16384, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[CMS01133007C3] OFF
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CMS_SUBMITTED_DATE])=(0) AND datepart(minute,[CMS_SUBMITTED_DATE])=(0) AND datepart(second,[CMS_SUBMITTED_DATE])=(0) AND datepart(millisecond,[CMS_SUBMITTED_DATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CMS_STUFFING_DATE])=(0) AND datepart(minute,[CMS_STUFFING_DATE])=(0) AND datepart(second,[CMS_STUFFING_DATE])=(0) AND datepart(millisecond,[CMS_STUFFING_DATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(day,[CREATETIME])=(1) AND datepart(month,[CREATETIME])=(1) AND datepart(year,[CREATETIME])=(1900)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[DOCDATE])=(0) AND datepart(minute,[DOCDATE])=(0) AND datepart(second,[DOCDATE])=(0) AND datepart(millisecond,[DOCDATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01133001C3]  WITH CHECK ADD CHECK  ((datepart(day,[MODIFTIME])=(1) AND datepart(month,[MODIFTIME])=(1) AND datepart(year,[MODIFTIME])=(1900)))
GO
ALTER TABLE [dbo].[CMS01133002C3]  WITH CHECK ADD CHECK  ((datepart(hour,[DOCDATE])=(0) AND datepart(minute,[DOCDATE])=(0) AND datepart(second,[DOCDATE])=(0) AND datepart(millisecond,[DOCDATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01133003C3]  WITH CHECK ADD CHECK  ((datepart(hour,[DOCDATE])=(0) AND datepart(minute,[DOCDATE])=(0) AND datepart(second,[DOCDATE])=(0) AND datepart(millisecond,[DOCDATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01133003C3]  WITH CHECK ADD CHECK  ((datepart(hour,[From_Date])=(0) AND datepart(minute,[From_Date])=(0) AND datepart(second,[From_Date])=(0) AND datepart(millisecond,[From_Date])=(0)))
GO
ALTER TABLE [dbo].[CMS01133003C3]  WITH CHECK ADD CHECK  ((datepart(hour,[TODATE])=(0) AND datepart(minute,[TODATE])=(0) AND datepart(second,[TODATE])=(0) AND datepart(millisecond,[TODATE])=(0)))
GO
