using Newtonsoft.Json;
using CMS.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Xml.Linq;

namespace CMS.Models
{
    public class IPHandler
    {
        internal string GetCurrentPageUrl()
        {
            return HttpContext.Current.Request.Url.AbsoluteUri;
        }

        internal string GetIPAddress()
        {
            string varIPAddress = string.Empty;
            string varVisitorCountry = string.Empty;
            string varIpAddress = string.Empty;

            try
            {
                varIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (string.IsNullOrEmpty(varIpAddress))
                {
                    if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                    {
                        varIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    }
                }

                //varIPAddress = (System.Web.UI.Page)Request.ServerVariables["HTTP_X_FORWARDED_FOR"];    
                if (varIPAddress == "" || varIPAddress == null)
                {
                    if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
                    {
                        varIpAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                    }
                }
            }
            catch
            {

            }

            return varIpAddress;
        }

        internal string getLocation(string varIpAddress)
        {
            string location = "";
            WebClient client = new WebClient();

            try
            {
                string response = client.DownloadString("https://ip-api.com/json/" + varIpAddress);

                IPLocation iplocation = new IPLocation();

                iplocation = JsonConvert.DeserializeObject<IPLocation>(response);

                if (iplocation.status == "success")
                {
                    location = iplocation.country + " " + iplocation.countryCode + " " + iplocation.city;
                }
            }
            catch
            {

            }

            return location;
        }

        internal string GetBrowser()
        {
            string sbrowser = "";
            try
            {
                sbrowser = HttpContext.Current.Request.Browser.Id.ToString() + "," + HttpContext.Current.Request.Browser.Type.ToString() + " ";
                sbrowser = sbrowser + " v" + HttpContext.Current.Request.Browser.MajorVersion.ToString() + "." + HttpContext.Current.Request.Browser.MinorVersion.ToString();
            }
            catch
            {

            }

            return sbrowser;
        }

        public PortalActivity getPortalActivity()
        {
            PortalActivity obj = new PortalActivity();

            obj.ipaddress = GetIPAddress();
            obj.browser = GetBrowser();
            obj.locationaddress = getLocation(obj.ipaddress);

            return obj;
        }

        public RootObject getAddress(string lat, string lon)
        {
            WebClient webClient = new WebClient();
            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
            webClient.Headers.Add("Referer", "https://www.microsoft.com");
            var jsonData = webClient.DownloadData("https://nominatim.openstreetmap.org/reverse?format=json&lat=" + lat + "&lon=" + lon);
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(RootObject));
            RootObject rootObject = (RootObject)ser.ReadObject(new MemoryStream(jsonData));
            return rootObject;
        }

        private static string baseUri ="https://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false";
        string location = string.Empty;

        public string RetrieveFormatedAddress(string lat, string lng)
        {
            string requestUri = string.Format(baseUri, lat, lng);

            using (WebClient wc = new WebClient())
            {
                string result = wc.DownloadString(requestUri);
                var xmlElm = XElement.Parse(result);
                var status = (from elm in xmlElm.Descendants() where 
                              elm.Name == "status"
                              select elm).FirstOrDefault();
                if (status.Value.ToLower() == "ok")
                {
                    var res = (from elm in xmlElm.Descendants() where elm.Name == "formatted_address"
                               select elm).FirstOrDefault();
                    requestUri = res.Value;
                }
            }
            return requestUri;
        }
    }
}