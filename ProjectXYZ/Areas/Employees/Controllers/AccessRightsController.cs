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

namespace ProjectXYZ.Areas.Employees.Controllers
{

    public class AccessRightsController : Controller
    {
        LoggingRepository CA = new LoggingRepository();
        AccessRightsRepo dtaccess = new AccessRightsRepo();
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];

        // GET: Employees/AccessRights
        public ActionResult Index()
        {
            try
            {
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
    }
}