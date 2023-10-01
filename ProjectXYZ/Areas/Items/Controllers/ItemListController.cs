using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Items.Controllers
{
    public class ItemListController : Controller
    {
        // GET: Items/ItemList
        public ActionResult Index()
        {
            return View();
        }
    }
}