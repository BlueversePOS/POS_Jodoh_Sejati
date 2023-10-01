using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CMS.ActionFilter
{
    public class LogActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Log("OnActionExecuting", filterContext.RouteData);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            Log("OnActionExecuted", filterContext.RouteData);
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            Log("OnResultExecuting", filterContext.RouteData);
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            Log("OnResultExecuted", filterContext.RouteData);
        }


        private void Log(string methodName, RouteData routeData)
        {
            var controllerName = routeData.Values["controller"];
            var actionName = routeData.Values["action"];
            var message = String.Format("{0} controller:{1} action:{2}", methodName, controllerName, actionName);
            Debug.WriteLine(message, "Action Filter Log");
            Trace.WriteLine(message, "Action Filter Log");
        }

    }
    public class AuthorizeActionFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            Controller controller = filterContext.Controller as Controller;

            if (controller != null)
            {
                if (session != null)
                {
                    if (session["USER"] == null)
                    {
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary{
                                                                        { "controller", "Home" },
                                                                        { "action", "Logout" },
                                                                        {"area",""}
                                                                    });
                    }
                    else
                    {
                        //filterContext.Controller.ViewBag.FORMATDATE = session["formatdate"].ToString();
                        //filterContext.Controller.ViewBag.USERNAME = session["USERNAME"].ToString();
                        //filterContext.Controller.ViewBag.USER = session["USER"].ToString();
                        //filterContext.Controller.ViewBag.CURRENTCOMPANYNAME = session["CURRENTCOMPANYNAME"];
                        //filterContext.Controller.ViewBag.CURRENTCOMPANY = session["CURRENTCOMPANY"];
                        //filterContext.Controller.ViewBag.INTERID = session["INTERID"];
                        filterContext.Controller.ViewBag.USER = session["USER"].ToString();
                    }

                }
                else if (session == null)
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary{
                                                                        { "controller", "Home" },
                                                                        { "action", "Logout" },
                                                                        {"area",""}
                                                                    });
                }
                else
                {
                    //filterContext.Controller.ViewBag.FORMATDATE = session["formatdate"].ToString();
                    //filterContext.Controller.ViewBag.USERNAME = session["USERNAME"].ToString();
                    //filterContext.Controller.ViewBag.USER = session["USER"].ToString();
                    //filterContext.Controller.ViewBag.CURRENTCOMPANYNAME = session["CURRENTCOMPANYNAME"];
                    //filterContext.Controller.ViewBag.CURRENTCOMPANY = session["CURRENTCOMPANY"];
                    //filterContext.Controller.ViewBag.INTERID = session["INTERID"];
                    filterContext.Controller.ViewBag.USER = session["USER"].ToString();
                }
            }

            base.OnActionExecuting(filterContext);
        }
    }
}