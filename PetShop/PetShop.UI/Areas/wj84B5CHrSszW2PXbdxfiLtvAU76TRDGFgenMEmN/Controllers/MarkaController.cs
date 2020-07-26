using PetShop.UI.App_Classes;
using PetShop.UI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN.Controllers
{
    [Authorize]
    public class MarkaController : Controller
    {
        // GET: wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/Marka
        public ActionResult Index()
        {
            return View(Context.Connection.Markas.ToList());
        }


        public ActionResult MarkaEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult MarkaEkle(Marka mrk, HttpPostedFileBase fileUpload)
        {
            int resimId = 0;
            if (fileUpload != null)
            {
                Image img = Image.FromStream(fileUpload.InputStream);
                int width = Convert.ToInt32(ConfigurationManager.AppSettings["MarkaWidth"].ToString());
                int height = Convert.ToInt32(ConfigurationManager.AppSettings["MarkaHeight"].ToString());
                string name = "/Content/MarkaResim/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                Bitmap bm = new Bitmap(img, width, height);
                bm.Save(Server.MapPath(name));
                Resim rsm = new Resim();
                rsm.OrtaYol = name;
                Context.Connection.Resims.Add(rsm);
                Context.Connection.SaveChanges();
                if (rsm.Id != 0)
                    resimId = rsm.Id;
            }
            if (resimId != -1)
                mrk.ResimID = resimId;
            Context.Connection.Markas.Add(mrk);
            Context.Connection.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}