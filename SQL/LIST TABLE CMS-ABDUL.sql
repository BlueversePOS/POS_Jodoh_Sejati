select * from SY03300 --Term of Payment
select * from RM00101 --Master Customer
select * from RM00102 --Master Customer address
select * from IV40700 --Site
select * from DYNAMICS..MC40200 --Currency Setup
select * from GNL01001006C3 --Master Container GP
select * from CMS01036001C3 --Setup Running Number
select * from IV40201 --UOM Header
select * from IV40202 --UOM Detail
select * from CMS01036009C3 --Cust vs Doc --Customer
select * from CMS01036010C3 --Cust vs Doc --Document
select * from CMS01131001C3 --CMS_CONTRACT_HEADER
select * from CMS01131002C3 --CMS_CONTRACT_DTLROUTE
select * from CMS01131003C3 --CMS_CONTRACT_DTLCHARGES
select * from CMS01131004C3 --CMS_QUOTATION_HEADER
select * from CMS01131005C3 --CMS_QUOTATION_DTLROUTE
select * from CMS01131006C3 --CMS_QUOTATION_DTLCHARGES
select * from CMS01133001C3 --CMS_SO_HEADER
select * from CMS01133002C3 --CMS_SO_DTL_ATTACHMENT
select * from CMS01133003C3 --CMS_SO_DTL_QUOTATION
select * from CMS01133004C3 --CMS_SO_DTL_ROUTE
select * from CMS01133005C3 --CMS_SO_DTL_CHARGES
select * from CMS01133006C3 --CMS_SO_DTL_COMMODITY
select * from CMS01133007C3 --CMS_SO_DTL_DOCCHECKLIST

----so header
--insert into CMS01133001C3
--select 'SO/2305/0001',cast(GETDATE() as date), 'CONTRACT/ID/00002',1,1,cast(GETDATE() as date),'010010','HO','IDR','Rupiah','AAM','PT. ANUGRAH ARGON MEDICA'
--,1,'7 Days','BILLING',cast(GETDATE() as date),1,'AKLU 6900451','test data dummy',2,'teg01',cast(GETDATE() as date),cast(GETDATE() as time), 'teg01',cast(GETDATE() as date),cast(GETDATE() as time)

----so dtl quotation
--insert into CMS01133003C3
--select 'SO/2305/0001', CMS_CONTRACT_NO, CUSTNMBR, CMS_QUOTATION_NO, CMS_QUOTATION_TYPE, DOCDATE, CMS_KETERANGAN, From_Date, TODATE, CURNCYID, 2, 1
--from CMS01131004C3

----so dtl route
--insert into CMS01133004C3
--select 'SO/2305/0001', CMS_QUOTATION_NO, LNITMSEQ, LNSEQNBR, CMS_ROUTEID_FROM, CMS_ROUTEID_TO, CMS_CONT_UKURAN_ID, CMS_CONT_UKURAN, CMS_KETERANGAN, 1, CMS_STUFF_LOCATION, QUANTITY,
--UNITPRCE, XTNDPRCE, SUBTOTAL, TAXDTLID, TXDTLPCT, TAXAMNT, TOTAL, 1
--from CMS01131005C3
--where CMS_QUOTATION_NO = 'QUOTATION/00002'

----so dtl charges
--insert into CMS01133005C3
--select 'SO/2305/0001', cms_quotation_no, lnitmseq, itemnmbr, itemdesc, quantity, chrgamnt, taxamnt, subtotal, total
--from CMS01131006C3

----so dtl commodity
--insert into CMS01133006C3
--select 'SO/2305/0001', 16384, 'coommodity 1 free text','PCS',1,1,1
--insert into CMS01133006C3
--select 'SO/2305/0001', 16384*2, 'coommodity 2 test','PCS',1,1,1

----so dtl doc checklist
--insert into CMS01133007C3
--select 'SO/2305/0001', CUSTNMBR, DOCNUMBR, DSCRIPTN, QUANTITY, LNITMSEQ,1
--from CMS01036010C3

/*
	Currency Setup DDL

	DECSYMBL
	Space
	Peiod
	Comma
	$

	THOUSSYM
	Space
	Period
	Comma
	Apostrophia

	DECPLCUR
	0
	1
	2
	3
	4
	5
*/


/*
	Sales Type SO
	1. Local 
	2. Export
*/

/*
	Order Type SO
	SO
	NSO
	RENTAL
*/

/*
	Payment SO
	1. COD
	2. TOP
*/

/*
	Container Type SO
	SOC
	COC
*/

/*
	DDL CMS01036001C3 Master Container GP

	container size 1
	20RF
	20Dry
	40RF
	40Dry

	Container Size 2
	STD
	HC

	Kepemilikan
	Own
	Ownlease
	Rental

	Status
	Ready
	Service
	On Duty
	Small Damage
	Medium Damage
	Breakdown
*/
