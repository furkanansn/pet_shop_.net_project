using PetShop.UI.App_Classes;
using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    public class SliderResimController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/SliderResim
        public ActionResult SliderResimleri()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SliderResimEkle(HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image img = Image.FromStream(fileUpload.InputStream);
                Bitmap bmp = new Bitmap(img, Settings.SliderResimBoyutu);
                string yol = "/Content/SliderResim" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                bmp.Save(Server.MapPath(yol));

                Resim rsm = new Resim();
                rsm.BuyukYol = yol;
                Context.Connection.Resims.Add(rsm);
                Context.Connection.SaveChanges();
            }
            return View();
        }
    }
}