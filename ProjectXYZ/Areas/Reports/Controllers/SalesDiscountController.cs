using ProjectXYZ.ActionFilter;
using ProjectXYZ.Helpers;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System;
using System.Web.Mvc;
using ProjectXYZ.Areas.Reports.Models;

namespace ProjectXYZ.Areas.Reports.Controllers
{
    public class SalesDiscountController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        SalesDiscountRepo invhistRepo = new SalesDiscountRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/SalesDiscount
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Discounts";

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        [Obsolete]
        public JsonResult ReportsDiscountGetDataList(SalesDiscount model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = invhistRepo.ReportsDiscountGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Discount_ID = ro["Discount_ID"],
                                Discount_Name = ro["Discount_Name"],
                                Discount_Amount = ro["Discount_Amount"],
                                Disc_Applied = ro["Disc_Applied"]
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