using Antlr.Runtime.Misc;
using CMS.Helpers;
using CMS.Models;
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
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CMS.Controllers
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

        public void CHECKUSERCOOKIE()
        {
            try
            {
                if (Request.Cookies["OMP"] != null)
                {
                    UA.username = Request.Cookies["OMP"].Values["username"];
                    string enPwd = Request.Cookies["OMP"].Values["password"];
                    string depwd = func.Decrypt(enPwd);
                    UA.password = depwd;
                    UA.remember = true;
                }
                else
                {
                    UA.username = "";
                    UA.password = "";
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
        public ActionResult LoginAction()
        {
            //string code = "", description = "";
            try
            {
                #region VALIDATE CAPTCHA

                //string clientCaptcha = model.clientcaptcha;
                //string serverCaptcha = captchalogin;
                //if (Session["TEGUHCAP"] != null)
                //{
                //    serverCaptcha = Session["TEGUHCAP"].ToString();
                //}

                //if (!clientCaptcha.Equals(serverCaptcha, StringComparison.InvariantCultureIgnoreCase))
                //{
                //    string msg = "Sorry, wrong text captcha.";
                //    var js = Json(new { captcha = true, message = msg }, JsonRequestBehavior.AllowGet);
                //    js.MaxJsonLength = int.MaxValue;
                //    return js;
                //}
                #endregion
                Session["USER"] = "TEST";
                Session["formatdate"] = FORMATDATE;
                //string guid = "6270d7e1-cf15-42fd-a893-a07e74493c59"; //artha1
                //string guid = "36ca0506-00a2-42f9-b4cb-c553ac7a35fe"; //teg01
                //string guid = "86b33943-c133-4ff5-94d5-9ec55f0c9d5c"; //gpuser (UAT)

                //DataTable dt = homeRep.getDataUserbyGuid(guid);
                //if (dt.Rows.Count != 0)
                //{
                //    Session["USER"] = dt.Rows[0]["USERID"].ToString();
                //    Session["USERNAME"] = dt.Rows[0]["USERNAME"].ToString();
                //    Session["GUID"] = dt.Rows[0]["GUID"].ToString();

                //    Session["formatdate"] = FORMATDATE;
                //}
                //else
                //{
                //    throw new Exception("DATA USER TIDAK ADA");
                //}

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

        public ActionResult Logout()
        {
            Session["USER"] = null;
            Session["USERNAME"] = null;
            Session["GUID"] = null;
            Session["CURRENTCOMPANYNAME"] = null;
            Session["CURRENTCOMPANY"] = null;
            Session["INTERID"] = null;

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

        #region CAPTCHA
        // This action for get Captcha Image
        [HttpGet]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")] // This is for output cache false
        public FileResult GetCaptchaImage()
        {
            Random random = new Random();

            captchalogin = GetRandomText();
            Session["TEGUHCAP"] = captchalogin;
            //Session["TEGUH"] = GetRandomText();
            //string text = Session["TEGUH"].ToString();
            //first, create a dummy bitmap just to get a graphics object

            int width = 320;
            int height = 70;
            Bitmap img = new Bitmap(width, height, PixelFormat.Format32bppArgb);
            Graphics g = Graphics.FromImage(img);
            g.SmoothingMode = SmoothingMode.AntiAlias;

            Rectangle rect = new Rectangle(0, 0, width, height);
            HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti,
                Color.LightGray, Color.White);
            g.FillRectangle(hatchBrush, rect);
            SizeF size;
            float fontSize = rect.Height + 1;
            Font font;

            do
            {
                fontSize--;
                font = new Font(FontFamily.GenericSansSerif, fontSize, FontStyle.Bold);
                size = g.MeasureString(captchalogin, font);
            } while (size.Width > rect.Width);

            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Center;
            format.LineAlignment = StringAlignment.Center;
            GraphicsPath path = new GraphicsPath();
            path.AddString(captchalogin, font.FontFamily, (int)font.Style, 75, rect, format);
            float v = 4F;
            PointF[] points =
            {
                new PointF(random.Next(rect.Width) / v, random.Next(
                   rect.Height) / v),
                new PointF(rect.Width - random.Next(rect.Width) / v,
                    random.Next(rect.Height) / v),
                new PointF(random.Next(rect.Width) / v,
                    rect.Height - random.Next(rect.Height) / v),
                new PointF(rect.Width - random.Next(rect.Width) / v,
                    rect.Height - random.Next(rect.Height) / v)
          };
            Matrix matrix = new Matrix();
            matrix.Translate(0F, 0F);
            path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);
            hatchBrush = new HatchBrush(HatchStyle.Percent10, Color.Black, Color.DodgerBlue);
            g.FillPath(hatchBrush, path);
            int m = Math.Max(rect.Width, rect.Height);
            for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
            {
                int x = random.Next(rect.Width);
                int y = random.Next(rect.Height);
                int w = random.Next(m / 50);
                int h = random.Next(m / 50);
                g.FillEllipse(hatchBrush, x, y, w, h);
            }

            g.DrawLine(Pens.Black, random.Next(0, 350), random.Next(10, 30), random.Next(0, 200), random.Next(0, 50));
            g.DrawLine(Pens.Blue, random.Next(0, 320), random.Next(10, 50), random.Next(100, 200), random.Next(0, 80));

            font.Dispose();
            hatchBrush.Dispose();
            g.Dispose();

            MemoryStream ms = new MemoryStream();
            img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            img.Dispose();

            return File(ms.ToArray(), "image/png");
        }

        private string GetRandomText()
        {
            StringBuilder randomText = new StringBuilder();
            string alphabets = "012345679ACEFGHKLMNPRSWXZabcdefghijkhlmnopqrstuvwxyz";
            Random r = new Random();
            for (int j = 0; j <= 3; j++)
            {
                randomText.Append(alphabets[r.Next(alphabets.Length)]);
            }
            return randomText.ToString();
        }
        #endregion

        #region FUNCTION
        private static string ToTitleCase(string title)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(title.ToLower());
        }
        #endregion

        public ActionResult SelectCompany()
        {
            try
            {
                string userid = Session["USER"].ToString();
                string guid = Session["GUID"].ToString();

                var Companies = homeRep.getCompanyList(userid);
                if (Companies != null)
                {
                    ViewBag.CompanyList = Companies;
                }

                return View();
            }
            catch (Exception ex)
            {
                return View("NoAccess", ex.Message.ToString());
            }
        }

        public ActionResult SelectedCompanies(GroupCompany company)
        {
            try
            {
                string userid = Session["USER"].ToString();
                string companyselected = company.Companyid.TrimEnd();

                List<GroupCompany> companylist = new List<GroupCompany>();
                companylist = homeRep.getCompanyListById(userid, companyselected);

                if (companylist.Count() > 0)
                {
                    Session["CURRENTCOMPANYNAME"] = companylist[0].Companyname.Trim();
                    Session["CURRENTCOMPANY"] = companylist[0].Companyid;
                    Session["INTERID"] = companylist[0].Companydb;
                    ViewBag.COMNAME = companylist[0].Companyname.Trim();

                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    return RedirectToAction("SelectCompany", "Home");
                }
            }
            catch (Exception ex)
            {
                return View("NoAccess", ex.Message.ToString());
            }
        }
    }
}