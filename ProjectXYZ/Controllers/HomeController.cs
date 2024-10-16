﻿using Antlr.Runtime.Misc;
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

        public ActionResult ForgotPassword()
        {
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
        
        public ActionResult LoginAction(string param)
        {
            //string code = "", description = "";
            UserLogin model = new UserLogin();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<UserLogin>(decryptmodel);
                Session["USER"] = null;
                Session["formatdate"] = FORMATDATE;

                DataTable dt = homeRep.getDataUser(model);
                if (dt.Rows.Count != 0)
                {
                    Session["USER"] = dt.Rows[0]["UserID"].ToString();
                    Session["EmailAddress"] = dt.Rows[0]["EmailAddress"].ToString();
                    Session["formatdate"] = FORMATDATE;

                    if (model.remember == true)
                    {
                        HttpCookie pwrops = new HttpCookie("BPOS");
                        pwrops.Values.Add("EmailAddress", model.EmailAddress);
                        pwrops.Values.Add("PASSWORD", func.Encrypt(model.PASSWORD));
                        pwrops.Expires = DateTime.Now.AddMonths(1);
                        Response.Cookies.Add(pwrops);
                    }
                    else
                    {
                        if (Request.Cookies["BPOS"] != null)
                        {
                            //remove cookies
                            HttpCookie currentUserCookie = HttpContext.Request.Cookies["BPOS"];
                            HttpContext.Response.Cookies.Remove("BPOS");
                            HttpContext.Response.SetCookie(currentUserCookie);
                            currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                            currentUserCookie.Value = null;
                            HttpContext.Response.SetCookie(currentUserCookie);
                        }
                    }
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
        
        public JsonResult SignUpUser(string param)
        {
            bool success = false;
            UserAccount model = new UserAccount();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<UserAccount>(decryptmodel);
                DataTable ObjList = homeRep.SignUpUser(model);
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        
        public JsonResult ResetPassword(string param)
        {
            string success = "";
            UserAccount model = new UserAccount();
            try
            {
                string decryptmodel = func.Decrypt(param);
                model = JsonConvert.DeserializeObject<UserAccount>(decryptmodel);
                success = CheckEmailUser(model.EmailAddress);
                string newpassword = string.Empty;
                if (success == "success")
                {
                    newpassword = homeRep.SendEmail(model);
                    model.PASSWORD = newpassword;
                    homeRep.UpdatePasswordUser(model);
                }

                var jsonResult = Json(new { message = success }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
            catch (Exception ex)
            {
                var jsonResult = Json(new { message = ex.Message }, JsonRequestBehavior.AllowGet);
                jsonResult.MaxJsonLength = int.MaxValue;
                return jsonResult;
            }
        }

        public string CheckEmailUser(string email)
        {
            UserAccount model = new UserAccount();
            try
            {
                string success = "";
                model.EmailAddress = string.IsNullOrEmpty(email) ? "" : email.Trim();
                DataTable ObjList = homeRep.CheckEmailUser(model);
                List<DataRow> rows = ObjList.Select().ToList();
                success = ObjList.Rows[0][0].ToString();
                return success;
            }
            catch (Exception ex)
            {
                return ex.Message;
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