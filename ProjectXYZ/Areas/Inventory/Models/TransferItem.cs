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
        public string SourceSite_ID { get; set; } = string.Empty;
        public string DestSite_ID { get; set; } = string.Empty;
    }
    public class TransferItem
    {
    }
}