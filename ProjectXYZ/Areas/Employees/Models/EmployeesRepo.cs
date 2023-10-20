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

namespace ProjectXYZ.Areas.Employees.Models
{
    public class EmployeesRepo
    {
        private string urlpwoapi = System.Configuration.ConfigurationManager.AppSettings["PORTALAPI"];
        private string tokenapi = System.Configuration.ConfigurationManager.AppSettings["PORTALTOKEN"];
        public async Task<string> callAPI(string url, string inputJson)
        {
            string rtn = "";

            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(10);
                var content = new StringContent(inputJson, Encoding.UTF8, "application/json");
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenapi);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage tokenResponse = await client.PostAsync(url, content);
                var result = await tokenResponse.Content.ReadAsStringAsync();
                rtn = result;
            }

            return rtn;
        }
    }
}