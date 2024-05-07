using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Inventory.Models
{
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
}