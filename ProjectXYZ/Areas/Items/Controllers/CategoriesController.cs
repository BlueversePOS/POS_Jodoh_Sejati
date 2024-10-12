using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Items.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Items.Controllers
{
    public class CategoriesController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public CategoriesRepo dtaccess = new CategoriesRepo();
        FuncHelper func = new FuncHelper();

        // GET: Items/Categories
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        
        public JsonResult GetDataCategories()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataCategories();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"],
                                Category_Color = ro["Category_Color"],
                                ITEM_COUNT = ro["ITEM_COUNT"]
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
        
        public JsonResult GetDetailCategories(string param)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Category>(decryptmodel);
                string Category_ID = model.Category_ID;

                DataTable ObjList = dtaccess.GetDataCategories();
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Category_ID))
                {
                    rows = ObjList.Select(string.Format("Category_ID='{0}'", Category_ID)).ToList();
                }
                var list = (from DataRow ro in rows
                            select new
                            {
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"],
                                Category_Color = ro["Category_Color"]
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
        
        public JsonResult SaveCategories(string param)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Category>(decryptmodel);

                DataTable ObjList = dtaccess.SaveCategories(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Category_Name = string.IsNullOrEmpty(model.Category_Name) ? "" : model.Category_Name.Trim(),
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