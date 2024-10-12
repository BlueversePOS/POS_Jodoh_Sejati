using Antlr.Runtime.Misc;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Employees.Models;
using ProjectXYZ.Areas.Reports.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Controllers
{
    public class DashboardController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        EmployeesRepo dtaccess = new EmployeesRepo();

        [AuthorizeActionFilterAttribute]
        // GET: Dashboard
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        public JsonResult GetEmployee(string Prefix)
        {
            bool success = false;
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();
                DataTable ObjList = dtaccess.GetEmployee("");
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Employee_ID like '%{0}%' or Employee_Name like '%{0}%'", Prefix)).ToList();
                }

                var list = (from DataRow ro in rows
                            select new
                            {
                                Employee_ID = ro["Employee_ID"],
                                Employee_Name = ro["Employee_Name"]
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
