using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Net;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ProjectXYZ.Helpers
{
    public class FuncHelper
    {
        [Obsolete]
        private readonly string urlapi = ConfigurationSettings.AppSettings["PORTALAPI"];
        [Obsolete]
        private readonly string tokenapi = ConfigurationSettings.AppSettings["PORTALTOKEN"];

        public static Dictionary<string, object> ConvertDataTableToDictionary(DataTable dtDtl, string detailtagname, int cnt)
        {
            string tot = "total";
            Dictionary<string, object> parentRow = new Dictionary<string, object>()
            {
                { tot, cnt }
            };

            if (dtDtl != null)
            {
                List<Dictionary<string, object>> childs = new List<Dictionary<string, object>>();
                Dictionary<string, object> childRow = new Dictionary<string, object>();

                foreach (DataRow row in dtDtl.Rows)
                {
                    childRow = new Dictionary<string, object>();
                    foreach (DataColumn col in dtDtl.Columns)
                    {
                        childRow.Add(col.ColumnName, row[col]);
                    }
                    childs.Add(childRow);
                }

                parentRow.Add(detailtagname, childs);
            }

            return parentRow;
        }
        public string Encrypt(string encryptString)
        {
            try
            {
                string EncryptionKey = "BlueversePOS";
                byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    MemoryStream ms = new MemoryStream();
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
                return encryptString;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string Decrypt(string cipherText)
        {
            try
            {
                string EncryptionKey = "BlueversePOS";
                cipherText = cipherText.Replace(" ", "+");
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    MemoryStream ms = new MemoryStream();
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
                return cipherText;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private static bool IsJson(string jsonData)
        {
            return jsonData.Trim().Substring(0, 1).IndexOfAny(new[] { '[', '{' }) == 0;
        }

        [Obsolete]
        public dynamic SyncAPI(string urlwebapi, dynamic model)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            dynamic jsonapiresult;

            try
            {
                string urlall = urlapi + urlwebapi;
                string inputJson = JsonConvert.SerializeObject(model);
                jsonapiresult = Task.Run(async () => await callAPI(urlall, tokenapi, inputJson)).Result;

                #region RETURNVALUE

                if (string.IsNullOrEmpty(jsonapiresult))
                {
                    throw new Exception("No Access API");
                }
                else if (!IsJson(jsonapiresult))
                {
                    #region geterror notfound from api

                    string regex = @"<title>\s*(.+?)\s*</title>";
                    Match result = Regex.Match(jsonapiresult, regex, RegexOptions.Singleline);
                    string title = result.Groups[0].Value;
                    title = Regex.Replace(title, "<.*?>", "");
                    if (string.IsNullOrEmpty(title))
                    {
                        throw new Exception("Not Found");
                    }
                    else
                    {
                        throw new Exception(title);
                    }

                    #endregion
                }

                var d = JsonConvert.DeserializeObject<dynamic>(jsonapiresult);
                if (d is bool)
                {
                    if (d == true || d == false)
                    {
                        return d;
                    }
                    else
                    {
                        string errormsg = Convert.ToString(d["msg"]);
                        throw new Exception(errormsg);
                    }
                }
                else if (jsonapiresult.StartsWith("[")) //jadi table
                {
                    if (d == null) //no data
                    {
                        return dt;
                    }
                    else if (d.Count == 0)
                    {
                        return dt;
                    }
                    else //with data
                    {
                        //JSON Array
                        dt = (DataTable)JsonConvert.DeserializeObject(jsonapiresult, (typeof(DataTable)));
                        //dt = d;
                    }
                }
                else if (d.Count > 0) //dataset
                {
                    string statuscode = Convert.ToString(d["code"]);
                    if (statuscode == "200")
                    {
                        if (d.ContainsKey("desc"))
                        {
                            string errormsg = Convert.ToString(d["desc"]);
                            return dt;
                        }
                        else
                        {
                            dynamic hasil = JsonConvert.SerializeObject(d["hasil"]);
                            ds = (DataSet)JsonConvert.DeserializeObject(hasil, (typeof(DataSet)));
                            return ds;
                        }
                    }
                    else
                    {
                        string errormsg = Convert.ToString(d["desc"]);
                        throw new Exception(errormsg);
                    }
                }
                else
                {
                    //string errormsg = Convert.ToString(d["desc"]);
                    //throw new Exception(errormsg);
                    string errormsg = "";
                    if (d.ContainsKey("desc"))
                    {
                        errormsg = Convert.ToString(d["desc"]);
                    }
                    else if (d.ContainsKey("code"))
                    {
                        string statuscode = Convert.ToString(d["code"]);
                        if(statuscode == "200")
                        {
                            return true;
                        }
                        else
                        {
                            errormsg = Convert.ToString(d["message"]);
                        }
                    }
                    else if (d.ContainsKey("result"))
                    {
                        //var dyn = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(d["results"]);
                        dynamic nilai = Convert.ToString(d["result"]);
                        dt = (DataTable)JsonConvert.DeserializeObject(nilai, (typeof(DataTable)));
                        return dt;
                    }
                    else if (d.ContainsKey("table"))
                    {
                        ds = (DataSet)JsonConvert.DeserializeObject(jsonapiresult, (typeof(DataSet)));
                        return ds;
                    }
                    else
                    {
                        #region TAMBAHAN CHECK

                        var dyn = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(jsonapiresult);
                        foreach (var key in dyn.Keys)
                        {
                            // check if the value is not null or empty.
                            if (!string.IsNullOrEmpty(dyn[key].Last.Value))
                            {
                                var value = dyn[key].Last.Value;
                                // code to do something with 

                                errormsg = errormsg + value + ", ";
                            }
                        }

                        if (!string.IsNullOrEmpty(errormsg))
                        {
                            errormsg = errormsg.Remove(errormsg.Length - 2);
                        }

                        #endregion
                    }
                    throw new Exception(errormsg);
                }

                #endregion

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dt;

        }

        private async Task<dynamic> callAPI(string url, string tokenapi, string inputJson)
        {
            dynamic rtn;

            var httpClientHandler = new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (message, cert, chain, errors) => true
            };

            using (HttpClient client = new HttpClient())
            {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                client.Timeout = TimeSpan.FromMinutes(10);
                var content = new StringContent(inputJson, Encoding.UTF8, "application/json");
                if (!string.IsNullOrEmpty(tokenapi)) //add token
                {
                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenapi);
                }
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage tokenResponse = await client.PostAsync(url, content).ConfigureAwait(false);
                var result = tokenResponse.Content.ReadAsStringAsync().Result;
                rtn = result;
            }
            return rtn;
        }
    }
}