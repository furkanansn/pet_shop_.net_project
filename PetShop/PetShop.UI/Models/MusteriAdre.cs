using System;
using System.Collections.Generic;

namespace PetShop.UI.Models
{
    public partial class MusteriAdre
    {
        public int Id { get; set; }
        public int MusteriID { get; set; }
        public string Adres { get; set; }
        public string Adi { get; set; }
        public virtual Musteri Musteri { get; set; }
    }
}
