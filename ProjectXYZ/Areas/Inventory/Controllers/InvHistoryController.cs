﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Inventory.Controllers
{
    public class InvHistoryController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];

        // GET: Inventory/InvHistory
        public ActionResult Index()
        {
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Inventory History";

            return View();
        }
    }
}