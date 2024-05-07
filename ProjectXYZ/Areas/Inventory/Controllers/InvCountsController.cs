using Antlr.Runtime.Misc;
using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Inventory.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Inventory.Controllers
{
    public class InvCountsController : Controller
    {
        public InvCountsRepo dtaccess = new InvCountsRepo();
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        FuncHelper func = new FuncHelper();

        // GET: Inventory/InvCounts
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;
            ViewBag.Title = "Inventory Counts";

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        [Obsolete]
        public JsonResult ICGetCategory()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.ICGetCategory();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"]
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
        public JsonResult ICGetDataItems(ICFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.ICGetDataItems(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                LineItem_Option = ro["LineItem_Option"],
                                Item_Description = ro["Item_Description"],
                                Item_Cost = ro["Item_Cost"],
                                Item_SKU = ro["Item_SKU"],
                                InStock = ro["InStock"]
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
        public JsonResult ICGetDataList(ICFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.ICGetDataList(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                Completed_Date = ro["Completed_Date"],
                                Site_ID = ro["Site_ID"],
                                Site_Name = ro["Site_Name"],
                                Type_Inventory_Count = ro["Type_Inventory_Count"],
                                Total_Line_Item = ro["Total_Line_Item"],
                                Notes = ro["Notes"],
                                Status = ro["Status"],
                                Status_Txt = ro["Status_Txt"],
                                Created_User = ro["Created_User"],
                                Created_Date = ro["Created_Date"],
                                Created_time = ro["Created_time"],
                                Modified_User = ro["Modified_User"],
                                Modified_Date = ro["Modified_Date"],
                                Modified_time = ro["Modified_time"]
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
        public JsonResult ICGetDataDetail(ICFilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.ICGetDataDetail(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                DOCNUMBER = ro["DOCNUMBER"],
                                DOCDATE = ro["DOCDATE"],
                                LineItem_Option = ro["LineItem_Option"],
                                Lineitmseq = ro["Lineitmseq"],
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                Item_SKU = ro["Item_SKU"],
                                Expected_Stock = ro["Expected_Stock"],
                                Counted_Stock = ro["Counted_Stock"],
                                Different_Stock = ro["Different_Stock"],
                                Item_Cost = ro["Item_Cost"],
                                Item_Cost_Different = ro["Item_Cost_Different"],
                                Total_Different_Stock = ro["Total_Different_Stock"],
                                Total_Item_Cost_Different = ro["Total_Item_Cost_Different"]
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
        public JsonResult ICSaveCount(string param)
        {
            bool success = false;
            ICHeader model = new ICHeader();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<ICHeader>(decryptmodel);

                DataTable ObjList = dtaccess.ICSaveCount(model);
                List<DataRow> rows = ObjList.Select().ToList();

                string DOCNUMBER = string.IsNullOrEmpty(rows[0]["DOCNUMBER"].ToString()) ? "" : rows[0]["DOCNUMBER"].ToString().Trim();

                success = true;
                var jsonResult = Json(new { success = success, message = DOCNUMBER }, JsonRequestBehavior.AllowGet);
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