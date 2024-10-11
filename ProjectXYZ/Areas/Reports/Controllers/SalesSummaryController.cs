using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Reports.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Reports.Controllers
{
    public class SalesSummaryController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        SalesSummaryRepo repo = new SalesSummaryRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/SalesSummary
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        [Obsolete]
        public JsonResult ReportsSummaryGetHeaderChart(SalesSummary model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsSummaryGetHeaderChart(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Quantity = ro["Quantity"],
                                Gross_Sales = ro["Gross_Sales"],
                                Refund_Amount = ro["Refund_Amount"],
                                Discount_Amount = ro["Discount_Amount"],
                                Net_Sales = ro["Net_Sales"],
                                Gross_Profit = ro["Gross_Profit"]
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
        [HttpPost]
        [Obsolete]
        public JsonResult ReportsSummaryGetDataChart(SalesSummary model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsSummaryGetDataChart(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCDATE = ro["DOCDATE"],
                                Amount = ro["Amount"]
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