using ProjectXYZ.Areas.Items.Models;
using ProjectXYZ.Helpers;
using ProjectXYZ.ActionFilter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using System.Data;

namespace ProjectXYZ.Areas.Items.Controllers
{
    public class ItemListController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public ItemListRepo dtaccess = new ItemListRepo();
        public CategoriesRepo dtaccessCat = new CategoriesRepo();
        FuncHelper func = new FuncHelper();

        // GET: Items/ItemList
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
        public JsonResult GetCategories(string Prefix)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                Prefix = string.IsNullOrEmpty(Prefix) ? string.Empty : Prefix.Trim();

                DataTable ObjList = dtaccessCat.GetDataCategories();
                List<DataRow> rows = ObjList.Select().ToList();
                if (rows.Count() > 0 && !string.IsNullOrEmpty(Prefix))
                {
                    rows = ObjList.Select(string.Format("Category_Name='{0}'", Prefix)).ToList();
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
        [HttpGet]
        [Obsolete]
        public JsonResult GetCompositeItems()
        {
            bool success = false;
            Category model = new Category();
            try
            {
                DataTable ObjList = dtaccess.GetCompositeItems();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Description = ro["Item_Description"],
                                Item_Cost = ro["Item_Cost"],
                                Item_SKU = ro["Item_SKU"]
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
        public JsonResult SaveItem(string param)
        {
            bool success = false;
            ItemList model = new ItemList();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<ItemList>(decryptmodel);

                DataTable ObjList = dtaccess.SaveItem(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Item_Number = string.IsNullOrEmpty(model.Item_Number) ? "" : model.Item_Number.Trim(),
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