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
    public class SalesByPaytypeController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        SalesByPaytypeRepo repo = new SalesByPaytypeRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/SalesByPaytype
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Sales by payment type";

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        [Obsolete]
        public JsonResult ReportsGetDataList(SalesCategory model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Payment_ID = ro["Payment_ID"],
                                Payment_Type = ro["Payment_Type"],
                                Payment_TRX = ro["Payment_TRX"],
                                Payment_Amount = ro["Payment_Amount"],
                                Payment_REF = ro["Payment_REF"],
                                Payment_Refund = ro["Payment_Refund"],
                                Net_Amount = ro["Net_Amount"]
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