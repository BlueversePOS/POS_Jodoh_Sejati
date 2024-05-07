using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Inventory.Models
{
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
}