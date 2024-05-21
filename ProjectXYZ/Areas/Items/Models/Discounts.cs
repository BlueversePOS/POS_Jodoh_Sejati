using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectXYZ.Areas.Items.Models
{
    public class Discount
    {
        public string Discount_ID { get; set; } = string.Empty;
        public string DISCOUNT_NAME { get; set; } = string.Empty;
        public int TYPE { get; set; }
        public int DISCOUNT_TYPE { get; set; }
        public decimal DISCOUNT_VALUE { get; set; }
        public int RESTRICTED_ACCESS { get; set; }
    }
}
