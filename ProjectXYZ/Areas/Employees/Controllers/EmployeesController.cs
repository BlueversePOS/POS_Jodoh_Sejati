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
        LoggingRepository CA = new LoggingRepository();
        EmployeesRepo dtaccess = new EmployeesRepo();
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];

        // GET: Employees/Employees
        [AuthorizeActionFilterAttribute]
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
    }
}