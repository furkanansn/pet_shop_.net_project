using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using PetShop.UI.Models.Mapping;

namespace PetShop.UI.Models
{
    public partial class WebDemoContext : DbContext
    {
        static WebDemoContext()
        {
            Database.SetInitializer<WebDemoContext>(null);
        }

        public WebDemoContext()
            : base("Name=WebDemoContext")
        {
        }

        public DbSet<Kargo> Kargoes { get; set; }
        public DbSet<Kategori> Kategoris { get; set; }
        public DbSet<Marka> Markas { get; set; }
        public DbSet<Musteri> Musteris { get; set; }
        public DbSet<MusteriAdre> MusteriAdres { get; set; }
        public DbSet<OzellikDeger> OzellikDegers { get; set; }
        public DbSet<OzellikTip> OzellikTips { get; set; }
        public DbSet<Resim> Resims { get; set; }
        public DbSet<Sati> Satis { get; set; }
        public DbSet<SatisDetay> SatisDetays { get; set; }
        public DbSet<SiparisDurum> SiparisDurums { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<Urun> Uruns { get; set; }
        public DbSet<UrunOzellik> UrunOzelliks { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new KargoMap());
            modelBuilder.Configurations.Add(new KategoriMap());
            modelBuilder.Configurations.Add(new MarkaMap());
            modelBuilder.Configurations.Add(new MusteriMap());
            modelBuilder.Configurations.Add(new MusteriAdreMap());
            modelBuilder.Configurations.Add(new OzellikDegerMap());
            modelBuilder.Configurations.Add(new OzellikTipMap());
            modelBuilder.Configurations.Add(new ResimMap());
            modelBuilder.Configurations.Add(new SatiMap());
            modelBuilder.Configurations.Add(new SatisDetayMap());
            modelBuilder.Configurations.Add(new SiparisDurumMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new UrunMap());
            modelBuilder.Configurations.Add(new UrunOzellikMap());
        }
    }
}
