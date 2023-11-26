using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Account.Models
{
    public class Accounts
    {
        public string UserID { get; set; } = string.Empty;
        [Required(ErrorMessage = "The Email is required.")]
        public string EmailAddress { get; set; } = string.Empty;

        [Required(ErrorMessage = "The Password is required.")]
        [DataType(DataType.Password)]
        public string PASSWORD { get; set; } = string.Empty;
        [Required(ErrorMessage = "The Business Name is required.")]
        public string Business_Name { get; set; } = string.Empty;
        public string Currency { get; set; } = string.Empty;
        public string Timezone { get; set; } = string.Empty;
    }
}