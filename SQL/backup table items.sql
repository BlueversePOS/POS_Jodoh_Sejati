
begin tran

IF OBJECT_ID('tempdb..#POS_Item_TEMP') IS NOT NULL
DROP TABLE #POS_Item_TEMP

select *
into #POS_Item_TEMP
from POS_Item

ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [PK_POS_Item]


--ALTER TABLE [dbo].[POS_TrxAdjustment_Detail] DROP CONSTRAINT [FK_POS_TrxAdjustmentItem]


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item]


/****** Object:  Table [dbo].[POS_Item]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON


CREATE TABLE POS_Item
(
	Item_Number nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Category_ID nvarchar(20) NOT NULL,
	Item_Sales int NOT NULL,
	Item_SoldBy int NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Composite_Item int NOT NULL,
	Track_Stock int NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	Tax_ID nvarchar(20) NOT NULL,
	Representation int NOT NULL,
	Item_Color nvarchar(50) NOT NULL,
	Item_Shape nvarchar(50) NOT NULL,
	Item_Image nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Item PRIMARY KEY NONCLUSTERED (Item_Number, Site_ID),
	CONSTRAINT FK_POS_Item_Cat FOREIGN KEY (Category_ID)
	REFERENCES POS_CategoryItem (Category_ID)
	--CONSTRAINT FK_POS_Item_Inventory FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemInventory (Item_Number),
	--CONSTRAINT FK_POS_Item_Composite FOREIGN KEY (Item_Number)
	--REFERENCES POS_CompositeItem (Item_Number),
	--CONSTRAINT FK_POS_Item_Variant FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemVariant (Item_Number)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)


DECLARE @Site_ID varchar(20)
SELECT TOP 1 @Site_ID=Site_ID
FROM POS_Set_Site
WHERE DefaultSite=1

INSERT INTO POS_Item(Item_Number, Site_ID, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, Item_SKU, Item_Barcode, 
Composite_Item, Track_Stock, InStock, LowStock, Tax_ID, Representation, Item_Color, Item_Shape, Item_Image, Created_User, Created_Date, Modified_User, Modified_Date)
select A.Item_Number, COALESCE(X.Site_ID, ''), A.Item_Name, A.Item_Description, A.UOFM, A.Category_ID, A.Item_Sales, 
A.Item_SoldBy, A.Item_Price, A.Item_Cost, A.Item_SKU, A.Item_Barcode, A.Composite_Item, A.Track_Stock, 
CASE WHEN COALESCE(X.Site_ID, '') = @Site_ID THEN A.InStock ELSE 0 END, 
A.LowStock, A.Tax_ID, A.Representation, A.Item_Color, A.Item_Shape, A.Item_Image, A.Created_User, A.Created_Date, A.Modified_User, A.Modified_Date 
from #POS_Item_TEMP A
OUTER APPLY(
	SELECT Site_ID FROM POS_Set_Site
) X
left join POS_Item B ON A.Item_Number=B.Item_Number --and A.Site_ID=@Site_ID

select * from POS_Item


IF OBJECT_ID('tempdb..#POS_Item_History_TEMP') IS NOT NULL
DROP TABLE #POS_Item_History_TEMP

select *
into #POS_Item_History_TEMP
from POS_Item_History

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item_History]


/****** Object:  Table [dbo].[POS_Item_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON


CREATE TABLE POS_Item_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Category_ID nvarchar(20) NOT NULL,
	Item_Sales int NOT NULL,
	Item_SoldBy int NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Composite_Item int NOT NULL,
	Track_Stock int NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	Tax_ID nvarchar(20) NOT NULL,
	Representation int NOT NULL,
	Item_Color nvarchar(50) NOT NULL,
	Item_Shape nvarchar(50) NOT NULL,
	Item_Image nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Item_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, Line_Item ASC),
)


INSERT INTO POS_Item_History(Item_Number, Site_ID, Item_Name, Item_Description, Line_Item, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_ID, Representation, Item_Color, Item_Shape, Item_Image, Created_User, Created_Date)
select A.Item_Number, COALESCE(X.Site_ID, ''), A.Item_Name, A.Item_Description, ISNULL(A.Line_Item, 1), A.UOFM, A.Category_ID, A.Item_Sales, 
A.Item_SoldBy, A.Item_Price, A.Item_Cost, A.Item_SKU, A.Item_Barcode, A.Composite_Item, A.Track_Stock, 
CASE WHEN COALESCE(X.Site_ID, '') = @Site_ID THEN A.InStock ELSE 0 END, 
A.LowStock, A.Tax_ID, A.Representation, A.Item_Color, A.Item_Shape, A.Item_Image, A.Created_User, A.Created_Date
from #POS_Item_History_TEMP A
OUTER APPLY(
	SELECT Site_ID FROM POS_Set_Site
) X
left join POS_Item_History B ON A.Item_Number=B.Item_Number

select * from POS_Item_History

rollback
--commit
