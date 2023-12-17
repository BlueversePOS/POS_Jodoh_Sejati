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
using System.Reflection;

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
        [HttpPost]
        [Obsolete]
        public JsonResult GetCompositeItems(string Item_Number)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                DataTable ObjList = dtaccess.GetCompositeItems(Item_Number);
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

        [AuthorizeActionFilterAttribute]
        [HttpPost]
        [Obsolete]
        public JsonResult GetDataItems(FilterItem model)
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataItems(model);
                List<DataRow> rows = ObjList.Select().ToList();
                //Item_Number, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, 
                //Item_Shape, Item_Image
              var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Name = ro["Item_Name"],
                                Item_Description = ro["Item_Description"],
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"],
                                Item_Price = ro["Item_Price"],
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
        public JsonResult GetDetailItems(string param)
        {
            bool success = false;
            FilterItem model = new FilterItem();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<FilterItem>(decryptmodel);

                DataTable ObjList = dtaccess.GetDataItems(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Name = ro["Item_Name"],
                                Item_Description = ro["Item_Description"],
                                UOFM = ro["UOFM"],
                                Category_ID = ro["Category_ID"],
                                Category_Name = ro["Category_Name"],
                                Item_Sales = ro["Item_Sales"],
                                Item_SoldBy = ro["Item_SoldBy"],
                                Item_Price = ro["Item_Price"],
                                Item_Cost = ro["Item_Cost"],
                                Item_SKU = ro["Item_SKU"],
                                Item_Barcode = ro["Item_Barcode"],
                                Composite_Item = ro["Composite_Item"],
                                Track_Stock = ro["Track_Stock"],
                                InStock = ro["InStock"],
                                LowStock = ro["LowStock"],
                                Tax_10 = ro["Tax_10"],
                                Representation = ro["Representation"],
                                Item_Color = ro["Item_Color"],
                                Item_Shape = ro["Item_Shape"],
                                Item_Image = ro["Item_Image"]
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
        public JsonResult GetDataItemComposite(string Item_Number)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                DataTable ObjList = dtaccess.GetDataItemComposite(Item_Number);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                Item_Quantity = ro["Item_Quantity"],
                                Item_Cost = ro["Item_Cost"],
                                Item_Composite = ro["Item_Composite"]
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
        public JsonResult GetDataItemVariant(string Item_Number)
        {
            bool success = false;
            Category model = new Category();
            try
            {
                DataTable ObjList = dtaccess.GetDataItemVariant(Item_Number);
                List<DataRow> rows = ObjList.Select().ToList();
                var list = (from DataRow ro in rows
                            select new
                            {
                                Item_Number = ro["Item_Number"],
                                LineItem_Option = ro["LineItem_Option"],
                                CB_Available = ro["CB_Available"],
                                Option_ID = ro["Option_ID"],
                                Option_Name = ro["Option_Name"],
                                LineItem_Variant = ro["LineItem_Variant"],
                                Variant_Name = ro["Variant_Name"],
                                Item_Price = ro["Item_Price"],
                                Item_Cost = ro["Item_Cost"],
                                InStock = ro["InStock"],
                                LowStock = ro["LowStock"],
                                OptimalStock = ro["OptimalStock"],
                                Item_SKU = ro["Item_SKU"],
                                Item_Barcode = ro["Item_Barcode"]
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