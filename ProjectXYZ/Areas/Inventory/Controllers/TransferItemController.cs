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
                                Item_Description = ro["Item_Description"],
                                SourceStock = ro["SourceStock"],
                                DestinationStock = ro["DestinationStock"],
                                Item_SKU = ro["Item_SKU"],
                                Site_ID = ro["Site_ID"]
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