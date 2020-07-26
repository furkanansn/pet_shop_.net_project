using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace PetShop.UI.Models.Mapping
{
    public class MusteriMap : EntityTypeConfiguration<Musteri>
    {
        public MusteriMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Adi)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Soyadi)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.KullaniciAdi)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.EMail)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Telefon)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(15);

            this.Property(t => t.Sifre)
                .IsRequired()
                .HasMaxLength(10);

            // Table & Column Mappings
            this.ToTable("Musteri");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Adi).HasColumnName("Adi");
            this.Property(t => t.Soyadi).HasColumnName("Soyadi");
            this.Property(t => t.KullaniciAdi).HasColumnName("KullaniciAdi");
            this.Property(t => t.EMail).HasColumnName("EMail");
            this.Property(t => t.Telefon).HasColumnName("Telefon");
            this.Property(t => t.Sifre).HasColumnName("Sifre");
        }
    }
}
