using PetShop.UI.App_Classes;
using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    [Authorize]
    public class KategoriController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/Kategori
        public ActionResult Index()
        {
            return View(Context.Connection.Kategoris.ToList());
        }

        public ActionResult KategoriEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult KategoriEkle(Kategori ktgr)
        {
            Context.Connection.Kategoris.Add(ktgr);
            Context.Connection.SaveChanges();
            return RedirectToAction("Index");
        }
       
    }
}