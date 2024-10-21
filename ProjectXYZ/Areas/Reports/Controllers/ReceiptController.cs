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
    public class ReceiptController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        ReceiptRepo repo = new ReceiptRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/Receipt
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpPost]

        public JsonResult ReportsReceiptGetDataList(Receipt model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsReceiptGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Store_ID = ro["Store_ID"],
                                Store_Name = ro["Store_Name"],
                                Employee_Name = ro["Employee_Name"],
                                Customer = ro["Customer"],
                                TrxType = ro["TrxType"],
                                Total = ro["Total"]
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