using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ProjectXYZ.Models
{
    public class HomeRepository
    {
        private string urlpwoapi = System.Configuration.ConfigurationManager.AppSettings["PORTALAPI"];
        private string tokenapi = System.Configuration.ConfigurationManager.AppSettings["PORTALTOKEN"];
        private string database = System.Configuration.ConfigurationManager.AppSettings["DBConfigDB"];
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

        public DataTable getDataUser(UserLogin model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                var param = new
                {
                    EmailAddress = model.EmailAddress,
                    PASSWORD = model.PASSWORD
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/getDataUser";
                jsonapiresult = Task.Run(async () => await callAPI(urlapi, inputJson)).Result;

                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //var d = jss.Deserialize<dynamic>(jsonapiresult);
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
                            dt = (DataTable)JsonConvert.DeserializeObject(hasil, (typeof(DataTable)));
                            return dt;
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
                    string errormsg = "";
                    if (d.ContainsKey("desc"))
                    {
                        errormsg = Convert.ToString(d["desc"]);
                    }
                    else if (d.ContainsKey("result"))
                    {
                        //var dyn = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(d["results"]);
                        dynamic nilai = Convert.ToString(d["result"]);
                        dt = (DataTable)JsonConvert.DeserializeObject(nilai, (typeof(DataTable)));
                        return dt;
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
                throw ex;
            }

            return dt;
        }

        public DataTable SignUpUser(UserAccount model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                var param = new
                {
                    UserID = model.UserID,
                    EmailAddress = model.EmailAddress,
                    PASSWORD = model.PASSWORD,
                    Business_Name = model.Business_Name,
                    Currency = model.Currency,
                    Country = model.Country
    };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/SignUpUser";
                jsonapiresult = Task.Run(async () => await callAPI(urlapi, inputJson)).Result;

                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //var d = jss.Deserialize<dynamic>(jsonapiresult);
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
                            dt = (DataTable)JsonConvert.DeserializeObject(hasil, (typeof(DataTable)));
                            return dt;
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
                    string errormsg = "";
                    if (d.ContainsKey("desc"))
                    {
                        errormsg = Convert.ToString(d["desc"]);
                    }
                    else if (d.ContainsKey("result"))
                    {
                        //var dyn = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(d["results"]);
                        dynamic nilai = Convert.ToString(d["result"]);
                        dt = (DataTable)JsonConvert.DeserializeObject(nilai, (typeof(DataTable)));
                        return dt;
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
                throw ex;
            }

            return dt;
        }

        public DataTable ResetPassword(UserAccount model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                var param = new
                {
                    EmailAddress = model.EmailAddress
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/ResetPassword";
                jsonapiresult = Task.Run(async () => await callAPI(urlapi, inputJson)).Result;

                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //var d = jss.Deserialize<dynamic>(jsonapiresult);
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
                            dt = (DataTable)JsonConvert.DeserializeObject(hasil, (typeof(DataTable)));
                            return dt;
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
                    string errormsg = "";
                    if (d.ContainsKey("desc"))
                    {
                        errormsg = Convert.ToString(d["desc"]);
                    }
                    else if (d.ContainsKey("result"))
                    {
                        //var dyn = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(d["results"]);
                        dynamic nilai = Convert.ToString(d["result"]);
                        dt = (DataTable)JsonConvert.DeserializeObject(nilai, (typeof(DataTable)));
                        return dt;
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
                throw ex;
            }

            return dt;
        }
    }
}