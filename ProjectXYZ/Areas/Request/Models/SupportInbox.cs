using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.Areas.Request.Models
{
    public class SupportInbox
    {
        public string INTERID { get; set; }
        public string VENDORID { get; set; }
        public string IPADDRESS { get; set; }
        public string BROWSER { get; set; }
        public int DOCNM { get; set; }
        public int STATUS { get; set; }
        public string EXPLANATION { get; set; }
        public string SEARCH { get; set; }
    }
}