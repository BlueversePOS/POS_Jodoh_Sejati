using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Inventory.Models;
using ProjectXYZ.Areas.Items.Models;
using ProjectXYZ.Areas.Setting.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Inventory.Controllers
{
    public class StockAdjustmentController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public StockAdjustmentRepo dtaccess = new StockAdjustmentRepo();
        public SettingsRepo settingsRepo = new SettingsRepo();
        FuncHelper func = new FuncHelper();

        // GET: Inventory/StockAdjustment
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        
        public JsonResult GetReason(string Prefix)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = dtaccess.GetReason();
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("REASON='{0}'", Prefix)).ToList();
                }
                var list = (from DataRow ro in rows
                            select new
                            {
                                REASON = ro["REASON"]
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
        [HttpPost]
        
        public JsonResult GetDataSites(string Prefix)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = settingsRepo.GetDataSites("");
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Site_ID='{0}' or Site_Name='{0}'", Prefix)).ToList();
                }
                var list = (from DataRow ro in rows
                            select new
                            {
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
        [HttpPost]
        
        public JsonResult GetDataStores(string Prefix)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = settingsRepo.GetDataStores("");
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Store_ID='{0}' or Store_Name='{0}'", Prefix)).ToList();
                }
                var list = (from DataRow ro in rows
                            select new
                            {
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
        [HttpPost]
        
        public JsonResult AdjGetDataItems(SAFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.AdjGetDataItems(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_Description = ro["Item_Description"],
                                Item_Cost = ro["Item_Cost"],
                                Item_SKU = ro["Item_SKU"],
                                InStock = ro["InStock"]
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
        [HttpPost]
        
        public JsonResult AdjSearchDataItems(SAFilterItem model, string Prefix)
        {
            bool success = false;
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = dtaccess.AdjGetDataItems(model);
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Item_Description like '%{0}%'", Prefix)).ToList();
                }

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_Description = ro["Item_Description"],
                                Item_Cost = ro["Item_Cost"],
                                Item_SKU = ro["Item_SKU"],
                                InStock = ro["InStock"]
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
        [HttpPost]
        
        public JsonResult SaveAdj(string param)
        {
            bool success = false;
            SAHeader model = new SAHeader();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<SAHeader>(decryptmodel);

                DataTable ObjList = dtaccess.SaveAdj(model);
                List<DataRow> rows = ObjList.Select().ToList();

                string DOCNUMBER = string.IsNullOrEmpty(rows[0]["DOCNUMBER"].ToString()) ? "" : rows[0]["DOCNUMBER"].ToString().Trim();

                success = true;
                var jsonResult = Json(new { success = success, message = DOCNUMBER }, JsonRequestBehavior.AllowGet);
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
        [HttpPost]
        
        public JsonResult AdjGetDataList(SAFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.AdjGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Reason = ro["Reason"],
                                Store_Name = ro["Store_Name"],
                                Site_ID = ro["Site_ID"],
                                Site_Name = ro["Site_Name"],
                                QUANTITY = ro["QUANTITY"]
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
        [HttpPost]
        
        public JsonResult AdjGetDataHeader(SAFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.AdjGetDataHeader(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Site_ID = ro["Site_ID"],
                                Site_Name = ro["Site_Name"],
                                Reason = ro["Reason"],
                                Total_Line_Item = ro["Total_Line_Item"],
                                Notes = ro["Notes"],
                                Created_User = ro["Created_User"],
                                Modified_User = ro["Modified_User"]
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
        [HttpPost]
        
        public JsonResult AdjGetDataDetail(SAFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.AdjGetDataDetail(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Reason = ro["Reason"],
                                Lineitmseq = ro["Lineitmseq"],
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                Item_SKU = ro["Item_SKU"],
                                Qty_Stock = ro["Qty_Stock"],
                                Qty_Add_Stock = ro["Qty_Add_Stock"],
                                Qty_Remove_Stock = ro["Qty_Remove_Stock"],
                                Item_Cost = ro["Item_Cost"],
                                Qty_After_Stock = ro["Qty_After_Stock"],
                                Expected_Stock = ro["Expected_Stock"],
                                Counted_Stock = ro["Counted_Stock"]
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