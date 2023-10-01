
/****** Object:  Table [dbo].[GNL01001006C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GNL01001006C3]') AND type in (N'U'))
DROP TABLE [dbo].[GNL01001006C3]
GO
/****** Object:  Table [dbo].[CMS01036010C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036010C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036010C3]
GO
/****** Object:  Table [dbo].[CMS01036009C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036009C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036009C3]
GO
/****** Object:  Table [dbo].[CMS01036008C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036008C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036008C3]
GO
/****** Object:  Table [dbo].[CMS01036007C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036007C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036007C3]
GO
/****** Object:  Table [dbo].[CMS01036006C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036006C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036006C3]
GO
/****** Object:  Table [dbo].[CMS01036005C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036005C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036005C3]
GO
/****** Object:  Table [dbo].[CMS01036004C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036004C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036004C3]
GO
/****** Object:  Table [dbo].[CMS01036003C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036003C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036003C3]
GO
/****** Object:  Table [dbo].[CMS01036002C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036002C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036002C3]
GO
/****** Object:  Table [dbo].[CMS01036001C3]    Script Date: 05/29/2023 14:13:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01036001C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01036001C3]
GO
/****** Object:  Table [dbo].[CMS01036001C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036001C3](
	[INTERID] [char](5) NOT NULL,
	[CMS_SO_ID] [char](15) NOT NULL,
	[CMS_NSO_ID] [char](15) NOT NULL,
	[CMS_Rental_ID] [char](15) NOT NULL,
	[CMS_Contract_ID] [char](15) NOT NULL,
	[CMS_Quotation_ID] [char](15) NOT NULL,
	[CMS_Planning_ID] [char](15) NOT NULL,
	[CMS_Unpanning_ID] [char](15) NOT NULL,
	[CMS_DO_ID] [char](15) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036001C3] PRIMARY KEY CLUSTERED 
(
	[INTERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036002C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036002C3](
	[CMS_Route_ID] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036002C3] PRIMARY KEY CLUSTERED 
(
	[CMS_Route_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036003C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036003C3](
	[CMS_Vehicle_Code] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[INACTIVE] [tinyint] NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036003C3] PRIMARY KEY CLUSTERED 
(
	[CMS_Vehicle_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036004C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036004C3](
	[CMS_Status_Code] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[INACTIVE] [tinyint] NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036004C3] PRIMARY KEY CLUSTERED 
(
	[CMS_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036005C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036005C3](
	[DOCNUMBR] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036005C3] PRIMARY KEY CLUSTERED 
(
	[DOCNUMBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036006C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036006C3](
	[ITEMNMBR] [char](31) NOT NULL,
	[ITEMDESC] [char](101) NOT NULL,
	[CMS_Route_From] [char](21) NOT NULL,
	[CMS_Route_To] [char](21) NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036006C3] PRIMARY KEY CLUSTERED 
(
	[ITEMNMBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036007C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036007C3](
	[ITEMNMBR] [char](31) NOT NULL,
	[CMS_Item_Number] [char](31) NOT NULL,
	[UOFM] [char](9) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[UNITPRCE] [numeric](19, 5) NOT NULL,
	[CMS_CB] [tinyint] NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036007C3] PRIMARY KEY CLUSTERED 
(
	[ITEMNMBR] ASC,
	[LNITMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036008C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036008C3](
	[CMS_Status_Code] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[CMS_Vehicle_Code] [char](21) NOT NULL,
	[CMS_Description] [char](31) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036008C3] PRIMARY KEY CLUSTERED 
(
	[CMS_Status_Code] ASC,
	[CMS_Vehicle_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036009C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036009C3](
	[CUSTNMBR] [char](15) NOT NULL,
	[CUSTNAME] [char](65) NOT NULL,
	[INACTIVE] [tinyint] NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036009C3] PRIMARY KEY CLUSTERED 
(
	[CUSTNMBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01036010C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01036010C3](
	[CUSTNMBR] [char](15) NOT NULL,
	[DOCNUMBR] [char](21) NOT NULL,
	[DSCRIPTN] [char](31) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[STRGA255] [char](255) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKCMS01036010C3] PRIMARY KEY CLUSTERED 
(
	[CUSTNMBR] ASC,
	[DOCNUMBR] ASC,
	[LNITMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GNL01001006C3]    Script Date: 05/29/2023 14:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GNL01001006C3](
	[GNL_Container_No] [char](15) NOT NULL,
	[GNL_DDL_Type_Container] [smallint] NOT NULL,
	[GNL_DDL_Type_Container_2] [smallint] NOT NULL,
	[GNL_DDL_DamageStatus] [smallint] NOT NULL,
	[GNL_DDL_Kepemilikan] [smallint] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PKGNL01001006C3] PRIMARY KEY CLUSTERED 
(
	[GNL_Container_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CMS01036001C3] ON 
GO
INSERT [dbo].[CMS01036001C3] ([INTERID], [CMS_SO_ID], [CMS_NSO_ID], [CMS_Rental_ID], [CMS_Contract_ID], [CMS_Quotation_ID], [CMS_Planning_ID], [CMS_Unpanning_ID], [CMS_DO_ID], [DEX_ROW_ID]) VALUES (N'     ', N'SO             ', N'NSO            ', N'RENTAL         ', N'CM             ', N'               ', N'               ', N'               ', N'               ', 1)
GO
SET IDENTITY_INSERT [dbo].[CMS01036001C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036002C3] ON 
GO
INSERT [dbo].[CMS01036002C3] ([CMS_Route_ID], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'AMBON                ', N'Ambon                          ', N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 4)
GO
INSERT [dbo].[CMS01036002C3] ([CMS_Route_ID], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'JKT                  ', N'Jakarta                        ', N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 5)
GO
INSERT [dbo].[CMS01036002C3] ([CMS_Route_ID], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'RUTE1                ', N'jakarta                        ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 1)
GO
INSERT [dbo].[CMS01036002C3] ([CMS_Route_ID], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'RUTE2                ', N'surabaya                       ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 2)
GO
INSERT [dbo].[CMS01036002C3] ([CMS_Route_ID], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'RUTE3                ', N'makasar                        ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 3)
GO
SET IDENTITY_INSERT [dbo].[CMS01036002C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036003C3] ON 
GO
INSERT [dbo].[CMS01036003C3] ([CMS_Vehicle_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'KRT                  ', N'Kereta                         ', 0, N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 3)
GO
INSERT [dbo].[CMS01036003C3] ([CMS_Vehicle_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'SHIP                 ', N'Ship                           ', 0, N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 4)
GO
INSERT [dbo].[CMS01036003C3] ([CMS_Vehicle_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'VHC02                ', N'zennix                         ', 0, N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 2)
GO
SET IDENTITY_INSERT [dbo].[CMS01036003C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036004C3] ON 
GO
INSERT [dbo].[CMS01036004C3] ([CMS_Status_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'STATUS1              ', N'bagus                          ', 1, N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 1)
GO
INSERT [dbo].[CMS01036004C3] ([CMS_Status_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'STATUS2              ', N'jelek                          ', 0, N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 2)
GO
INSERT [dbo].[CMS01036004C3] ([CMS_Status_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'STATUS3              ', N'rusak                          ', 0, N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 3)
GO
INSERT [dbo].[CMS01036004C3] ([CMS_Status_Code], [DSCRIPTN], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'STUFFING             ', N'Stuffng                        ', 0, N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 4)
GO
SET IDENTITY_INSERT [dbo].[CMS01036004C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036005C3] ON 
GO
INSERT [dbo].[CMS01036005C3] ([DOCNUMBR], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'DOC002               ', N'test2                          ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 2)
GO
INSERT [dbo].[CMS01036005C3] ([DOCNUMBR], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'DOC003               ', N'test3                          ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 3)
GO
INSERT [dbo].[CMS01036005C3] ([DOCNUMBR], [DSCRIPTN], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [NOTEINDX], [DEX_ROW_ID]) VALUES (N'SJ                   ', N'Surat Jalan                    ', N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00000 AS Numeric(19, 5)), 4)
GO
SET IDENTITY_INSERT [dbo].[CMS01036005C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036006C3] ON 
GO
INSERT [dbo].[CMS01036006C3] ([ITEMNMBR], [ITEMDESC], [CMS_Route_From], [CMS_Route_To], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AGENT-BURU                     ', N'OPEX-AGENT LABOR&OPS EXPENSES                                                                        ', N'AMBON                ', N'JKT                  ', N'ARTHA001       ', CAST(N'2023-05-23T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[CMS01036006C3] ([ITEMNMBR], [ITEMDESC], [CMS_Route_From], [CMS_Route_To], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AGENT-BURU-DRY20-AMQ           ', N'AGENT LABOR&OPS DRY20 AMBON                                                                          ', N'RUTE1                ', N'RUTE2                ', N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-05-09T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[CMS01036006C3] ([ITEMNMBR], [ITEMDESC], [CMS_Route_From], [CMS_Route_To], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AGENT-HAN                      ', N'OPEX-AGENT HANDLING EXPENSES                                                                         ', N'JKT                  ', N'AMBON                ', N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2023-05-12T00:00:00.000' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[CMS01036006C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036007C3] ON 
GO
INSERT [dbo].[CMS01036007C3] ([ITEMNMBR], [CMS_Item_Number], [UOFM], [QUANTITY], [UNITPRCE], [CMS_CB], [LNITMSEQ], [DEX_ROW_ID]) VALUES (N'AGENT-BURU-DRY20-AMQ           ', N'AGENT-BURU-DRY20-AMQ           ', N'UNIT     ', CAST(10.00000 AS Numeric(19, 5)), CAST(200000.00000 AS Numeric(19, 5)), 1, 16384, 1)
GO
INSERT [dbo].[CMS01036007C3] ([ITEMNMBR], [CMS_Item_Number], [UOFM], [QUANTITY], [UNITPRCE], [CMS_CB], [LNITMSEQ], [DEX_ROW_ID]) VALUES (N'AGENT-HAN                      ', N'AGENT-BURU                     ', N'UNIT     ', CAST(1.00000 AS Numeric(19, 5)), CAST(30000.00000 AS Numeric(19, 5)), 1, 16384, 4)
GO
INSERT [dbo].[CMS01036007C3] ([ITEMNMBR], [CMS_Item_Number], [UOFM], [QUANTITY], [UNITPRCE], [CMS_CB], [LNITMSEQ], [DEX_ROW_ID]) VALUES (N'AGENT-HAN                      ', N'AGENT-BURU-DRY20-AMI           ', N'UNIT     ', CAST(2.00000 AS Numeric(19, 5)), CAST(40000.00000 AS Numeric(19, 5)), 1, 32768, 5)
GO
SET IDENTITY_INSERT [dbo].[CMS01036007C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036008C3] ON 
GO
INSERT [dbo].[CMS01036008C3] ([CMS_Status_Code], [DSCRIPTN], [CMS_Vehicle_Code], [CMS_Description], [DEX_ROW_ID]) VALUES (N'STATUS1              ', N'bagus                          ', N'VHC01                ', N'kijang                         ', 100)
GO
INSERT [dbo].[CMS01036008C3] ([CMS_Status_Code], [DSCRIPTN], [CMS_Vehicle_Code], [CMS_Description], [DEX_ROW_ID]) VALUES (N'STATUS1              ', N'bagus                          ', N'VHC02                ', N'zennix                         ', 101)
GO
INSERT [dbo].[CMS01036008C3] ([CMS_Status_Code], [DSCRIPTN], [CMS_Vehicle_Code], [CMS_Description], [DEX_ROW_ID]) VALUES (N'STUFFING             ', N'Stuffng                        ', N'KRT                  ', N'Kereta                         ', 102)
GO
SET IDENTITY_INSERT [dbo].[CMS01036008C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036009C3] ON 
GO
INSERT [dbo].[CMS01036009C3] ([CUSTNMBR], [CUSTNAME], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AAC            ', N'ANUGRAH ABADI CITRARASA, PT                                      ', 0, N'sa             ', CAST(N'2023-05-10T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2023-05-29T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[CMS01036009C3] ([CUSTNMBR], [CUSTNAME], [INACTIVE], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AAM            ', N'ANUGRAH ARGON MEDICA, PT                                         ', 0, N'ARTHA001       ', CAST(N'2023-05-29T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[CMS01036009C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01036010C3] ON 
GO
INSERT [dbo].[CMS01036010C3] ([CUSTNMBR], [DOCNUMBR], [DSCRIPTN], [QUANTITY], [STRGA255], [LNITMSEQ], [DEX_ROW_ID]) VALUES (N'AAM            ', N'SJ                   ', N'Surat Jalan                    ', CAST(1.00000 AS Numeric(19, 5)), N'                                                                                                                                                                                                                                                               ', 16384, 5)
GO
SET IDENTITY_INSERT [dbo].[CMS01036010C3] OFF
GO
SET IDENTITY_INSERT [dbo].[GNL01001006C3] ON 
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AKLU 6900451   ', 4, 1, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2023-05-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'APLU 5055649   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2023-02-23T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'APRU 5065649   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2022-12-09T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'APRU 5089091   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0607020   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2022-12-23T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0617000   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0617020   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2022-12-14T00:00:00.000' AS DateTime), 7)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0702011   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'ARTHA001       ', CAST(N'2022-12-14T00:00:00.000' AS DateTime), 8)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0709490   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0709590   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 10)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 0910018   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 11)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 1110040   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 12)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 1675768   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 13)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 1677729   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 14)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 1685494   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 15)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 1685495   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 16)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 2000036   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 17)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 3960280   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 18)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 3961128   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 19)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5215272   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5496019   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 21)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5797350   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 22)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5802865   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 23)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5826145   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 24)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5826785   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 25)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 5828889   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 26)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 6017020   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 27)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 6024444   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 28)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 6025498   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 29)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 6028264   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 30)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 6125975   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 31)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7161713   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 32)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7162556   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 33)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7168997   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 34)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7174412   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 35)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7247307   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 36)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 7274307   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 37)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASCU 9204334   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2022-12-22T00:00:00.000' AS DateTime), 38)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ASZU 5828889   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2022-12-22T00:00:00.000' AS DateTime), 39)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'AXIU 6223271   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 40)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BEAU 4863178   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 41)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BEAU 4874995   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 42)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 5409190   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 43)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 6384543   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 44)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900016   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 45)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900017   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 46)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900021   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 47)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900037   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 48)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900042   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 49)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900058   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 50)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900063   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 51)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900078   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 52)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900079   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 53)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900084   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 54)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900090   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 55)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900103   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 56)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900116   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 57)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900119   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 58)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900124   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 59)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900130   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 60)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900145   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 61)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900150   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 62)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900166   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 63)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900171   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 64)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900187   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 65)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900192   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 66)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900206   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 67)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900211   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 68)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900227   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 69)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900232   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 70)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900248   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 71)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 8900253   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 72)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876230   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 73)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876588   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 74)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876589   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 75)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876697   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 76)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876700   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 77)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876716   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 78)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876737   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 79)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876742   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 80)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876758   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 81)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 987676    ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 82)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876763   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 83)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876779   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 84)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876784   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 85)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876790   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 86)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876819   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 87)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876830   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 88)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 987689    ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 89)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876892   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 90)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876932   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 91)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876948   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 92)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876969   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 93)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876980   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 94)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876982   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 95)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9876995   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 96)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877034   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 97)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877076   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 98)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877137   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 99)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877230   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 100)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877250   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 101)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877266   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 102)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877271   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 103)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877327   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 104)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877332   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 105)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877374   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 106)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BMOU 9877395   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 107)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'BSIU 9425019   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 108)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CAIU 5220165   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 109)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CCLU 1031374   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2022-12-30T00:00:00.000' AS DateTime), 110)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CCLU 1036463   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 111)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CCLU 8590380   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 112)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091618   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 113)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091623   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 114)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091639   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 115)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091644   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 116)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091650   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 117)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091665   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 118)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091670   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 119)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091686   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 120)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091691   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 121)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 2091705   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 122)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 8591842   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 123)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CICU 8598071   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 124)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CMAU 1016897   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 125)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 1229137   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 126)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 1750237   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 127)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3605681   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 128)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606029   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 129)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606121   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 130)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606142   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 131)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606148   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), 132)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606158   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 133)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606203   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 134)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606230   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 135)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606306   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 136)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606414   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 137)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606440   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 138)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606543   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 139)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606780   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 140)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3606788   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 141)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3608098   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 142)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRLU 3808098   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 143)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRSU 5002189   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 144)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRSU 6008197   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 145)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CRXU 5252343   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 146)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'CXRU 5252343   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 147)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DFOU 8028560   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 148)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DNAU 8009700   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 149)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 1811929   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 150)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 1816526   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 151)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5006630   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 152)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5067512   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 153)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5068864   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 154)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5085202   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 155)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5172094   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 156)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5217634   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 157)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5233379   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 158)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5234919   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 159)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5240819   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 160)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5266194   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 161)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5681579   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 162)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 5854677   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 163)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 6075165   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 164)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 6078396   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 165)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 7556691   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 166)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 8801610   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 167)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 9008185   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 168)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DPEU 9237976   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 169)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'DRYU 2323242   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 170)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'EISU 3583982   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 171)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'EMCU 3835818   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 172)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'EMLU 2828810   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 173)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'EZZU 4371277   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 174)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 6079687   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 175)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 6083846   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 176)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 6091970   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 177)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 7011692   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 178)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 7015105   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 179)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FCIU 7153296   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 180)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'FTUU 4936282   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 181)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GESU 6276557   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 182)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GESU 6721797   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 183)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GESU 9279992   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 184)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GLDU 3790682   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 185)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GLDU 5113280   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 186)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'GLDU 5242081   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 187)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HALU 5691020   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 188)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050006   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 189)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050032   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 190)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050109   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 191)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050140   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 192)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050310   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 193)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050325   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 194)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050428   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 195)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050433   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 196)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050500   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 197)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050599   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 198)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050710   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 199)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050768   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 200)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2050855   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 201)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2051039   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 202)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2051105   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 203)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2051173   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 204)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2051300   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 205)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 2051738   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 206)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033501   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 207)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033538   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 208)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033559   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 209)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033646   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 210)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033707   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 211)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033754   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 212)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033796   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 213)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033841   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 214)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033857   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 215)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033878   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 216)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033883   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 217)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033986   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 218)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4033991   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 219)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034010   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 220)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034025   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 221)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034072   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 222)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034133   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 223)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034149   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 224)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034200   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 225)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034215   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 226)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'HPCU 4034236   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 227)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2484278   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 228)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2501689   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 229)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2504060   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-03-08T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 230)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2512298   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 231)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2514048   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 232)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2519749   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 233)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2525145   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 234)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2528355   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 235)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 2530521   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 236)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 6046243   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 237)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 6048122   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 238)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 6052328   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 239)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ICBU 6052668   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 240)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'JXLU 5841849   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 241)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KCSU 2046657   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 242)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KCSU 2462548   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 243)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KDCU 2177068   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 244)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KKTU 6072361   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 245)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KKTU 6074071   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 246)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KKTU 6074847   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 247)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KKTU 7380733   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 248)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'KMTU 9277709   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 249)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LNTU 6000356   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 250)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LNTU 6003118   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 251)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LNTU 6969502   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 252)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LNTU 6975207   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 253)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LNTU 7121810   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 254)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'LOOU 5113561   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 255)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MAEU 5606570   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 256)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MAEU 5686570   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 257)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777007   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 258)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777033   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 259)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777054   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 260)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777060   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 261)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777075   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 262)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 7777080   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 263)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKAU 8825058   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 264)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKHU 7777033   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 265)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 0705810   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 266)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 1197560   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 267)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 1252230   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 268)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 1311333   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 269)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 1343535   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 270)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 2974557   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 271)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 2982932   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 272)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5001900   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 273)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5211282   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 274)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5211338   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 275)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5216366   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 276)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5217634   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 277)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5230385   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 278)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5242880   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 279)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5372488   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 280)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 5972488   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 281)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 6024100   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 282)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 6052009   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 283)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 6206767   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 284)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 7111746   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 285)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 8574671   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 286)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 8580294   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 287)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 8584978   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 288)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 8824827   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 289)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 8825058   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 290)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 9000130   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 291)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 9136245   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 292)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 9203960   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 293)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MKNU 9933827   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 294)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MNKU 5230385   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 295)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2070244   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 296)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2085943   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 297)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2087904   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 298)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2088500   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 299)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2089548   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 300)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2098051   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 301)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2099778   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 302)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2100586   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 303)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2102064   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 304)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2103332   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 305)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2103754   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 306)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2112334   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 307)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2117763   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 308)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2120480   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 309)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2124232   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 310)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2131355   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 311)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2138046   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 312)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2138133   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 313)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2143886   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 314)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2146904   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 315)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2149797   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 316)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2151562   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 317)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2152548   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 318)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2162361   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 319)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2165205   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 320)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2165890   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 321)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2166515   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 322)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2176004   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 323)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2176853   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 324)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2179220   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 325)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2191210   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 326)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2211403   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 327)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2249749   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 328)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 2275326   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 329)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9600496   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 330)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9603690   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 331)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9605841   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 332)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9606160   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 333)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9608455   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 334)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9610365   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 335)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9612429   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 336)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9613929   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 337)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9618523   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 338)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MRTU 9625977   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 339)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MTPU 2715580   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 340)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MWCU 5617114   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 341)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MWCU 5651905   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 342)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MWCU 5656152   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 343)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'MWCU 5680360   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 344)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'NIDU 2212083   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 345)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'NYKU 2471570   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 346)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'OYYU 5531296   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 347)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'OYYU 5532196   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 348)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'PCIU 2546161   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 349)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'PCIU 6001473   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 350)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'PONU 4743463   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 351)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'PONU 4866909   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 352)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'PONU 4870344   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 353)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'QKLU 2000020   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 354)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'QKLU 2000041   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 355)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'RSCU 2872163   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 356)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'RSTU 1616580   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 357)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SBNU 2170375   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 358)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SBNU 2181600   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 359)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SBNU 2190052   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 360)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SBNU 2190427   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), 361)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SEGU 2456600   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 362)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SEGU 3273142   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 363)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SEKU 4981048   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 364)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SGCU 2337350   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 365)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9991309   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 366)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9991422   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 367)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9991870   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 368)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9994018   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 369)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9994479   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 370)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9994970   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 371)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9994980   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 372)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9994985   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 373)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9995541   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 374)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SITU 9995876   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 375)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 8405272   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 376)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 8905489   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 377)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 9305750   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 378)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 9405343   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 379)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 9800179   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 380)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 9818476   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 381)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKHU 9923867   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 382)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SKLU 1818647   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 383)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2146904   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 384)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2786054   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 385)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2825675   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 386)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2834846   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 387)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2854190   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 388)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2888375   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 389)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2900871   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 390)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2904310   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 391)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2905894   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 392)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2906777   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 393)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2907480   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 394)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2910972   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 395)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2912337   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 396)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2912846   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 397)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2913164   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 398)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2915233   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 399)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2918905   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 400)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2919882   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 401)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2921323   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 402)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2921447   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 403)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2927614   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 404)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2930644   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 405)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2936339   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 406)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2943066   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 407)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2946620   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 408)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2947380   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 409)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2948638   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 410)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2950743   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 411)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2952237   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 412)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2953830   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 413)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2955344   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 414)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2956187   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 415)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2960398   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 416)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2960588   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 417)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2960696   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 418)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2960802   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 419)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2961521   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 420)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2964623   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 421)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2968866   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 422)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2969190   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 423)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2976408   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 424)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2977019   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 425)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2984790   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 426)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2987737   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 427)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2990108   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 428)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2992179   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 429)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2995809   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 430)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2997479   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 431)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 2998475   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 432)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3001356   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 433)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3001551   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 434)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3007098   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 435)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3008387   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 436)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3009233   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 437)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3011354   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 438)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3011518   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 439)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3011858   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 440)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012047   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 441)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012197   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 442)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012411   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 443)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012427   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 444)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012670   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 445)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3012812   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 446)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3013470   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 447)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3014224   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 448)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3015149   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 449)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3015431   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 450)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3015920   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 451)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3016320   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 452)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3020382   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 453)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3020799   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 454)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3021389   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 455)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3021917   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 456)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3023000   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 457)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3023226   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 458)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3024583   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 459)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3026510   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 460)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3027427   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 461)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3027480   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 462)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3028573   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 463)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3029097   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 464)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3029878   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 465)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3032845   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 466)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3033610   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 467)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3033986   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 468)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3036990   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 469)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3041512   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 470)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3041678   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 471)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3043270   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 472)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3043330   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 473)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3043705   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 474)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3045035   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 475)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3045375   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 476)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3045800   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 477)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3047491   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 478)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3047742   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 479)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3052409   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 480)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3055455   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 481)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3056533   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 482)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3056699   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 483)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3058259   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 484)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3058808   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 485)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3059532   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 486)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3059830   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 487)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3060180   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 488)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3060805   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 489)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3061817   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 490)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3063002   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 491)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3063487   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 492)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3064863   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 493)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3065052   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 494)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3066470   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 495)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3068724   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 496)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3068787   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 497)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3071409   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 498)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3071517   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 499)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3072405   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 500)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3072977   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 501)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3073865   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 502)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3075678   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 503)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3076503   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 504)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3077860   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 505)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3079842   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 506)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3079863   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 507)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3082867   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 508)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3084387   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 509)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3088382   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 510)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3089938   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 511)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3092844   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 512)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3094404   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 513)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3095036   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 514)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3095530   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 515)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3095951   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 516)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3095972   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 517)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3097825   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 518)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3098740   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 519)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3099767   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 520)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3101334   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 521)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3101680   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 522)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3103954   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 523)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3104740   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 524)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3105915   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 525)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3110486   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 526)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3110716   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 527)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3112133   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 528)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3112175   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 529)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3113192   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 530)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3114917   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 531)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3115030   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 532)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3115847   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 533)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3116416   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 534)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3116761   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 535)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3117623   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 536)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3117813   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 537)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3118785   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 538)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3120519   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 539)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3121198   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 540)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3123251   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 541)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3123647   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 542)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3123992   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 543)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3124094   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 544)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3127323   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 545)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3129218   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 546)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3130081   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 547)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3130250   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 548)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3130374   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 549)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3130862   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 550)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3132398   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 551)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3132438   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 552)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3132778   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 553)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3136897   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 554)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3139140   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 555)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3139324   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 556)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3141403   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 557)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3142101   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 558)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3143108   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 559)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3143155   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 560)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3146555   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 561)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3148033   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 562)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3148080   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 563)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3148455   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 564)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3151910   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 565)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3151973   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 566)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3154801   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 567)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3155710   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 568)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3156018   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 569)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3156569   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 570)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3159207   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 571)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3159470   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 572)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3161420   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 573)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3162392   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 574)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3162480   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 575)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3164332   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 576)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3164878   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 577)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3166510   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 578)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3168370   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 579)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3169150   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 580)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3170628   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 581)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3179707   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 582)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3180523   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 583)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3180734   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 584)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3181005   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 585)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3181047   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 586)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3181427   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 587)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3181561   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 588)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3182510   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 589)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3184302   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 590)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3185107   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 591)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3185206   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 592)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 3185438   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 593)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4603321   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 594)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4603569   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 595)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4604267   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 596)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4604673   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 597)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4606932   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 598)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4608447   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 599)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4609227   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 600)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4609865   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 601)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4610594   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 602)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4611991   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 603)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4612658   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 604)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4613715   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 605)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4613799   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 606)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4614795   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 607)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4616817   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 608)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4616864   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 609)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4617789   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 610)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4618419   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 611)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4618677   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 612)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4620381   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 613)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4622208   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 614)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4622825   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 615)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4622867   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 616)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4623210   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 617)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4623396   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 618)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4623816   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 619)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4625613   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 620)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4625932   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 621)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4626219   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 622)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4626585   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 623)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4626712   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 624)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4626965   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 625)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4626970   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 626)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4627088   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 627)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4627637   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 628)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4627730   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 629)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4627874   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 630)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4629136   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 631)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4629250   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 632)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4630522   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 633)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4630604   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 634)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4631431   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 635)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4632211   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 636)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4632280   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 637)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4632968   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 638)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4633100   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 639)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4634180   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 640)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4634235   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 641)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4634596   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 642)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4634662   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 643)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4634770   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 644)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4635761   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 645)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4635782   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 646)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4635946   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 647)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636048   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 648)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636412   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 649)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636449   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 650)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636876   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 651)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636916   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 652)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4636921   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 653)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4637337   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 654)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4638210   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 655)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4638924   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 656)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4639258   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 657)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4639366   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 658)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4639751   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 659)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4639920   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 660)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640161   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 661)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640285   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 662)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640330   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 663)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640480   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 664)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640520   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 665)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640602   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 666)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640829   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 667)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4640990   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 668)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4641110   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 669)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4641569   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 670)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4641912   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 671)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4641994   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 672)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4642312   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 673)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4642420   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 674)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4642673   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 675)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4642713   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 676)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4643113   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 677)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4643129   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 678)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4643474   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 679)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4643643   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 680)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4643685   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 681)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4644254   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 682)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4644547   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 683)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4644819   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 684)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4645224   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 685)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4645287   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 686)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4645409   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 687)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4645482   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 688)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4646093   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 689)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4646642   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 690)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4646684   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 691)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4647021   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 692)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4647037   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 693)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4647886   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 694)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4647905   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 695)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4648521   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 696)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649050   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 697)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649174   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 698)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649364   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 699)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649410   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 700)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649739   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 701)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4649847   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 702)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650067   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 703)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650175   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 704)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650180   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 705)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650200   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 706)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650299   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 707)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650410   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 708)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650494   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 709)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650534   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 710)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650560   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-03-08T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 711)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650719   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 712)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650853   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 713)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650895   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 714)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4650914   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 715)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651124   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 716)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651417   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 717)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651530   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 718)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651844   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 719)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651865   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 720)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4651994   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 721)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4652007   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 722)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4652563   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 723)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653169   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 724)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653180   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 725)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653240   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 726)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653359   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 727)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653528   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 728)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653580   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 729)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4653894   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 730)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4654463   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 731)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4654756   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 732)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4654904   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 733)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4654988   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 734)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4655264   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 735)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4655351   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 736)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4655691   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 737)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4655840   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 738)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4655921   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 739)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4656023   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 740)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4656321   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 741)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4656743   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 742)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4657122   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 743)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4657204   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 744)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4657210   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 745)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4657457   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 746)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4657499   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 747)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4658561   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 748)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SPNU 4660126   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 749)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SUDU 1084263   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 750)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3060137   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 751)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3600992   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 752)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3607004   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 753)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3608234   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 754)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3608682   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 755)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3609522   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 756)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3609523   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 757)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3609992   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 758)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3610571   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 759)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3610720   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 760)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3611602   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 761)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3612213   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 762)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3612867   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 763)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3613117   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 764)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3613478   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 765)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3613945   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 766)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3950559   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 767)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960013   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 768)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960029   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 769)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960034   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 770)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960040   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 771)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960055   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 772)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960060   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 773)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960076   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 774)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960081   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 775)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960097   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 776)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960100   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 777)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960110   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 778)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960116   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 779)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960121   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 780)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960124   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 781)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960137   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 782)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960142   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 783)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960158   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 784)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960163   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 785)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960179   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 786)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960184   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 787)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960190   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 788)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960203   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 789)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960219   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 790)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960224   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 791)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960230   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 792)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960245   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 793)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960250   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 794)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960266   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 795)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960271   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 796)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960287   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 797)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960292   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 798)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960306   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 799)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960311   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 800)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960317   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 801)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960322   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 802)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960327   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 803)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960332   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 804)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960348   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 805)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960353   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 806)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960369   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 807)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960374   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 808)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960380   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 809)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960395   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 810)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960409   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 811)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960414   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 812)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960420   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 813)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960432   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 814)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960435   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 815)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960440   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 816)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960456   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 817)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960461   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 818)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960477   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 819)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960482   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 820)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960498   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 821)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960501   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 822)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 396051    ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 823)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960517   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 824)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960522   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 825)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960538   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 826)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960543   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 827)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960559   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 828)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960564   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 829)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960570   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 830)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960585   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 831)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960590   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 832)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960604   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 833)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960610   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 834)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960625   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 835)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960630   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 836)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960646   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 837)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960651   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 838)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960667   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 839)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960672   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 840)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960688   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 841)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960690   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 842)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960692   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 843)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960693   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 844)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960707   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 845)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960712   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 846)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960728   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 847)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960733   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 848)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960749   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 849)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960754   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 850)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960760   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 851)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960775   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 852)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960780   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 853)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960796   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 854)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960800   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 855)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960815   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 856)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960820   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 857)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960836   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 858)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960837   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 859)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960841   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 860)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960842   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 861)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960857   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 862)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960862   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 863)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960878   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 864)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960883   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 865)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960899   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 866)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960902   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 867)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960918   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 868)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960923   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 869)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960939   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 870)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960944   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 871)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960950   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 872)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960965   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 873)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960970   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 874)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960986   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 875)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3960991   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 876)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961004   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 877)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961010   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 878)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961025   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 879)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961030   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 880)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961046   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 881)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961051   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 882)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961067   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 883)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961072   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 884)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961088   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 885)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961093   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 886)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961107   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 887)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961112   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 888)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961128   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 889)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961133   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 890)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961149   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 891)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961154   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 892)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961160   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 893)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961175   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 894)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961180   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 895)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961196   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 896)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961200   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 897)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961205   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 898)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961215   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 899)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961220   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 900)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961236   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 901)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961241   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 902)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961257   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 903)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961262   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 904)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961278   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 905)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961283   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 906)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961299   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 907)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961302   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 908)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961318   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 909)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961323   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 910)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961339   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 911)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961344   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 912)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961347   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 913)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961350   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 914)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961365   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 915)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961370   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 916)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961386   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 917)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961391   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 918)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961399   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 919)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961405   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 920)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961410   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 921)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961426   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 922)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961431   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 923)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961447   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 924)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961452   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 925)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961468   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 926)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961473   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 927)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961488   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 928)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961489   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 929)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961494   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 930)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3961508   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 931)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 3996091   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 932)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 5278024   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 933)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 8960013   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 934)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9605042   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 935)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721206   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 936)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721211   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 937)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721227   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 938)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721232   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 939)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721248   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 940)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721253   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 941)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721269   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 942)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721274   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 943)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721280   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 944)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721295   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 945)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721309   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 946)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721314   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 947)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721320   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 948)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721335   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 949)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721340   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 950)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721356   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 951)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721361   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 952)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721377   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 953)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721382   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 954)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721398   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 955)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721401   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 956)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721417   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 957)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721422   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 958)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721438   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 959)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'SZLU 9721443   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 960)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 6000857   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 961)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 6000867   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 962)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 9032261   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 963)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 9451372   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 964)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 9451972   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 965)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAHU 9452156   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 966)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2340366   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 967)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2344417   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 968)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2352773   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 969)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2359612   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 970)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2364959   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 971)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2370967   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 972)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2377370   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 973)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2387954   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 974)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2388415   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 975)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2391682   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), 976)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2397660   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 977)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2403870   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 978)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2408487   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 979)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2411161   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 980)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2412574   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 981)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2413272   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 982)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2413400   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 983)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2416158   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 984)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2418063   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 985)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2422530   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 986)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2423985   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 987)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2424472   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 988)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2425334   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 989)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2428014   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-18T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 990)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2428040   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 991)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2428143   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 992)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2431050   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 993)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2431300   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 994)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2432210   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 995)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2437510   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 996)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2442033   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 997)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2444400   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 998)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2449085   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 999)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2451436   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-24T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1000)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2461368   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1001)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2461795   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1002)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2474508   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1003)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2475340   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1004)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2536087   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1005)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2536322   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1006)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2541864   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1007)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2543867   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1008)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 2545330   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1009)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6000277   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1010)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6000810   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1011)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6017177   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1012)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6033080   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1013)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6033650   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1014)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6037614   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1015)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6039617   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'WINAW001       ', CAST(N'2022-03-09T00:00:00.000' AS DateTime), 1016)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6040135   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1017)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6059418   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1018)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6061082   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1019)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TAKU 6062052   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1020)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 0205179   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1021)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 0614715   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1022)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 0709750   ', 3, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 1023)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 3162876   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1024)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 5998170   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1025)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6026370   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1026)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6051522   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1027)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6219128   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1028)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6587184   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1029)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6667004   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1030)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6719200   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1031)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 6987184   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1032)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 8260033   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1033)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 8435949   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1034)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TBSU 8590517   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1035)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TCKU 3592882   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1036)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TCLU 1003110   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1037)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TCLU 2506866   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1038)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TCNU 1962350   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1039)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TCNU 6263144   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1040)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TDRU 5825937   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1041)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TDRU 6022436   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1042)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TDRU 6023880   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1043)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TDRU 7159402   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1044)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TDRU 9026672   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1045)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEGU 2929324   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1046)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEGU 3035994   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1047)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEGU 7037090   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1048)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEGU 7039724   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1049)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEMU 1552083   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1050)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEMU 6344040   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1051)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TEST           ', 3, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'sa             ', CAST(N'2022-12-23T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1052)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TGHU 9050892   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1053)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TGHU 9950892   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1054)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'THRU 5609335   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1055)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'THRU 8572869   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1056)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'THRU 8573869   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1057)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'THRU 8573870   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1058)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 1788057   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1059)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 3605634   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1060)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5231898   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1061)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5278024   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1062)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5278561   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1063)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5279524   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1064)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5280458   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1065)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5280459   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1066)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5280675   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1067)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5281429   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1068)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5282045   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1069)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5282111   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1070)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5282235   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1071)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5283524   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1072)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5286570   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1073)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5287561   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1074)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5287565   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1075)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5287598   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1076)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5289353   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1077)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5292608   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1078)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5295546   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1079)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5298057   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1080)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5299546   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1081)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5301248   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1082)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5303050   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1083)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5303301   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1084)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5312658   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1085)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5312659   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1086)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5312746   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1087)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5314986   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1088)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5316443   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1089)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 5317985   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1090)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 6900045   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1091)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 6901761   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1092)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKHU 6901791   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1093)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 0518001   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1094)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3603203   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1095)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3603676   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1096)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605613   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 1097)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605634   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1098)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605655   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1099)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605676   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1100)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605681   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1101)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605697   ', 1, 0, 1, 1, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-03-06T00:00:00.000' AS DateTime), 1102)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605700   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1103)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605758   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1104)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605763   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1105)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605779   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1106)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605803   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1107)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605830   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1108)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605845   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1109)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605871   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1110)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605892   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1111)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605906   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1112)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605932   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1113)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605948   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1114)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605953   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1115)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605974   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1116)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3605995   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1117)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606013   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1118)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606100   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1119)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606137   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1120)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606158   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1121)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606184   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1122)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606190   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1123)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606203   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1124)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606230   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1125)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606271   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1126)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606287   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1127)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606306   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1128)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606332   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1129)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606353   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1130)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606374   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1131)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606420   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1132)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606421   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1133)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606447   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1134)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606477   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1135)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606517   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1136)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606538   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1137)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606667   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1138)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606749   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1139)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606841   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1140)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606857   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1141)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606939   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1142)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3606991   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1143)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607001   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1144)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607004   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1145)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607093   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1146)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607128   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1147)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607133   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1148)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607149   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1149)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607154   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1150)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607215   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1151)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607241   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1152)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607283   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1153)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607299   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1154)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607302   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1155)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607318   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1156)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607339   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1157)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607350   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1158)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607405   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1159)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607426   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1160)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3607600   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1161)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3608234   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1162)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3613117   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1163)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3613478   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1164)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 3695700   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1165)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 5279524   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1166)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TKSU 5283524   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1167)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRHU 4870815   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1168)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRHU 5284228   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1169)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRHU 6694187   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1170)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 0004057   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1171)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 1610181   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1172)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 1989671   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1173)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 2412050   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1174)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 4756727   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1175)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 4870344   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1176)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 5442613   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1177)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 5719487   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1178)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 5888054   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1179)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8243102   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1180)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8372476   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1181)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8442613   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), 1182)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8461887   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1183)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8549637   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1184)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8837017   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1185)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 8837151   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1186)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 9026490   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1187)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRIU 9032765   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1188)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1624610   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1189)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1629633   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1190)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1631688   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'WINAW001       ', CAST(N'2022-03-14T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1191)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1638553   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1192)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1667398   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1193)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'TRLU 1676430   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1194)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'UETU 2499966   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1195)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'UETU 5306649   ', 2, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1196)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'VOLU 2113525   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1197)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'WHLU 2220134   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1198)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'WHLU 2233131   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'SARAH001       ', CAST(N'2022-02-22T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1199)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'WHLU 2249734   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1200)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ZCSU 5110994   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1201)
GO
INSERT [dbo].[GNL01001006C3] ([GNL_Container_No], [GNL_DDL_Type_Container], [GNL_DDL_Type_Container_2], [GNL_DDL_DamageStatus], [GNL_DDL_Kepemilikan], [NOTEINDX], [CRUSRID], [CREATDDT], [MDFUSRID], [MODIFDT], [DEX_ROW_ID]) VALUES (N'ZSCU 5110994   ', 1, 0, 1, 0, CAST(0.00000 AS Numeric(19, 5)), N'ARTHA001       ', CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'sa             ', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1202)
GO
SET IDENTITY_INSERT [dbo].[GNL01001006C3] OFF
GO
ALTER TABLE [dbo].[CMS01036002C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036002C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036003C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036003C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036004C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036004C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036005C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036005C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036006C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036006C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036009C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01036009C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[GNL01001006C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[GNL01001006C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
