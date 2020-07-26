using System;
using System.Collections.Generic;

namespace PetShop.UI.Models
{
    public partial class Musteri
    {
        public Musteri()
        {
            this.MusteriAdres = new List<MusteriAdre>();
            this.Satis = new List<Sati>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public string KullaniciAdi { get; set; }
        public string EMail { get; set; }
        public string Telefon { get; set; }
        public string Sifre { get; set; }
        public virtual ICollection<MusteriAdre> MusteriAdres { get; set; }
        public virtual ICollection<Sati> Satis { get; set; }
    }
}
