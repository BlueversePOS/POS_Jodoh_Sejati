using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Customer.Models
{
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
}