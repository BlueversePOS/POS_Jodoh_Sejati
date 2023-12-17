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
    }

    public class Discount
    {
        public string UserID { get; set; }
        public string DISCOUNT_ID { get; set; } = string.Empty;
        public string DISCOUNT_NAME { get; set; } = string.Empty;
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
        public int Tax_10 { get; set; }
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
