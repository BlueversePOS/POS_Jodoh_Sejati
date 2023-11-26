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
using System.Reflection;

namespace ProjectXYZ.Areas.Employees.Models
{
    public class AccessRightsRepo
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

        public DataTable GetAccessRight()
        {
            DataTable dt = new DataTable();
            string jsonapiresult = "";

            try
            {
                #region GetDataJson

                string USERID = HttpContext.Current.Session["USER"].ToString();

                var param = new
                {
                    interid = database,//model.INTERID
                    user = USERID
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetAccessRight";
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

        public DataTable SaveAccessRight(AccessRights model)
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
                    Role_ID = model.Role_ID,
                    Role_Name = model.Role_Name,
                    POS_Flag = model.POS_Flag,
                    POS_AccessPayments = model.POS_AccessPayments,
                    POS_ApplyDiscount = model.POS_ApplyDiscount,
                    POS_ChangeTaxes = model.POS_ChangeTaxes,
                    POS_ViewReceipt = model.POS_ViewReceipt,
                    POS_ReprintSendReceipt = model.POS_ReprintSendReceipt,
                    POS_ViewShift = model.POS_ViewShift,
                    POS_ManageItemsPOS = model.POS_ManageItemsPOS,
                    POS_ViewCostPOS = model.POS_ViewCostPOS,
                    POS_ChangeSetting = model.POS_ChangeSetting,
                    BckOffice_Flag = model.BckOffice_Flag,
                    BckOffice_ViewSales = model.BckOffice_ViewSales,
                    BckOffice_ManageItemsOff = model.BckOffice_ManageItemsOff,
                    BckOffice_ViewCostOff = model.BckOffice_ViewCostOff,
                    BckOffice_ManageEmployee = model.BckOffice_ManageEmployee,
                    BckOffice_ManageCustomers = model.BckOffice_ManageCustomers,
                    BckOffice_EditSetting = model.BckOffice_EditSetting,
                    BckOffice_ManagePayTypes = model.BckOffice_ManagePayTypes,
                    BckOffice_ManageTaxes = model.BckOffice_ManageTaxes,
                    BckOffice_POSDevices = model.BckOffice_POSDevices
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/SaveAccessRight";
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