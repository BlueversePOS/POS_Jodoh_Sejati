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
    public class TransferItemController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public TransferItemRepo dtaccess = new TransferItemRepo();
        public SettingsRepo settingsRepo = new SettingsRepo();
        FuncHelper func = new FuncHelper();

        // GET: Inventory/TransferItem
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        [Obsolete]
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
        [Obsolete]
        public JsonResult TrfItemGetItemBySite(TrfItemFilter model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.TrfItemGetItemBySite(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_Description = ro["Item_Description"],
                                SourceStock = ro["SourceStock"],
                                DestinationStock = ro["DestinationStock"],
                                Item_SKU = ro["Item_SKU"]
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
        [Obsolete]
        public JsonResult TrfItemSearchItemBySite(TrfItemFilter model, string Prefix)
        {
            bool success = false;
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = dtaccess.TrfItemGetItemBySite(model);
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
                                SourceStock = ro["SourceStock"],
                                DestinationStock = ro["DestinationStock"],
                                Item_SKU = ro["Item_SKU"]
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
        [Obsolete]
        public JsonResult TrfItemGetDataTransfer(TrfItemFilter model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.TrfItemGetDataTransfer(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                DATERECEIVED = ro["DATERECEIVED"],
                                SourceSite_ID = ro["SourceSite_ID"],
                                SourceSite_Name = ro["SourceSite_Name"],
                                DestSite_ID = ro["DestSite_ID"],
                                DestSite_Name = ro["DestSite_Name"],
                                Status = ro["Status"],
                                Qty_Transfer = ro["Qty_Transfer"]
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
        [Obsolete]
        public JsonResult TrfItemGetDataHeader(TrfItemFilter model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.TrfItemGetDataHeader(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                SourceSite_ID = ro["SourceSite_ID"],
                                SourceSite_Name = ro["SourceSite_Name"],
                                DestSite_ID = ro["DestSite_ID"],
                                DestSite_Name = ro["DestSite_Name"],
                                Total_Line_Item = ro["Total_Line_Item"],
                                Notes = ro["Notes"],
                                Status = ro["Status"],
                                Modified_User = ro["Modified_User"],
                                Role_Name = ro["Role_Name"]
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
        [Obsolete]
        public JsonResult TrfItemGetDataDetail(TrfItemFilter model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.TrfItemGetDataDetail(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Lineitmseq = ro["Lineitmseq"],
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_SKU = ro["Item_SKU"],
                                Source_Stock = ro["Source_Stock"],
                                Dest_Stock = ro["Dest_Stock"],
                                Qty_Transfer = ro["Qty_Transfer"]
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
        [Obsolete]
        public JsonResult TrfItemSaveTransfer(string param)
        {
            bool success = false;
            TransferItemHeader model = new TransferItemHeader();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<TransferItemHeader>(decryptmodel);

                DataTable ObjList = dtaccess.TrfItemSaveTransfer(model);
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
        [Obsolete]
        public JsonResult TrfItemReceiveItem(string param)
        {
            bool success = false;
            TrfItemFilter model = new TrfItemFilter();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<TrfItemFilter>(decryptmodel);

                DataTable ObjList = dtaccess.TrfItemReceiveItem(model);
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
    }
}