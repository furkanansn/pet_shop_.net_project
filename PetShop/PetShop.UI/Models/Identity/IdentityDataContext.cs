using Microsoft.AspNet.Identity.EntityFramework;
using PetShop.UI.Areas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetShop.UI.Models.Identity
{
    public class IdentityDataContext : IdentityDbContext<ApplicationUser>
    {
        public IdentityDataContext() : base("admin")
        {

        }
    }
}