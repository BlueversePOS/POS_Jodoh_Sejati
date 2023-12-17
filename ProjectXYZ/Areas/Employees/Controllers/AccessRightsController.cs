using ProjectXYZ.ActionFilter;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectXYZ.Models;
using ProjectXYZ.Areas.Employees.Models;
using System.IO;
using ProjectXYZ.Areas.Items.Models;
using ProjectXYZ.Helpers;

namespace ProjectXYZ.Areas.Employees.Controllers
{

    public class AccessRightsController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public AccessRightsRepo dtaccess = new AccessRightsRepo();
        FuncHelper func = new FuncHelper();

        // GET: Employees/AccessRights
        public ActionResult Index()
        {
            try
            {
                string email = Session["EmailAddress"].ToString();
                ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
                ViewBag.FORMATDATE = FORMATDATE;

                return View();
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home", new { ErrorMessage = ex.Message, Area = "" });
            }
        }

        [AuthorizeActionFilterAttribute]
        [Obsolete]
        public JsonResult GetAccessRight()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetAccessRight();
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Role_ID = ro["Role_ID"],
                                Role_Name = ro["Role_Name"],
                                Access = ro["Access"],
                                Access_Employee = ro["Access_Employee"]
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
        public JsonResult GetAccessRightDetail(string Role_ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetAccessRightDetail(Role_ID);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                NO = i++,
                                Role_ID = ro["Role_ID"],
                                Role_Name = ro["Role_Name"],
                                POS_Flag = ro["POS_Flag"],
                                POS_AccessPayments = ro["POS_AccessPayments"],
                                POS_ApplyDiscount = ro["POS_ApplyDiscount"],
                                POS_ChangeTaxes = ro["POS_ChangeTaxes"],
                                POS_ViewReceipt = ro["POS_ViewReceipt"],
                                POS_ReprintSendReceipt = ro["POS_ReprintSendReceipt"],
                                POS_ViewShift = ro["POS_ViewShift"],
                                POS_ManageItemsPOS = ro["POS_ManageItemsPOS"],
                                POS_ViewCostPOS = ro["POS_ViewCostPOS"],
                                POS_ChangeSetting = ro["POS_ChangeSetting"],
                                BckOffice_Flag = ro["BckOffice_Flag"],
                                BckOffice_ViewSales = ro["BckOffice_ViewSales"],
                                BckOffice_ManageItemsOff = ro["BckOffice_ManageItemsOff"],
                                BckOffice_ViewCostOff = ro["BckOffice_ViewCostOff"],
                                BckOffice_ManageEmployee = ro["BckOffice_ManageEmployee"],
                                BckOffice_ManageCustomers = ro["BckOffice_ManageCustomers"],
                                BckOffice_EditSetting = ro["BckOffice_EditSetting"],
                                BckOffice_ManagePayTypes = ro["BckOffice_ManagePayTypes"],
                                BckOffice_ManageTaxes = ro["BckOffice_ManageTaxes"],
                                BckOffice_POSDevices = ro["BckOffice_POSDevices"]
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
        public JsonResult SaveAccessRight(string param)
        {
            bool success = false;
            AccessRights model = new AccessRights();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<AccessRights>(decryptmodel);

                DataTable ObjList = dtaccess.SaveAccessRight(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Role_ID = ro["Role_ID"]
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
    }
}