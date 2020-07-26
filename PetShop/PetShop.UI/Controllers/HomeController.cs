using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PetShop.UI.App_Classes;
using PetShop.UI.Models;

namespace PetShop.UI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public void SepeteEkle(int id)
        {
            SepetItem si = new SepetItem();
            Urun u = Context.Connection.Uruns.FirstOrDefault(x =>
            x.Id == id);

            si.Urun = u;
            si.Adet = 1;
            si.Indirim = 0;
            Sepet s = new Sepet();
            s.SepeteEkle(si);


            //18-21. dakikalarda bir sorunu çözdüler frontend de 9,6 video
        }
        public void SepetUrunAdetDusur(int id)
        {
            if (HttpContext.Session["AktifSepet"] != null)
            {
                Sepet s = (Sepet)HttpContext.Session["AktifSepet"];
                if (s.Urunler.FirstOrDefault
                    (x => x.Urun.Id == id).Adet > 1)
                {
                    s.Urunler.FirstOrDefault(x => x.Urun.Id == id).Adet--;
                }
                else
                {
                    SepetItem si = s.Urunler.FirstOrDefault(x => x.Urun.Id == id);
                    s.Urunler.Remove(si);
                }

            }
        }
        public PartialViewResult MiniSepetWidget()
        {
            if (HttpContext.Session["AktifSepet"] != null)
            {
                return PartialView((Sepet)HttpContext.Session["AktifSepet"]);
            }
            else
            {
                return PartialView();
            }
        }
        public ActionResult UrunDetay(string id)
        {
            Urun u = Context.Connection.Uruns.FirstOrDefault(x => x.Adi == id);

            ViewBag.OzellikTipler = Context.Connection.OzellikTips.Where(x => x.kategoriID == u.KategoriID);
            return View(u);
        }
        public PartialViewResult Sepet()
        {
            return PartialView();
        }
        public ActionResult Kategoriler()
        {
            return View();

        }
        public ActionResult Hakkimizda()
        {
            return View();
        }
        public PartialViewResult Slider()
        {
            var data = Context.Connection.Resims.Where(x => x.BuyukYol.Contains("Slider")).ToList();

            return PartialView(data);
        }
        public PartialViewResult YeniUrunler()
        {
            var data = Context.Connection.Uruns.ToList();
            var AnasayfaPasif = data.Where(s => s.Anasayfa == true && s.Pasif == true).ToList();
            return PartialView(AnasayfaPasif);

        }

        public PartialViewResult Servisler()
        {
            return PartialView();
        }

        public PartialViewResult Markalar()
        {
            var data = Context.Connection.Markas.ToList();
            return PartialView(data);

        }
        
       
    }
}