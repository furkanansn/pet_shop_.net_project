
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PetShop.UI.Models.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    public class AccountController : Controller
    {
      
  
       
            private UserManager<ApplicationUser> userManager;
            public AccountController()
            {
                userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new IdentityDataContext()));
            }

            public Func<UserManager<ApplicationUser>> UserManagerFactory { get; private set; }

            // GET: ktxsqmbcdftuıoprdsabv/Account
            public ActionResult Index()
            {
                return View();
            }

            public ActionResult Register()
            {
                return View();
            }
            [HttpPost]
            [ValidateAntiForgeryToken]
            public ActionResult Register(Register model)
            {
                if (ModelState.IsValid)
                {
                    var user = new ApplicationUser();
                    user.UserName = model.Username;
                    user.Email = model.email;

                    var result = userManager.Create(user, model.password);

                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                    else
                    {
                        foreach (var item in result.Errors)
                        {
                            ModelState.AddModelError("", item);
                        }
                    }

                }


                return View(model);
            }


        }
    }
