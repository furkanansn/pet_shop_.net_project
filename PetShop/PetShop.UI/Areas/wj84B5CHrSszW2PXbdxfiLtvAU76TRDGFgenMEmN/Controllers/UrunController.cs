using Microsoft.AspNet.SignalR.Infrastructure;
using PetShop.UI.App_Classes;
using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    [Authorize]
    public class UrunController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/Urun
        public ActionResult Index()
        {
            var AktifUrunler = Context.Connection.Uruns.Where(s => s.Pasif == false);
            return View(AktifUrunler.ToList());
        }
        public ActionResult PasifIndex()
        {
            var PasifUrunler = Context.Connection.Uruns.Where(s => s.Pasif == true);
            return View(PasifUrunler.ToList());
        }

        public ActionResult UrunEkle()
        {
            ViewBag.Kategoriler = Context.Connection.Kategoris.ToList();
            ViewBag.Markalar = Context.Connection.Markas.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult UrunEkle(Urun urn)
        {
            Context.Connection.Uruns.Add(urn);
            Context.Connection.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Guncelle(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var a = Context.Connection;
            Urun urun =a.Uruns.Find(id);
            if (urun == null)
            {
                return HttpNotFound();
            }
            ViewBag.KategoriID = new SelectList(Context.Connection.Kategoris, "Id", "Adi", urun.KategoriID);
            ViewBag.MarkaID = new SelectList(Context.Connection.Markas, "Id", "Adi", urun.MarkaID);
            return View(urun);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Guncelle( Urun urun)
        {
            if (ModelState.IsValid)
            {
                WebDemoContext demoContext = new WebDemoContext(); 
                demoContext.Entry(urun).State = EntityState.Modified;
                demoContext.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.KategoriID = new SelectList(Context.Connection.Kategoris, "Id", "Adi", urun.KategoriID);
            ViewBag.MarkaID = new SelectList(Context.Connection.Markas, "Id", "Adi", urun.MarkaID);
            return View(urun);
        }
        
































        public ActionResult UrunResimEkle(int id)
        {
            return View(id);
        }
        [HttpPost]
        public ActionResult UrunResimEkle(int uId, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image img = Image.FromStream(fileUpload.InputStream);

                Bitmap ortaResim = new Bitmap(img, Settings.UrunOrtaBoyut);
                Bitmap buyukResim = new Bitmap(img, Settings.UrunBuyukBoyut);

                string ortaYol = "/Content/UrunResim/Orta/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                string buyukYol = "/Content/UrunResim/Buyuk/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                ortaResim.Save(Server.MapPath(ortaYol));
                buyukResim.Save(Server.MapPath(buyukYol));

                Resim rsm = new Resim();
                rsm.BuyukYol = buyukYol;
                rsm.OrtaYol = ortaYol;
                rsm.UrunID = uId;
                if (Context.Connection.Resims.FirstOrDefault(x => x.UrunID == uId && x.Varsayilan == false) != null)
                    rsm.Varsayilan = true;
                else
                    rsm.Varsayilan = false;
                Context.Connection.Resims.Add(rsm);
                Context.Connection.SaveChanges();
                return View(uId);
            }
            return View(uId);
        }
    }
}