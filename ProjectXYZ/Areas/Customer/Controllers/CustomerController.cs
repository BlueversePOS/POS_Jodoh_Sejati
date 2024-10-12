using Antlr.Runtime.Misc;
using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Customer.Models;
using ProjectXYZ.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Customer.Controllers
{
    public class CustomerController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public CustomerRepo dtaccess = new CustomerRepo();
        FuncHelper func = new FuncHelper();

        // GET: Customer/Customer
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            ViewBag.Countries = CultureInfo.GetCultures(CultureTypes.SpecificCultures)
                .Select(x => new SelectListItem() { Value = new RegionInfo(x.LCID).Name, Text = new RegionInfo(x.LCID).EnglishName })
                .ToList()
                .GroupBy(c => c.Text)
                .Select(c => c.First())
                .OrderBy(c => c.Text);

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        
        public JsonResult GetDatalistCustomer()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDatalistCustomer();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Customer_ID = ro["Customer_ID"],
                                Customer_Name = ro["Customer_Name"],
                                Email = ro["Email"],
                                Phone = ro["Phone"],
                                Address = ro["Address"],
                                Country = ro["Country"],
                                Province = ro["Province"],
                                City = ro["City"],
                                Postal_Code = ro["Postal_Code"],
                                Customer_Code = ro["Customer_Code"],
                                Note = ro["Note"]
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
        
        public JsonResult GetDataCustomer(string param)
        {
            bool success = false;
            Customers model = new Customers();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Customers>(decryptmodel);

                DataTable ObjList = dtaccess.GetDataCustomer(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                Customer_ID = ro["Customer_ID"],
                                Customer_Name = ro["Customer_Name"],
                                Email = ro["Email"],
                                Phone = ro["Phone"],
                                Address = ro["Address"],
                                Country = ro["Country"],
                                Province = ro["Province"],
                                City = ro["City"],
                                Postal_Code = ro["Postal_Code"],
                                Customer_Code = ro["Customer_Code"],
                                Note = ro["Note"]
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
        
        public JsonResult SaveCustomer(string param)
        {
            bool success = false;
            Customers model = new Customers();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Customers>(decryptmodel);

                DataTable ObjList = dtaccess.SaveCustomer(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                Customer_Name = ro["Customer_Name"]
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