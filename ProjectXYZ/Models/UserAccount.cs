using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Models
{
    public class UserLogin
    {
        [Required(ErrorMessage = "The Email is required.")]
        public string EmailAddress { get; set; } = string.Empty;

        [Required(ErrorMessage = "The Password is required.")]
        [DataType(DataType.Password)]
        public string PASSWORD { get; set; } = string.Empty;
        public bool remember { get; set; }
    }

    public class UserAccount
    {
        public string UserID { get; set; } = string.Empty;
        [Required(ErrorMessage = "The Email is required.")]
        public string EmailAddress { get; set; } = string.Empty;

        [Required(ErrorMessage = "The Password is required.")]
        [DataType(DataType.Password)]
        public string PASSWORD { get; set; } = string.Empty;
        public bool remember { get; set; }
        [Required(ErrorMessage = "The Business Name is required.")]
        public string Business_Name { get; set; } = string.Empty;
        public string Currency { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
    }

    public class PortalActivity
    {
        public string ipaddress { get; set; }
        public string locationaddress { get; set; }
        public string browser { get; set; }
        public string machinename { get; set; }
    }

    public class IPLocation
    {
        public string status { get; set; }
        public string country { get; set; }
        public string countryCode { get; set; }
        public string region { get; set; }
        public string regionName { get; set; }
        public string city { get; set; }
        public string zip { get; set; }
        public string lat { get; set; }
        public string lon { get; set; }
        public string timezone { get; set; }
        public string isp { get; set; }
        public string org { get; set; }
    }

    public class Address
    {
        public string road { get; set; }
        public string suburb { get; set; }
        public string city { get; set; }
        public string state_district { get; set; }
        public string state { get; set; }
        public string postcode { get; set; }
        public string country { get; set; }
        public string country_code { get; set; }
    }

    public class RootObject
    {
        public string place_id { get; set; }
        public string licence { get; set; }
        public string osm_type { get; set; }
        public string osm_id { get; set; }
        public string lat { get; set; }
        public string lon { get; set; }
        public string display_name { get; set; }
        public Address address { get; set; }
    }

    public class GroupCompany
    {
        public string Companyid { get; set; }
        public string Companyname { get; set; }
        public string Companydb { get; set; }
    }
}