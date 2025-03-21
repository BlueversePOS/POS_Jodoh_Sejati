﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ProjectXYZ.Areas.Items.Models
{
    public class ItemListRepo
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

        public DataTable GetCompositeItems(string Item_Number)
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
                    Item_Number = Item_Number
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetCompositeItems";
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

        public DataTable GetDataItems(FilterItem model)
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
                    Item_Number = model.Item_Number,
                    Category_ID = model.Category_ID,
                    Item_Name = model.Item_Name
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetDataItems";
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

        public DataTable GetDataItemComposite(string Item_Number)
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
                    Item_Number = Item_Number
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetDataItemComposite";
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

        public DataTable GetDataItemVariant(string Item_Number)
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
                    Item_Number = Item_Number
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/GetDataItemVariant";
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

        public DataTable SaveItem(ItemList model)
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
                    Item_Number = model.Item_Number,
                    Item_Name = model.Item_Name,
                    Item_Description = model.Item_Description,
                    UOFM = model.UOFM,
                    Category_ID = model.Category_ID,
                    Item_Sales = model.Item_Sales,
                    Item_SoldBy = model.Item_SoldBy,
                    Item_Price = model.Item_Price,
                    Item_Cost = model.Item_Cost,
                    Item_SKU = model.Item_SKU,
                    Item_Barcode = model.Item_Barcode,
                    Composite_Item = model.Composite_Item,
                    Track_Stock = model.Track_Stock,
                    InStock = model.InStock,
                    LowStock = model.LowStock,
                    Tax_ID = model.Tax_ID,
                    Representation = model.Representation,
                    Item_Color = model.Item_Color,
                    Item_Shape = model.Item_Shape,
                    Item_Image = model.Item_Image,
                    CompositeItem = model.CompositeItem,
                    ItemVariant = model.ItemVariant
                };

                string inputJson = JsonConvert.SerializeObject(param);
                string urlapi = urlpwoapi + "/api/Service/SaveItem";
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