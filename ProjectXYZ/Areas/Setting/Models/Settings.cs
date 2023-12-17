using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Setting.Models
{
    public class Settings
    {
        public string interid { get; set; }
        public string ID { get; set; }
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
}