using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetShop.UI.App_Classes
{
    public class Sepet
    {
        public static Sepet AktifSepet
        {
            get
            {
                HttpContext ctx = HttpContext.Current;
                if (ctx.Session["AktifSepet"] == null)
                    ctx.Session["AktifSepet"] = new Sepet();



                return (Sepet)ctx.Session["AktifSepet"];

            }
        }
        private List<SepetItem> urunler = new List<SepetItem>();

        public List<SepetItem> Urunler
        {
            get
            {
                return urunler;
            }
            set { urunler = value; }
        }

        public void SepeteEkle(SepetItem si)
        {
            if (Urunler.Any(x => x.Urun.Id == si.Urun.Id))
                Urunler.FirstOrDefault(x => x.Urun.Id == si.Urun.Id).Adet++;
            else
                Urunler.Add(si);
        }
        public decimal ToplamTutar
        {
            get
            {
                return Urunler.Sum(x => x.Tutar);
            }
        }
    }
    public class SepetItem
    {
        public Urun Urun { get; set; }

        public int Adet { get; set; }

        public double Indirim { get; set; }
        public decimal Tutar
        {
            get
            {
                return Urun.SatisFiyati * Adet * (decimal)(1 - Indirim);
            }
        }

    }

}

