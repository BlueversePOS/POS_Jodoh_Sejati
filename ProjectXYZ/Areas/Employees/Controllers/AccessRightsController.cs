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