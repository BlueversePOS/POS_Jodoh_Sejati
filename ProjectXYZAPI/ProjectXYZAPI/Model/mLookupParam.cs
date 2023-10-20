using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectXYZAPI.Model
{
    public class mLookupParam
    {
        public string interid { get; set; }
        public string search { get; set; }
        public int length { get; set; }
        public int from { get; set; }
        public int orderCol { get; set; }
        public string orderType { get; set; }
        public string user { get; set; }
    }

    public class mLookupParam2
    {
        public string searchApproval { get; set; }
        public bool Mode1 { get; set; }
        public bool Mode2 { get; set; }
        public bool Mode3 { get; set; }
        public bool Mode4 { get; set; }
        public bool Mode5 { get; set; }
        public bool Mode6 { get; set; }
        public string search { get; set; }
        public int length { get; set; }
        public int from { get; set; }
        public int orderCol { get; set; }
        public string orderType { get; set; }
        public string param1 { get; set; }
        public string param2 { get; set; }
        public string param3 { get; set; }
        public string param4 { get; set; }
        public string param5 { get; set; }
        public string param6 { get; set; }
    }
}
