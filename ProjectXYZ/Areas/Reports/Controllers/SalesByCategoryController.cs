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
    public class SalesByCategoryController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        SalesCategoryRepo repo = new SalesCategoryRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/SalesByCategory
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Sales by category";

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
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"],
                                Item_Sold = ro["Item_Sold"],
                                Net_Sales = ro["Net_Sales"],
                                CostOfGoods = ro["CostOfGoods"],
                                GrossProfit = ro["GrossProfit"]
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