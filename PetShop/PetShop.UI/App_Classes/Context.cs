using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetShop.UI.Models;

namespace PetShop.UI.App_Classes
{
    public class Context
    {
        private static WebDemoContext connection;

        public static WebDemoContext Connection
        {
            get
            {
                if(connection == null)
                    connection = new WebDemoContext();
                return connection;
            }
            set { connection = value; }
        }

    
    }
}