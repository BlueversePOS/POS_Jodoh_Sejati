using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Customer.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer/Customer
        public ActionResult Index()
        {
            return View();
        }
    }
}