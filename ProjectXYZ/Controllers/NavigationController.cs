using ProjectXYZ.ActionFilter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Controllers
{
    public class NavigationController : Controller
    {
        // GET: Navigation
        public ActionResult Index()
        {
            return View();
        }

        [AuthorizeActionFilterAttribute]
        public ActionResult Maintenance(string Message)
        {
            if (!string.IsNullOrEmpty(Message))
            {
                ViewBag.MsgPage = Message;
            }
            return View();
        }
    }
}