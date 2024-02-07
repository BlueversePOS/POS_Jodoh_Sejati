using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Inventory.Models
{
    public class SAFilterItem
    {
        public string UserID { get; set; } = string.Empty;
        public string DOCNUMBER { get; set; } = string.Empty;
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
        public List<SADetail> SADetails { get; set;} = new List<SADetail>();
    }

    public class SADetail
    {
        public DateTime DOCDATE { get; set; }
        public string Reason { get; set; } = string.Empty;
        public int Lineitmseq { get; set; }
        public string Item_Number { get; set; } = string.Empty;
        public string Item_Description { get; set; } = string.Empty;
        public decimal Qty_Stock { get; set; }
        public decimal Qty_Add_Stock { get; set; }
        public decimal Qty_Remove_Stock { get; set; }
        public decimal Item_Cost { get; set; }
        public decimal Qty_After_Stock { get; set; }
        public decimal Expected_Stock { get; set; }
        public decimal Counted_Stock { get; set; }
    }
}