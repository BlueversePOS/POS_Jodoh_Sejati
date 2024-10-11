using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace ProjectXYZ
{
    public class MvcApplication : System.Web.HttpApplication
    {
        private TraceLogWriterListener traceLogWriter = null;
        protected void Application_Start()
        {
            string path = Server.MapPath("~");
            string logFolder = Path.Combine(path, string.Format("Logs{0}XYZ", Path.DirectorySeparatorChar));

            if (!Directory.Exists(logFolder))
                Directory.CreateDirectory(logFolder);

            this.traceLogWriter = new TraceLogWriterListener(logFolder);
            Trace.Listeners.Add(this.traceLogWriter);
            Trace.WriteLine(logFolder);

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
