using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Employees.Models;
using ProjectXYZ.Areas.Inventory.Models;
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
    public class InvHistoryController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public SettingsRepo settingsRepo = new SettingsRepo();
        EmployeesRepo employeesRepo = new EmployeesRepo();
        InvHistoryRepo invhistRepo = new InvHistoryRepo();
        FuncHelper func = new FuncHelper();

        // GET: Inventory/InvHistory
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Inventory History";

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        [Obsolete]
        public JsonResult GetDataStores()
        {
            bool success = false;
            try
            {
                DataTable ObjList = settingsRepo.GetDataStores("");
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
        [HttpGet]
        [Obsolete]
        public JsonResult GetDataSites()
        {
            bool success = false;
            try
            {
                DataTable ObjList = settingsRepo.GetDataSites("");
                List<DataRow> rows = ObjList.Select().ToList();

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
        [HttpGet]
        [Obsolete]
        public JsonResult GetEmployee()
        {
            bool success = false;
            try
            {
                DataTable ObjList = employeesRepo.GetEmployee("");
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Employee_ID = ro["Employee_ID"],
                                Employee_Name = ro["Employee_Name"],
                                Email = ro["Email"],
                                Phone = ro["Phone"],
                                Role_ID = ro["Role_ID"],
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
        public JsonResult InvHistGetDataList(InvHistory model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = invhistRepo.InvHistGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                Site_ID = ro["Site_ID"],
                                Site_Name = ro["Site_Name"],
                                Reason = ro["Reason"],
                                Created_User = ro["Created_User"],
                                QTY_Adjustment = ro["QTY_Adjustment"],
                                Qty_After_Stock = ro["Qty_After_Stock"],
                                Username = ro["Username"]
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