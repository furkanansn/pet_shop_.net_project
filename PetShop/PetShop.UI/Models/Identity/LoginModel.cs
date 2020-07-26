using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetShop.UI.Models.Identity
{
    public class LoginModel
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string password { get; set; }
    }
}