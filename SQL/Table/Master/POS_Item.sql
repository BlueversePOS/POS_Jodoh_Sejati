
ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [PK_POS_Item]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item]
GO

/****** Object:  Table [dbo].[POS_Item]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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

/*

begin tran

declare @p22 dbo.COMPTYPE

declare @p23 dbo.VARTYPE
insert into @p23 values(N'',1.0,0,N'Size / Color',N'Size / Color',1.0,N'S / Black',15000.0,12000.0,50,10,30,N'00001',N'')
insert into @p23 values(N'',2.0,0,N'Size / Color',N'Size / Color',2.0,N'S / White',15000.0,12000.0,50,10,30,N'00002',N'')
insert into @p23 values(N'',3.0,0,N'Size / Color',N'Size / Color',3.0,N'S / Red',15000.0,12000.0,50,10,30,N'00003',N'')
insert into @p23 values(N'',4.0,0,N'Size / Color',N'Size / Color',4.0,N'S / Blue',15000.0,12000.0,50,10,30,N'00004',N'')
insert into @p23 values(N'',5.0,0,N'Size / Color',N'Size / Color',5.0,N'M / Black',15000.0,12000.0,50,10,30,N'00005',N'')
insert into @p23 values(N'',6.0,0,N'Size / Color',N'Size / Color',6.0,N'M / White',15000.0,12000.0,50,10,30,N'00006',N'')
insert into @p23 values(N'',7.0,0,N'Size / Color',N'Size / Color',7.0,N'M / Red',15000.0,12000.0,50,10,30,N'00007',N'')
insert into @p23 values(N'',8.0,0,N'Size / Color',N'Size / Color',8.0,N'M / Blue',15000.0,12000.0,50,10,30,N'00008',N'')
insert into @p23 values(N'',9.0,0,N'Size / Color',N'Size / Color',9.0,N'L / Black',15000.0,12000.0,50,10,30,N'00009',N'')
insert into @p23 values(N'',10.0,0,N'Size / Color',N'Size / Color',10.0,N'L / White',15000.0,12000.0,50,10,30,N'00010',N'')
insert into @p23 values(N'',11.0,0,N'Size / Color',N'Size / Color',11.0,N'L / Red',15000.0,12000.0,50,10,30,N'00011',N'')
insert into @p23 values(N'',12.0,0,N'Size / Color',N'Size / Color',12.0,N'L / Blue',15000.0,12000.0,50,10,30,N'00012',N'')
insert into @p23 values(N'',13.0,0,N'Size / Color',N'Size / Color',13.0,N'XL / Black',15000.0,12000.0,50,10,30,N'00013',N'')
insert into @p23 values(N'',14.0,0,N'Size / Color',N'Size / Color',14.0,N'XL / White',15000.0,12000.0,50,10,30,N'00014',N'')
insert into @p23 values(N'',15.0,0,N'Size / Color',N'Size / Color',15.0,N'XL / Red',15000.0,12000.0,50,10,30,N'00015',N'')
insert into @p23 values(N'',16.0,0,N'Size / Color',N'Size / Color',16.0,N'XL / Blue',15000.0,12000.0,50,10,30,N'00016',N'')

exec Web_Items_SaveData @UserID=N'USER1',@Item_Number=N'',@Item_Name=N'Testing Item',@Item_Description=N'Tester',@UOFM=N'',@Category_ID=N'CAT0001',
@Item_Sales=0,@Item_SoldBy=1,@Item_Price=15000.0,@Item_Cost=12000.0,@Item_SKU=N'00001',@Item_Barcode=N'',@Composite_Item=0,@Track_Stock=1,@InStock=50,
@LowStock=10,@Tax_ID=N'TAX0001',@Representation=1,@Item_Color=N'bg-default',@Item_Shape=N'',@Item_Image=N'',@COMPTYPE=@p22,@VARTYPE=@p23

rollback

*/