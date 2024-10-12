using Antlr.Runtime.Misc;
using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Areas.Account.Models;
using ProjectXYZ.Helpers;
using ProjectXYZ.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProjectXYZ.Areas.Account.Controllers
{
    public class AccountController : Controller
    {
        private string FORMATDATE = System.Configuration.ConfigurationManager.AppSettings["FORMATDATE"];
        public AccountRepo dtaccess = new AccountRepo();
        FuncHelper func = new FuncHelper();

        // GET: Account/Account
        public ActionResult Index()
        {
            string email = Session["EmailAddress"].ToString();
            ViewBag.EMAIL = string.IsNullOrEmpty(email) ? "" : email.Trim();
            ViewBag.FORMATDATE = FORMATDATE;

            return View();
        }

        [AuthorizeActionFilterAttribute]
        [HttpGet]
        
        public JsonResult GetDataAccount()
        {
            bool success = false;
            try
            {
                DataTable ObjList = dtaccess.GetDataAccount();
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                UserID = ro["UserID"],
                                Business_Name = ro["Business_Name"],
                                EmailAddress = ro["EmailAddress"],
                                Password = func.Decrypt(ro["Password"].ToString().Trim()),
                                CurrencyID = ro["CurrencyID"],
                                Currency = ro["Currency"],
                                Timezone = ro["Timezone"]
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
        
        public JsonResult SaveAccount(string param)
        {
            bool success = false;
            Accounts model = new Accounts();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<Accounts>(decryptmodel);

                DataTable ObjList = dtaccess.SaveAccount(model);
                List<DataRow> rows = ObjList.Select().ToList();

                var list = (from DataRow ro in rows
                            select new
                            {
                                CODE = ro["CODE"],
                                EmailAddress = ro["EmailAddress"]
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