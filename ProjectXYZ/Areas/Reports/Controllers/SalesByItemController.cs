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
    public class SalesByItemController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        SalesByItemRepo repo = new SalesByItemRepo();
        FuncHelper func = new FuncHelper();

        // GET: Reports/SalesByItem
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
        public JsonResult ReportsItemsGetDataTop5(SalesByItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsItemsGetDataTop5(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                DOCDATE = ro["DOCDATE"],
                                Net_Sales = ro["Net_Sales"],
                                Item_Color = ro["Item_Color"]
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
        public JsonResult ReportsItemsGetDataList(SalesByItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = repo.ReportsItemsGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_SKU = ro["Item_SKU"],
                                Category_Name = ro["Category_Name"],
                                Quantity = ro["Quantity"],
                                Gross_Sales = ro["Gross_Sales"],
                                Net_Sales = ro["Net_Sales"],
                                CostofGoods = ro["CostofGoods"],
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
    }
}