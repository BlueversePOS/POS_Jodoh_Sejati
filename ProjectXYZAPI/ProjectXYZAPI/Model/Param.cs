using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectXYZAPI.Model
{
    public class Param
    {
        public string interid { get; set; }
    }

    public class isLogin
    {
        public string INTERCOMPANY { get; set; }
        public string COMPANY_NAME { get; set; }
        public string USER { get; set; }
        public string PASSWORD { get; set; }
        public string SessionID { get; set; }
    }

    public class UploadFile
    {
        public IFormFile file { set; get; }
        public int type { set; get; }
        public string db { set; get; }
    }

    public class RootPath
    {
        public string PATH_FILE { set; get; }
    }
}
