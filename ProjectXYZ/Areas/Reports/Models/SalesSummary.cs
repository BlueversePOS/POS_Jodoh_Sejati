using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Reports.Models
{
    public class SalesSummary
    {
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public int FilterTime { get; set; }
        public DateTime TimeFrom { get; set; }
        public DateTime TimeTo { get; set; }
        public int FilterChart { get; set; }
        public string Employee_ID { get; set; }
    }
}