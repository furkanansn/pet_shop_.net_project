﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Configuration;

namespace PetShop.UI.App_Classes
{
    public static class Settings
    {
        public static Size UrunOrtaBoyut
        {
            get
            {
                Size sz = new Size();
                sz.Width = Convert.ToInt32(ConfigurationManager.AppSettings["UrunOrtaWidth"]);
                sz.Height = Convert.ToInt32(ConfigurationManager.AppSettings["UrunOrtaHeight"]);
                return sz;
            }
        }
        public static Size UrunBuyukBoyut
        {
            get
            {
                Size sz = new Size();
                sz.Width = Convert.ToInt32(ConfigurationManager.AppSettings["UrunBuyukWidth"]);
                sz.Height = Convert.ToInt32(ConfigurationManager.AppSettings["UrunBuyukHeight"]);
                return sz;
            }
        }
        public static Size SliderResimBoyutu
        {

            get
            {
                Size sz = new Size();

                sz.Width = Convert.ToInt32(ConfigurationManager.AppSettings["SliderWidth"]);
                sz.Height = Convert.ToInt32(ConfigurationManager.AppSettings["SliderHeight"]);
                return sz;
            }
        }
    }

}