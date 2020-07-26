using PetShop.UI.App_Classes;
using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    [Authorize]
    public class OzellikController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/Ozellik
        public ActionResult OzellikTipleri()
        {
            return View(Context.Connection.OzellikTips.ToList());
        }

        public ActionResult OzellikTipEkle()
        {
            return View(Context.Connection.Kategoris.ToList());
        }

        [HttpPost]
        public ActionResult OzellikTipEkle(OzellikTip tip)
        {
            Context.Connection.OzellikTips.Add(tip);
            Context.Connection.SaveChanges();
            return RedirectToAction("OzellikTipleri");
        }

        public ActionResult OzellikDeger()
        {
            return View(Context.Connection.OzellikDegers.ToList());
        }
        public ActionResult OzellikDegerEkle()
        {
            return View(Context.Connection.OzellikTips.ToList());
        }

        [HttpPost]
        public ActionResult OzellikDegerEkle(OzellikDeger dgr)
        {
            Context.Connection.OzellikDegers.Add(dgr);
            Context.Connection.SaveChanges();
            return RedirectToAction("OzellikDeger");
        }
        public ActionResult UrunOzellik()
        {

            return View(Context.Connection.UrunOzelliks.ToList());
        }
        public ActionResult UrunOzellikSil(int urunId, int tipId, int degerId)
        {
            UrunOzellik
                uo = Context.Connection.UrunOzelliks.FirstOrDefault(x => x.UrunID == urunId && x.OzellikTipID == tipId && x.OzellikDegerID == degerId);
            Context.Connection.UrunOzelliks.Remove(uo);
            Context.Connection.SaveChanges();
            return RedirectToAction("UrunOzellik", "Ozellik");
        }
        
        public ActionResult UrunOzellikEkle()
        {
            return View(Context.Connection.Uruns.ToList());
        }
        [HttpPost]
        public ActionResult UrunOzellikEkle(UrunOzellik uo)
        {
            Context.Connection.UrunOzelliks.Add(uo);
            Context.Connection.SaveChanges();
            return RedirectToAction("UrunOzellik", "Ozellik");
        }
        public PartialViewResult UrunOzellikTipWidget(int? katId)
        {
            if (katId != null)
            {
                var data = Context.Connection.OzellikTips.Where(x => x.kategoriID == katId).ToList();
                return PartialView(data);
            }
            else
            {
                var data = Context.Connection.OzellikTips.ToList();
                return PartialView(data);
            }
        }
        public PartialViewResult UrunOzellikDegerWidget(int? tipId)
        {
            if (tipId != null)
            {
                var data = Context.Connection.OzellikDegers.Where(x => x.OzellikTipID == tipId).ToList();
                return PartialView(data);
            }
            else
            {
                var data = Context.Connection.OzellikDegers.ToList();
                return PartialView(data);
            }
        }
        
    }
}