using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Inventory.Models
{
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
}