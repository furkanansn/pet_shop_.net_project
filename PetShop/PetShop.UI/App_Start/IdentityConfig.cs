using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
[assembly: OwinStartup(typeof(PetShop.UI.App_Start.IdentityConfig))]
namespace PetShop.UI.App_Start
{
    public class IdentityConfig
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new Microsoft.Owin.Security.Cookies.CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                //kullanıcı izni olmayan bir alana gelirse eğer aşağıdaki yere gider
                //LoginPath = new PathString("/ktxsqmbcdftuıoprdsabv/Admin/Index")
            });
        }
    }
}