using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ProjectXYZ.Areas.Inventory.Models
{
    public class StockAdjustmentRepo
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

        public DataTable GetReason()
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    UserID = USERID
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetReason";
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

        public DataTable SaveAdj(SAHeader model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    UserID = USERID,
                    DOCNUMBER = model.DOCNUMBER,
                    DOCDATE = model.DOCDATE,
                    Site_ID = model.Site_ID,
                    Site_Name = model.Site_Name,
                    Reason = model.Reason,
                    Total_Line_Item = model.Total_Line_Item,
                    Notes = model.Notes,
                    SADetails = model.SADetails
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/SaveAdj";
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

        public DataTable AdjGetDataList(SAFilterItem model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    Site_ID = model.Site_ID,
                    Store_ID = model.Store_ID,
                    Reason = model.Reason
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/AdjGetDataList";
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

        public DataTable AdjGetDataHeader(SAFilterItem model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    DOCNUMBER = model.DOCNUMBER
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/AdjGetDataHeader";
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

        public DataTable AdjGetDataDetail(SAFilterItem model)
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    DOCNUMBER = model.DOCNUMBER
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/AdjGetDataDetail";
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