using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Employees.Controllers
{
    public class EmployeesController : Controller
    {
        // GET: Employees/Employees
        public ActionResult Index()
        {
            return View();
        }
    }
}