using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using PetShop.UI.Models.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    public class AdminController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/Admin
        private UserManager<ApplicationUser> userManager;
        public AdminController()
        {
            userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new IdentityDataContext()));
        }
        // GET: ktxsqmbcdftuıoprdsabv/Admin
        public ActionResult Index(string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Index(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = userManager.Find(model.Username, model.password);
                if (user == null)
                {
                    ModelState.AddModelError("", "Yanlış kullanıcı adı veya parola");
                }
                else
                {
                    var authManager = HttpContext.GetOwinContext().Authentication;
                    var identity = userManager.CreateIdentity(user, "ApplicationCookie");
                    var authProperties = new AuthenticationProperties()
                    {

                    };
                    authManager.SignOut();
                    authManager.SignIn(authProperties, identity);
                    return RedirectToAction("Index", "Kategori");
                }
            }

            return View();
        }
        public ActionResult Logout()
        {
            var authManager = HttpContext.GetOwinContext().Authentication;
            authManager.SignOut();
            return RedirectToAction("Index", "Admin");
        }
    }
}