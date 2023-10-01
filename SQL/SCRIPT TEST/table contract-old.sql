
/****** Object:  Table [dbo].[CMS01131003C3]    Script Date: 29/05/2023 13:32:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01131003C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01131003C3]
GO
/****** Object:  Table [dbo].[CMS01131001C3]    Script Date: 29/05/2023 13:32:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS01131001C3]') AND type in (N'U'))
DROP TABLE [dbo].[CMS01131001C3]
GO
/****** Object:  Table [dbo].[CMS01131001C3]    Script Date: 29/05/2023 13:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01131001C3](
	[CMS_CONTRACT_NO] [char](21) NOT NULL,
	[CMS_CONTRACT_TYPE] [smallint] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[CMS_SUBMITTED_DATE] [datetime] NOT NULL,
	[From_Date] [datetime] NOT NULL,
	[TODATE] [datetime] NOT NULL,
	[CMS_DURATION] [smallint] NOT NULL,
	[CURNCYID] [char](15) NOT NULL,
	[CRNCYSYM] [char](3) NOT NULL,
	[CUSTNMBR] [char](15) NOT NULL,
	[CUSTNAME] [char](65) NOT NULL,
	[PYMTTYPE] [smallint] NOT NULL,
	[PYMTRMID] [char](21) NOT NULL,
	[PYMNTTRM] [char](15) NOT NULL,
	[TAXTYPE] [smallint] NOT NULL,
	[TAXSCHID] [char](15) NOT NULL,
	[TAXDTLID] [char](15) NOT NULL,
	[TXDTLPCT] [numeric](19, 5) NOT NULL,
	[CMS_ORDER_TYPE] [smallint] NOT NULL,
	[CMS_KETERANGAN] [char](501) NOT NULL,
	[CMS_Status] [smallint] NOT NULL,
	[CRUSRID] [char](15) NOT NULL,
	[CREATDDT] [datetime] NOT NULL,
	[CREATETIME] [datetime] NOT NULL,
	[MDFUSRID] [char](15) NOT NULL,
	[MODIFDT] [datetime] NOT NULL,
	[MODIFTIME] [datetime] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS01131003C3]    Script Date: 29/05/2023 13:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS01131003C3](
	[CMS_CONTRACT_NO] [char](21) NOT NULL,
	[LNITMSEQ] [int] NOT NULL,
	[ITEMNMBR] [char](31) NOT NULL,
	[ITEMDESC] [char](101) NOT NULL,
	[QUANTITY] [numeric](19, 5) NOT NULL,
	[CHRGAMNT] [numeric](19, 5) NOT NULL,
	[TAXAMNT] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[TOTAL] [numeric](19, 5) NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CMS01131001C3] ON 

INSERT [dbo].[CMS01131001C3] ([CMS_CONTRACT_NO], [CMS_CONTRACT_TYPE], [DOCDATE], [CMS_SUBMITTED_DATE], [From_Date], [TODATE], [CMS_DURATION], [CURNCYID], [CRNCYSYM], [CUSTNMBR], [CUSTNAME], [PYMTTYPE], [PYMTRMID], [PYMNTTRM], [TAXTYPE], [TAXSCHID], [TAXDTLID], [TXDTLPCT], [CMS_ORDER_TYPE], [CMS_KETERANGAN], [CMS_Status], [CRUSRID], [CREATDDT], [CREATETIME], [MDFUSRID], [MODIFDT], [MODIFTIME], [DEX_ROW_ID]) VALUES (N'CONTRACT/ID/00001    ', 1, CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 4, N'IDR            ', N'Rp ', N'00TEST         ', N'12testing                                                        ', 0, N'                     ', N'               ', 1, N'               ', N'               ', CAST(0.00000 AS Numeric(19, 5)), 1, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', 1, N'teg01          ', CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:11:40.890' AS DateTime), N'               ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[CMS01131001C3] ([CMS_CONTRACT_NO], [CMS_CONTRACT_TYPE], [DOCDATE], [CMS_SUBMITTED_DATE], [From_Date], [TODATE], [CMS_DURATION], [CURNCYID], [CRNCYSYM], [CUSTNMBR], [CUSTNAME], [PYMTTYPE], [PYMTRMID], [PYMNTTRM], [TAXTYPE], [TAXSCHID], [TAXDTLID], [TXDTLPCT], [CMS_ORDER_TYPE], [CMS_KETERANGAN], [CMS_Status], [CRUSRID], [CREATDDT], [CREATETIME], [MDFUSRID], [MODIFDT], [MODIFTIME], [DEX_ROW_ID]) VALUES (N'CONTRACT/ID/00002    ', 1, CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 29, N'IDR            ', N'Rp ', N'AAR            ', N'ALI ARRIDHO                                                      ', 2, N'14 Days              ', N'14 Days        ', 1, N'VAT OUT 1%     ', N'VAT OUT 1%     ', CAST(1.00000 AS Numeric(19, 5)), 1, N'tester                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 1, N'teg01          ', CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'1900-01-01T19:27:49.460' AS DateTime), N'teg01          ', CAST(N'2023-05-27T00:00:00.000' AS DateTime), CAST(N'1900-01-01T19:27:49.460' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[CMS01131001C3] OFF
GO
SET IDENTITY_INSERT [dbo].[CMS01131003C3] ON 

INSERT [dbo].[CMS01131003C3] ([CMS_CONTRACT_NO], [LNITMSEQ], [ITEMNMBR], [ITEMDESC], [QUANTITY], [CHRGAMNT], [TAXAMNT], [SUBTOTAL], [TOTAL], [DEX_ROW_ID]) VALUES (N'CONTRACT/ID/00002    ', 16384, N'AGENT-BURU                     ', N'tester                                                                                               ', CAST(10.00000 AS Numeric(19, 5)), CAST(25000000.00000 AS Numeric(19, 5)), CAST(250000.00000 AS Numeric(19, 5)), CAST(25250000.00000 AS Numeric(19, 5)), CAST(25250000.00000 AS Numeric(19, 5)), 1)
SET IDENTITY_INSERT [dbo].[CMS01131003C3] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PKCMS01131001C3]    Script Date: 29/05/2023 13:32:57 ******/
ALTER TABLE [dbo].[CMS01131001C3] ADD  CONSTRAINT [PKCMS01131001C3] PRIMARY KEY NONCLUSTERED 
(
	[CMS_CONTRACT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PKCMS01131003C3]    Script Date: 29/05/2023 13:32:57 ******/
ALTER TABLE [dbo].[CMS01131003C3] ADD  CONSTRAINT [PKCMS01131003C3] PRIMARY KEY NONCLUSTERED 
(
	[CMS_CONTRACT_NO] ASC,
	[LNITMSEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CMS_SUBMITTED_DATE])=(0) AND datepart(minute,[CMS_SUBMITTED_DATE])=(0) AND datepart(second,[CMS_SUBMITTED_DATE])=(0) AND datepart(millisecond,[CMS_SUBMITTED_DATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[CREATDDT])=(0) AND datepart(minute,[CREATDDT])=(0) AND datepart(second,[CREATDDT])=(0) AND datepart(millisecond,[CREATDDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(day,[CREATETIME])=(1) AND datepart(month,[CREATETIME])=(1) AND datepart(year,[CREATETIME])=(1900)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[DOCDATE])=(0) AND datepart(minute,[DOCDATE])=(0) AND datepart(second,[DOCDATE])=(0) AND datepart(millisecond,[DOCDATE])=(0)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[From_Date])=(0) AND datepart(minute,[From_Date])=(0) AND datepart(second,[From_Date])=(0) AND datepart(millisecond,[From_Date])=(0)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[MODIFDT])=(0) AND datepart(minute,[MODIFDT])=(0) AND datepart(second,[MODIFDT])=(0) AND datepart(millisecond,[MODIFDT])=(0)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(day,[MODIFTIME])=(1) AND datepart(month,[MODIFTIME])=(1) AND datepart(year,[MODIFTIME])=(1900)))
GO
ALTER TABLE [dbo].[CMS01131001C3]  WITH CHECK ADD CHECK  ((datepart(hour,[TODATE])=(0) AND datepart(minute,[TODATE])=(0) AND datepart(second,[TODATE])=(0) AND datepart(millisecond,[TODATE])=(0)))
GO
