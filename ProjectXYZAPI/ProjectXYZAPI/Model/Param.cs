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

    public class UserLogin
    {
        public string EmailAddress { get; set; }
        public string PASSWORD { get; set; }
    }

    public class UserAccount
    {
        public string UserID { get; set; }
        public string EmailAddress { get; set; }
        public string PASSWORD { get; set; }
        public string Business_Name { get; set; }
        public string Currency { get; set; }
        public string Country { get; set; }
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
