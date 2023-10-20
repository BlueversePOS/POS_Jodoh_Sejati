using Antlr.Runtime.Misc;
using Newtonsoft.Json;
using ProjectXYZ.ActionFilter;
using ProjectXYZ.Helpers;
using ProjectXYZ.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace ProjectXYZ.Controllers
{
    public class HomeController : Controller
    {
        [Obsolete]
        private string FORMATDATE = ConfigurationSettings.AppSettings["FORMATDATE"];

        FuncHelper func = new FuncHelper();

        private UserAccount UA = new UserAccount();
        public string captchalogin = string.Empty;

        public HomeRepository homeRep = new HomeRepository();

        public ActionResult Index()
        {
            if (Request.HttpMethod == "POST")
            {
                return View();
            }
            else
            {
                Session.Clear();
                Session.Abandon();
                CHECKUSERCOOKIE();

                return View("Index", UA);
            }
        }

        public ActionResult SignUp()
        {
            ViewBag.Countries = CultureInfo.GetCultures(CultureTypes.SpecificCultures)
                .Select(x => new SelectListItem() { Value = new RegionInfo(x.LCID).Name, Text = new RegionInfo(x.LCID).EnglishName })
                .ToList()
                .GroupBy(c => c.Text)
                .Select(c => c.First())
                .OrderBy(c => c.Text);
            return View();
        }

        public void CHECKUSERCOOKIE()
        {
            try
            {
                if (Request.Cookies["BPOS"] != null)
                {
                    UA.EmailAddress = Request.Cookies["BPOS"].Values["EmailAddress"];
                    string enPwd = Request.Cookies["BPOS"].Values["PASSWORD"];
                    string depwd = func.Decrypt(enPwd);
                    UA.PASSWORD = depwd;
                    UA.remember = true;
                }
                else
                {
                    UA.EmailAddress = "";
                    UA.PASSWORD = "";
                    UA.remember = false;
                }

            }
            catch (Exception ex)
            {
                string thismethod = System.Reflection.MethodBase.GetCurrentMethod().Name;
                string msg = string.Format("{0}--> Error: {1}", thismethod, ex.Message);
                Trace.WriteLine(msg);
                throw ex;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Obsolete]
        public ActionResult LoginAction(string param)
        {
            //string code = "", description = "";
            UserLogin model = new UserLogin();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<UserLogin>(decryptmodel);
                string password = string.IsNullOrEmpty(model.PASSWORD) ? "" : model.PASSWORD.Trim();
                password = func.Encrypt(password);
                Session["USER"] = null;
                Session["formatdate"] = FORMATDATE;

                DataTable dt = homeRep.getDataUser(model, password);
                if (dt.Rows.Count != 0)
                {
                    Session["USER"] = dt.Rows[0]["UserID"].ToString();
                    Session["EmailAddress"] = dt.Rows[0]["EmailAddress"].ToString();

                    Session["formatdate"] = FORMATDATE;
                }
                else
                {
                    throw new Exception("DATA USER TIDAK ADA");
                }

                var jsonResult = Json(new { success = true });
                return jsonResult;
            }
            catch (Exception ex)
            {
                string thismethod = System.Reflection.MethodBase.GetCurrentMethod().Name;
                string msg = string.Format("{0}-->{1} Error: {2}", thismethod, "", ex.Message);
                Trace.WriteLine(msg);

                var jsonResult = Json(new { success = false, message = ex.Message });
                return jsonResult;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Obsolete]
        public JsonResult SignUpUser(string param)
        {
            bool success = false;
            UserAccount model = new UserAccount();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<UserAccount>(decryptmodel);
                string password = string.IsNullOrEmpty(model.PASSWORD) ? "" : model.PASSWORD.Trim();
                password = func.Encrypt(password);
                DataTable ObjList = homeRep.SignUpUser(model, password);
                List<DataRow> rows = ObjList.Select().ToList();

                int i = 1;
                var list = (from DataRow ro in rows
                            select new
                            {
                                EmailAddress = model.EmailAddress
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

        public ActionResult Logout()
        {
            Session["USER"] = null;
            Session["EmailAddress"] = null;
            //Session["GUID"] = null;
            //Session["CURRENTCOMPANYNAME"] = null;
            //Session["CURRENTCOMPANY"] = null;
            //Session["INTERID"] = null;

            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();

            CHECKUSERCOOKIE();

            return View("Index", UA);
        }

        public Int32 ResetTimeout()
        {
            return 1;
        }

        public ActionResult TimeOut()
        {
            ViewBag.LoginErrorMassage = "Session Time Out";

            return View();
        }

        public ActionResult NoAccess(string Message)
        {
            if (!string.IsNullOrEmpty(Message))
            {
                ViewBag.Message = Message;
            }
            return View();
        }

        public ActionResult Encrypt(string model)
        {
            string controllerName = ControllerContext.RouteData.Values["controller"].ToString();
            try
            {
                string hasil = func.Encrypt(model);
                return Json(new { success = true, data = hasil });
            }
            catch (Exception ex)
            {
                var jsonResult = Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }
    }
}