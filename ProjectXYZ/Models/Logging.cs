using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Data;
using CMS.Helpers;
using System.Data.SqlClient;
using System.Diagnostics;

namespace CMS.Models
{
    public class Logging
    {
        public string USERID { get; set; } = "";
        public string INTERID { get; set; } = "";
        public string MethodName { get; set; } = "";
        public string url { get; set; } = "";
        public string Header_1 { get; set; } = "";
        public string Header_2 { get; set; } = "";
        public string Header_3 { get; set; } = "";
        public string Header_4 { get; set; } = "";
        public string Header_5 { get; set; } = "";
        public string msg { get; set; } = "";
        public string calledfrom { get; set; } = "";
        public DateTime LogDateTime { get; set; }
        public DateTime logdate { get; } = DateTime.Now.Date;
        public DateTime logtime { get; } = new DateTime(1900, 1, 1, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
    }
    public class LoggingRepository
    {
        //FuncHelper func = new FuncHelper();
        //private string urlpwoapi = System.Configuration.ConfigurationManager.AppSettings["PORTALAPI"];
        //private string tokenapi = System.Configuration.ConfigurationManager.AppSettings["PORTALTOKEN"];
        //public async Task<string> callAPI(string url, string inputJson)
        //{
        //    string rtn = "";

        //    using (HttpClient client = new HttpClient())
        //    {
        //        client.Timeout = TimeSpan.FromMinutes(10);
        //        var content = new StringContent(inputJson, Encoding.UTF8, "application/json");
        //        client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenapi);
        //        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        //        HttpResponseMessage tokenResponse = await client.PostAsync(url, content);
        //        var result = await tokenResponse.Content.ReadAsStringAsync();
        //        rtn = result;
        //    }

        //    return rtn;
        //}

        readonly string conString;

        public LoggingRepository()
        {
            conString = DataAccessCompany.ConnectionStringBuildRes();
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(conString);
            }
        }

        private SqlConnection conn;
        private SqlTransaction trans;

        //[Obsolete]
        internal void ErrorLogging(Logging log)
        {
            if (log.url.Length > 255)
            {
                log.url = log.url.Substring(0, 254);
            }
            if (log.Header_1.Length > 150)
            {
                log.Header_1 = log.Header_1.Substring(0, 149);
            }
            if (log.Header_2.Length > 150)
            {
                log.Header_2 = log.Header_2.Substring(0, 149);
            }
            if (log.Header_3.Length > 150)
            {
                log.Header_3 = log.Header_3.Substring(0, 149);
            }
            if (log.Header_4.Length > 150)
            {
                log.Header_4 = log.Header_4.Substring(0, 149);
            }
            if (log.Header_5.Length > 150)
            {
                log.Header_5 = log.Header_5.Substring(0, 149);
            }
            if (log.USERID.Length > 15)
            {
                log.USERID = log.USERID.Substring(0, 14);
            }
            if (log.calledfrom.Length > 50)
            {
                log.calledfrom = log.calledfrom.Substring(0, 49);
            }

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(Connection.ConnectionString)
            {
                InitialCatalog = log.INTERID
            };

            conn = new SqlConnection(builder.ConnectionString);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            trans = conn.BeginTransaction();

            try
            {
                SqlCommand command = new SqlCommand("Insert_Request_Logs", conn, trans)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@URL", log.url ?? "");
                command.Parameters.AddWithValue("@Header_1", log.Header_1 ?? "");
                command.Parameters.AddWithValue("@Header_2", log.Header_2 ?? "");
                command.Parameters.AddWithValue("@Header_3", log.Header_3 ?? "");
                command.Parameters.AddWithValue("@Header_4", log.Header_4 ?? "");
                command.Parameters.AddWithValue("@Header_5", log.Header_5 ?? "");
                command.Parameters.AddWithValue("@msg", log.msg ?? "");
                command.Parameters.AddWithValue("@USERID", log.USERID ?? "");
                command.Parameters.AddWithValue("@INTERID", log.INTERID ?? "");
                command.Parameters.AddWithValue("@calledfrom", log.calledfrom ?? "");
                command.Parameters.AddWithValue("@logdate", log.logdate);
                command.Parameters.AddWithValue("@logtime", log.logtime);

                command.ExecuteNonQuery();

                command = new SqlCommand("Insert_Error_Logs", conn, trans)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@MethodName", log.MethodName ?? "");
                command.Parameters.AddWithValue("@USERID", log.USERID ?? "");
                command.Parameters.AddWithValue("@INTERID", log.INTERID ?? "");
                command.Parameters.AddWithValue("@LogDateTime", log.LogDateTime);
                command.Parameters.AddWithValue("@Message", log.msg ?? "");

                command.ExecuteNonQuery();

                trans.Commit();
            }
            catch (Exception ex)
            {
                trans?.Rollback();
                throw new Exception(ex.Message);
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }

                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
        }
    }
}