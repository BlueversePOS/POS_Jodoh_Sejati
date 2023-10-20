using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Models
{
    public class DataAccessCompany
    {
        public static string ConnectionStringBuildRes()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            FuncHelper func = new FuncHelper();

            #region testing encrypt
            //for testing
            string encryptpass = "sasasa";
            string descryptpass = func.Encrypt(encryptpass);
            #endregion

            var DBConfigDS = System.Configuration.ConfigurationManager.AppSettings["DBConfigDS"];
            var DBConfigDB = System.Configuration.ConfigurationManager.AppSettings["DBConfigDB"];
            var DBConfigUser = System.Configuration.ConfigurationManager.AppSettings["DBConfigUser"];
            //var DBConfigPwd = System.Configuration.ConfigurationManager.AppSettings["DBConfigPwd"];
            var DBConfigEncPwd = System.Configuration.ConfigurationManager.AppSettings["DBConfigPwd"];
            var DBConfigPwd = func.Decrypt(DBConfigEncPwd);

            builder.DataSource = DBConfigDS;
            builder.InitialCatalog = DBConfigDB;
            builder.UserID = DBConfigUser;
            builder.Password = DBConfigPwd;

            return builder.ConnectionString;
        }
    }
}