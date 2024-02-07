using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Employees.Models;
using ProjectXYZ.Areas.Setting.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Setting.Controllers
{
    public class SettingsController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public SettingsRepo dtaccess = new SettingsRepo();
        FuncHelper func = new FuncHelper();

        // GET: Setting/Settings
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            ViewBag.Countries = CultureInfo.GetCultures(CultureTypes.SpecificCultures)
                .Select(x => new SelectListItem() { Value = new RegionInfo(x.LCID).Name, Text = new RegionInfo(x.LCID).EnglishName })
                .ToList()
                .GroupBy(c => c.Text)
                .Select(c => c.First())
                .OrderBy(c => c.Text);

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataFeatures(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataFeatures(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Feature_ID = ro["Feature_ID"],
                                Feature_Shift = ro["Feature_Shift"],
                                Feature_TimeClock = ro["Feature_TimeClock"],
                                Feature_LowStock = ro["Feature_LowStock"],
                                Feature_NegativeStock = ro["Feature_NegativeStock"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveFeatures(string param)
        {
            bool success = false;
            Features model = new Features();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Features>(decryptmodel);

                DataTable ObjList = dtaccess.SaveFeatures(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Feature_ID = ro["Feature_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataPaymentType(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataPaymentType(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Payment_ID = ro["Payment_ID"],
                                Payment_Type = ro["Payment_Type"],
                                Payment_Name = ro["Payment_Name"],
                                LineItem = ro["LineItem"],
                                AllStore = ro["AllStore"],
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SavePaymentType(string param)
        {
            bool success = false;
            PaymentType model = new PaymentType();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<PaymentType>(decryptmodel);

                DataTable ObjList = dtaccess.SavePaymentType(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Payment_ID = ro["Payment_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataTaxes(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataTaxes(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Tax_ID = ro["Tax_ID"],
                                Tax_Name = ro["Tax_Name"],
                                Tax_Rate = ro["Tax_Rate"],
                                Tax_Type = ro["Tax_Type"],
                                Tax_Option = ro["Tax_Option"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveTaxes(string param)
        {
            bool success = false;
            Taxes model = new Taxes();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Taxes>(decryptmodel);

                DataTable ObjList = dtaccess.SaveTaxes(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Tax_ID = ro["Tax_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataStores(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataStores(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"],
                                Address = ro["Address"],
                                Country = ro["Country"],
                                Province = ro["Province"],
                                City = ro["City"],
                                Postal_Code = ro["Postal_Code"],
                                Phone = ro["Phone"],
                                Description = ro["Description"],
                                FULL_ADDRESS = ro["FULL_ADDRESS"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveStore(string param)
        {
            bool success = false;
            Stores model = new Stores();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Stores>(decryptmodel);

                DataTable ObjList = dtaccess.SaveStore(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Store_ID = ro["Store_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataSalesType(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataSalesType(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                SalesType_ID = ro["SalesType_ID"],
                                SalesType_Name = ro["SalesType_Name"],
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetNumberMaster(string param)
        {
            bool success = false;
            SettingsDocID model = new SettingsDocID();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<SettingsDocID>(decryptmodel);

                DataTable ObjList = dtaccess.GetNumberMaster(model);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NEWNUMBER = ro["NEWNUMBER"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveSalesType(string param)
        {
            bool success = false;
            SalesType model = new SalesType();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<SalesType>(decryptmodel);

                DataTable ObjList = dtaccess.SaveSalesType(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                SalesType_ID = ro["SalesType_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataSites(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataSites(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Site_ID = ro["Site_ID"],
                                Site_Name = ro["Site_Name"],
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"],
                                DefaultSite = ro["DefaultSite"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveSite(string param)
        {
            bool success = false;
            Sites model = new Sites();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Sites>(decryptmodel);

                DataTable ObjList = dtaccess.SaveSite(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Site_ID = ro["Site_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataDevices(string ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataDevices(ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                POS_Device_ID = ro["POS_Device_ID"],
                                POS_Device_Name = ro["POS_Device_Name"],
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [ValidateAntiForgeryToken]
        [HttpPost]
        [Obsolete]
        public JsonResult SaveDevice(string param)
        {
            bool success = false;
            Devices model = new Devices();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Devices>(decryptmodel);

                DataTable ObjList = dtaccess.SaveDevice(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                POS_Device_ID = ro["POS_Device_ID"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetDataStoresDDL(string Prefix)
        {
            bool success = false;
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = dtaccess.GetDataStores("");
                List<DataRow> rows = ObjList.Select().ToList();

                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Store_Name='{0}'", Prefix)).ToList();
                }

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"],
                                Address = ro["Address"],
                                Country = ro["Country"],
                                Province = ro["Province"],
                                City = ro["City"],
                                Postal_Code = ro["Postal_Code"],
                                Phone = ro["Phone"],
                                Description = ro["Description"],
                                FULL_ADDRESS = ro["FULL_ADDRESS"]
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, data = list }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {

                var jsonResult = Json(new { success = success, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }
    }
}