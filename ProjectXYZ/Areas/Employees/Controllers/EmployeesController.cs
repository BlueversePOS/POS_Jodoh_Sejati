using ProjectXYZ.ActionFilter;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;
using ProjectXYZ.Helpers;
using ProjectXYZ.Models;
using ProjectXYZ.Areas.Employees.Models;
using System.IO;

namespace ProjectXYZ.Areas.Employees.Controllers
{
    public class EmployeesController : Controller
    {
        EmployeesRepo dtaccess = new EmployeesRepo();
        public AccessRightsRepo dtaccessRole = new AccessRightsRepo();
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        FuncHelper func = new FuncHelper();

        // GET: Employees/Employees
        [AuthorizeActionFilterAttribute]
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
        public JsonResult GetAccessRight(string Prefix)
        {
            bool success = false;
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();
                DataTable ObjList = dtaccessRole.GetAccessRight();
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Role_Name='{0}'", Prefix)).ToList();
                }

                var list = (from DataRow ro in rows
                            select new
                            {
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
        [Obsolete]
        public JsonResult GetEmployee(string Employee_ID)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetEmployee(Employee_ID);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Employee_ID = ro["Employee_ID"],
                                Employee_Name = ro["Employee_Name"],
                                Email = ro["Email"],
                                Phone = ro["Phone"],
                                Role_ID = ro["Role_ID"],
                                Role_Name = ro["Role_Name"],
                                UserID = ro["UserID"],
                                UserPassword = func.Decrypt(ro["UserPassword"].ToString())
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
        public JsonResult SaveEmployee(string param)
        {
            bool success = false;
            Employeess model = new Employeess();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Employeess>(decryptmodel);

                DataTable ObjList = dtaccess.SaveEmployee(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Employee_ID = ro["Employee_ID"]
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