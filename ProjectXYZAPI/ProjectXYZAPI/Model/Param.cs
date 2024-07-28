using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectXYZAPI.Model
{
    public class Param
    {
        public string interid { get; set; }
        public string ID { get; set; }
    }

    public class isLogin
    {
        public string INTERCOMPANY { get; set; }
        public string COMPANY_NAME { get; set; }
        public string USER { get; set; }
        public string PASSWORD { get; set; }
        public string SessionID { get; set; }
    }

    public class UserLogin
    {
        public string EmailAddress { get; set; }
        public string PASSWORD { get; set; }
    }

    public class UserAccount
    {
        public string UserID { get; set; }
        public string EmailAddress { get; set; }
        public string PASSWORD { get; set; }
        public string Business_Name { get; set; }
        public string Currency { get; set; }
        public string Country { get; set; }
    }

    public class Accounts
    {
        public string UserID { get; set; }
        public string EmailAddress { get; set; }
        public string PASSWORD { get; set; }
        public string Business_Name { get; set; }
        public string Currency { get; set; }
        public string Timezone { get; set; }
    }

    public class AccessRight
    {
        public string UserID { get; set; }
        public string Role_ID { get; set; }
        public string Role_Name { get; set; }
        public int POS_Flag { get; set; }
        public int POS_AccessPayments { get; set; }
        public int POS_ApplyDiscount { get; set; }
        public int POS_ChangeTaxes { get; set; }
        public int POS_ViewReceipt { get; set; }
        public int POS_ReprintSendReceipt { get; set; }
        public int POS_ViewShift { get; set; }
        public int POS_ManageItemsPOS { get; set; }
        public int POS_ViewCostPOS { get; set; }
        public int POS_ChangeSetting { get; set; }
        public int BckOffice_Flag { get; set; }
        public int BckOffice_ViewSales { get; set; }
        public int BckOffice_ManageItemsOff { get; set; }
        public int BckOffice_ViewCostOff { get; set; }
        public int BckOffice_ManageEmployee { get; set; }
        public int BckOffice_ManageCustomers { get; set; }
        public int BckOffice_EditSetting { get; set; }
        public int BckOffice_ManagePayTypes { get; set; }
        public int BckOffice_ManageTaxes { get; set; }
        public int BckOffice_POSDevices { get; set; }
    }

    public class Employee
    {
        public string UserID { get; set; }
        public string Employee_ID { get; set; }
        public string Employee_Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Role_ID { get; set; }
        public string User_ID { get; set; }
        public string UserPassword { get; set; }
    }

    public class Discount
    {
        public string UserID { get; set; }
        public string DISCOUNT_ID { get; set; } = string.Empty;
        public string DISCOUNT_NAME { get; set; } = string.Empty;
        public int TYPE { get; set; }
        public int DISCOUNT_TYPE { get; set; }
        public decimal DISCOUNT_VALUE { get; set; }
        public int RESTRICTED_ACCESS { get; set; }
    }

    public class Category
    {
        public string UserID { get; set; }
        public string Category_ID { get; set; } = string.Empty;
        public string Category_Name { get; set; } = string.Empty;
        public string Category_Color { get; set; } = string.Empty;
    }

    public class FilterItem
    {
        public string UserID { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public string Category_ID { get; set; } = string.Empty;
        public int LowStock { get; set; }
    }

    public class ItemList
    {
        public string UserID { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public string Item_Name { get; set; } = string.Empty;
        public string Item_Description { get; set; } = string.Empty;
        public string UOFM { get; set; } = string.Empty;
        public string Category_ID { get; set; } = string.Empty;
        public int Item_Sales { get; set; }
        public int Item_SoldBy { get; set; }
        public decimal Item_Price { get; set; }
        public decimal Item_Cost { get; set; }
        public string Item_SKU { get; set; } = string.Empty;
        public string Item_Barcode { get; set; } = string.Empty;
        public int Composite_Item { get; set; }
        public int Track_Stock { get; set; }
        public int InStock { get; set; }
        public int LowStock { get; set; }
        public string Tax_ID { get; set; }
        public int Representation { get; set; }
        public string Item_Color { get; set; } = string.Empty;
        public string Item_Shape { get; set; } = string.Empty;
        public string Item_Image { get; set; } = string.Empty;
        public List<CompositeItems> CompositeItem { get; set; }
        public List<ItemVariants> ItemVariant { get; set; }
    }

    public class CompositeItems
    {
        public string Item_Number { get; set; } = string.Empty;
        public int Item_Quantity { get; set; }
        public decimal Item_Cost { get; set; }
        public string Item_Composite { get; set; } = string.Empty;
    }

    public class ItemVariants
    {
        public string Item_Number { get; set; } = string.Empty;
        public decimal LineItem_Option { get; set; }
        public int CB_Available { get; set; }
        public string Option_ID { get; set; } = string.Empty;
        public string Option_Name { get; set; } = string.Empty;
        public decimal LineItem_Variant { get; set; }
        public string Variant_Name { get; set; } = string.Empty;
        public decimal Item_Price { get; set; }
        public decimal Item_Cost { get; set; }
        public int InStock { get; set; }
        public int LowStock { get; set; }
        public int OptimalStock { get; set; }
        public string Item_SKU { get; set; } = string.Empty;
        public string Item_Barcode { get; set; } = string.Empty;
    }

    public class Customers
    {
        public string UserID { get; set; }
        public string Customer_ID { get; set; }
        public string Customer_Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        public string Postal_Code { get; set; }
        public string Customer_Code { get; set; }
        public string Note { get; set; }
    }

    public class Features
    {
        public string UserID { get; set; }
        public string Feature_ID { get; set; }
        public int Feature_Shift { get; set; }
        public int Feature_TimeClock { get; set; }
        public int Feature_LowStock { get; set; }
        public int Feature_NegativeStock { get; set; }
    }

    public class PaymentType
    {
        public string UserID { get; set; }
        public string Payment_ID { get; set; } = string.Empty;
        public string Payment_Type { get; set; } = string.Empty;
        public string Payment_Name { get; set; } = string.Empty;
        public int AllStore { get; set; }
        public List<PaymentStore> payStore { get; set; }
    }

    public class PaymentStore
    {
        public int LineItem { get; set; }
        public int AllStore { get; set; }
        public string Store_ID { get; set; }
        public string Store_Name { get; set; }
    }

    public class SalesType
    {
        public string UserID { get; set; }
        public string SalesType_ID { get; set; }
        public string SalesType_Name { get; set; }
        public string Store_ID { get; set; }
        public string Store_Name { get; set; }
    }

    public class Taxes
    {
        public string UserID { get; set; }
        public string Tax_ID { get; set; }
        public string Tax_Name { get; set; }
        public decimal Tax_Rate { get; set; }
        public int Tax_Type { get; set; }
        public int Tax_Option { get; set; }
    }

    public class Stores
    {
        public string UserID { get; set; }
        public string Store_ID { get; set; }
        public string Store_Name { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string CountryName { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        public string Postal_Code { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
    }

    public class Sites
    {
        public string UserID { get; set; }
        public string Site_ID { get; set; }
        public string Site_Name { get; set; }
        public int DefaultSite { get; set; }
        public string Store_ID { get; set; }
        public string Store_Name { get; set; }
    }

    public class Devices
    {
        public string UserID { get; set; }
        public string POS_Device_ID { get; set; }
        public string POS_Device_Name { get; set; }
        public string Store_ID { get; set; }
        public string Store_Name { get; set; }
    }

    public class GenerateNumberParam
    {
        public string TABLE { get; set; }
        public string FIELD { get; set; }
        public string DOCID { get; set; }
        public string NEWNUMBER { get; set; }
    }

    public class ShiftParam
    {
        public string Batch_ID { get; set; }
        public int Lineitmseq { get; set; }
        public string Payment_ID { get; set; }
        public string Payment_Type { get; set; }
        public decimal Amount_Opening { get; set; }
        public string UserID { get; set; }
    }

    public class SummShiftParam
    {
        public string Batch_ID { get; set; }
        public DateTime LastEdit_Date { get; set; }
        public DateTime LastEdit_time { get; set; }
        public string Store_ID { get; set; }
        public string POS_Device_ID { get; set; }
        public DateTime Opening_Date { get; set; }
        public DateTime Opening_time { get; set; }
        public DateTime Closing_Date { get; set; }
        public DateTime Closing_time { get; set; }
        public decimal Sum_Amount_Opening { get; set; }
        public decimal Sum_Amount_Closing { get; set; }
        public decimal Sum_Invoice_Posted { get; set; }
        public decimal Sum_Tendered { get; set; }
        public decimal Sum_Changes { get; set; }
        public decimal Sum_Amount_Discount { get; set; }
        public decimal Sum_Amount_Tax { get; set; }
        public decimal Sum_Invoice_Refund_Posted { get; set; }
        public decimal Sum_Amount_PayOut { get; set; }
        public decimal Sum_Amount_PayIn { get; set; }
        public int Count_Customers { get; set; }
        public int Status_Batch { get; set; }
        public string UserID { get; set; }
    }

    public class GetSummShiftParam
    {
        public string Batch_ID { get; set; }
    }

    public class CashManagement
    {
        public string Batch_ID { get; set; }
        public string Type_CashManagement { get; set; }
        public decimal Amount { get; set; }
        public string Notes { get; set; }
        public string POS_ID { get; set; }
        public string UserID { get; set; }
    }

    public class SetupPrint
    {
        public string PrinterID { get; set; }
        public string PrinterName { get; set; }
        public int Printer_Checkbox1 { get; set; }
        public int Printer_Checkbox2 { get; set; }
        public int Printer_Checkbox3 { get; set; }
        public string UserID { get; set; }
    }

    public class TrxHeader
    {
        public string UserID { get; set; }
        public string DOCNUMBER { get; set; } = string.Empty;
        public int DOCTYPE { get; set; }
        public DateTime DOCDATE { get; set; }
        public string Store_ID { get; set; } = string.Empty;
        public string Site_ID { get; set; } = string.Empty;
        public string SalesType_ID { get; set; }
        public string CustName { get; set; }
        public int Total_Line_Item { get; set; }
        public decimal ORIGTOTAL { get; set; }
        public decimal SUBTOTAL { get; set; }
        public decimal Tax_Amount { get; set; }
        public string Discount_ID { get; set; }
        public decimal Discount_Amount { get; set; }
        public decimal Amount_Tendered { get; set; }
        public decimal Change_Amount { get; set; }
        public string Batch_ID { get; set; }
        public string POS_Device_ID { get; set; }
        public string POS_Version { get; set; } = string.Empty;
        public int SyncStatus { get; set; }
        public string Payment_ID { get; set; } = string.Empty;
        public string Payment_Type { get; set; } = string.Empty;
        public int Lnitmseq { get; set; }
        public List<TrxDetail> TrxDetailTYPE { get; set; }
    }

    public class TrxDetail
    {
        public string DOCNUMBER { get; set; }
        public int DOCTYPE { get; set; }
        public DateTime DOCDATE { get; set; }
        public int Lineitmseq { get; set; }
        public string Item_Number { get; set; }
        public string Item_Description { get; set; }
        public decimal LineItem_Option { get; set; }
        public decimal Quantity { get; set; }
        public string UofM { get; set; }
        public decimal Item_Price { get; set; }
        public decimal Item_Cost { get; set; }
        public string Store_ID { get; set; }
        public string Site_ID { get; set; }
        public string SalesType_ID { get; set; }
        public string Discount_ID { get; set; }
        public decimal Discount_Amount { get; set; }
        public string Notes { get; set; }
        public string POS_Device_ID { get; set; }
        public string POS_Version { get; set; }
    }

    public class TrxPost
    {
        public string UserID { get; set; }
        public string DOCNUMBER { get; set; } = string.Empty;
        public int SyncStatus { get; set; }
    }

    public class TrxHistory
    {
        public string DOCNUMBER { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string SalesType_ID { get; set; }
        public string Search { get; set; }
    }

    public class SAFilterItem
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public string Item_Number { get; set; } = string.Empty;
        public int LineItem_Option { get; set; }
        public string Reason { get; set; } = string.Empty;
        public string Store_ID { get; set; } = string.Empty;
        public string Site_ID { get; set; } = string.Empty;
    }

    public class SAHeader
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public DateTime DOCDATE { get; set; }
        public string Site_ID { get; set; } = string.Empty;
        public string Site_Name { get; set; } = string.Empty;
        public string Reason { get; set; } = string.Empty;
        public int Total_Line_Item { get; set; }
        public string Notes { get; set; } = string.Empty;
        public List<SADetail> SADetails { get; set; } = new List<SADetail>();
    }

    public class SADetail
    {
        public DateTime DOCDATE { get; set; }
        public string Reason { get; set; } = string.Empty;
        public int Lineitmseq { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public int LineItem_Option { get; set; }
        public string Item_Description { get; set; } = string.Empty;
        public decimal Qty_Stock { get; set; }
        public decimal Qty_Add_Stock { get; set; }
        public decimal Qty_Remove_Stock { get; set; }
        public decimal Item_Cost { get; set; }
        public decimal Qty_After_Stock { get; set; }
        public decimal Expected_Stock { get; set; }
        public decimal Counted_Stock { get; set; }
    }

    public class TrfItemFilter
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public string Item_Number { get; set; } = string.Empty;
        public int LineItem_Option { get; set; }
        public string SourceSite_ID { get; set; } = string.Empty;
        public string DestSite_ID { get; set; } = string.Empty;
        public int Status { get; set; }
    }

    public class TransferItemHeader
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public DateTime DOCDATE { get; set; }
        public string SourceSite_ID { get; set; } = string.Empty;
        public string SourceSite_Name { get; set; } = string.Empty;
        public string DestSite_ID { get; set; } = string.Empty;
        public string DestSite_Name { get; set; } = string.Empty;
        public int Total_Line_Item { get; set; }
        public string Notes { get; set; } = string.Empty;
        public int Status { get; set; } = 0;
        public List<TransferItemDetail> TrfDetails { get; set; } = new List<TransferItemDetail>();
    }

    public class TransferItemDetail
    {
        public DateTime DOCDATE { get; set; }
        public int Lineitmseq { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public int LineItem_Option { get; set; }
        public string Item_Description { get; set; } = string.Empty;
        public string Item_SKU { get; set; } = string.Empty;
        public decimal Source_Stock { get; set; }
        public decimal Dest_Stock { get; set; }
        public decimal Qty_Transfer { get; set; }
    }

    public class ICFilterItem
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public string Item_Number { get; set; } = string.Empty;
        public int LineItem_Option { get; set; }
        public string Site_ID { get; set; } = string.Empty;
        public int Status { get; set; }
        public string Category_ID { get; set; } = string.Empty;
    }

    public class InvHistory
    {
        public string DOCNUMBER { get; set; } = string.Empty;
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string Reason { get; set; } = string.Empty;
        public string Employee { get; set; } = string.Empty;
        public string Store_ID { get; set; } = string.Empty;
        public string Site_ID { get; set; } = string.Empty;
        public string SEARCH { get; set; } = string.Empty;
    }

    public class ICHeader
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
        public string Site_ID { get; set; } = string.Empty;
        public string Site_Name { get; set; } = string.Empty;
        public int Type_Inventory_Count { get; set; }
        public string Notes { get; set; } = string.Empty;
        public int Status { get; set; }
        public int InvCount { get; set; }
        public List<ICDetails> ICDetails { get; set; } = new List<ICDetails>();
    }

    public class ICDetails
    {
        public int Lineitmseq { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public string Item_Description { get; set; } = string.Empty;
        public string Item_SKU { get; set; } = string.Empty;
        public decimal Expected_Stock { get; set; }
        public decimal Counted_Stock { get; set; }
        public decimal Different_Stock { get; set; }
        public decimal Item_Cost { get; set; }
        public decimal Item_Cost_Different { get; set; }
    }

    public class ParamReport
    {
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public int FilterTime { get; set; }
        public DateTime TimeFrom { get; set; }
        public DateTime TimeTo { get; set; }
    }

    public class GenerateNumber
    {
        public string DOCID { get; set; }
    }

    public class UploadFile
    {
        public IFormFile file { set; get; }
        public int type { set; get; }
        public string db { set; get; }
    }

    public class RootPath
    {
        public string PATH_FILE { set; get; }
    }
}
