using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Items.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Items.Controllers
{
    public class DiscountsController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public DiscountsRepo dtaccess = new DiscountsRepo();
        FuncHelper func = new FuncHelper();

        // GET: Items/Discounts
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        
        public JsonResult GetDataDiscount()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataDiscount();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Discount_ID = ro["Discount_ID"],
                                TYPE = ro["TYPE"],
                                Discount_Name = ro["Discount_Name"],
                                Discount_Type = ro["Discount_Type"],
                                Discount_Value = ro["Discount_Value"],
                                Restricted_Access = ro["Restricted_Access"]
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
        
        public JsonResult GetDetailDiscount(string param)
        {
            bool success = false;
            Discount model = new Discount();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Discount>(decryptmodel);
                string Discount_ID = model.Discount_ID;

                DataTable ObjList = dtaccess.GetDataDiscount();
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Discount_ID))
                {
                    rows = ObjList.Select(string.Format("Discount_ID='{0}'", Discount_ID)).ToList();
                }
                var list = (from DataRow ro in rows
                            select new
                            {
                                Discount_ID = ro["Discount_ID"],
                                TYPE = ro["TYPE"],
                                Discount_Name = ro["Discount_Name"],
                                Discount_Type = ro["Discount_Type"],
                                Discount_Value = ro["Discount_Value"],
                                Restricted_Access = ro["Restricted_Access"]
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
        [ValidateAntiForgeryToken]
        [HttpPost]
        
        public JsonResult SaveDiscount(string param)
        {
            bool success = false;
            Discount model = new Discount();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Discount>(decryptmodel);

                DataTable ObjList = dtaccess.SaveDiscount(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                DISCOUNT_NAME = string.IsNullOrEmpty(model.DISCOUNT_NAME) ? "" : model.DISCOUNT_NAME.Trim(),
                            }).ToList();

                success = true;
                var jsonResult = Json(new { success = success, message = "" }, JsonRequestBehavior.AllowGet);
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