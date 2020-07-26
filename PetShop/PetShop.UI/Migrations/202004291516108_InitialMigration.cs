namespace PetShop.UI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Kargo",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SirketAdi = c.String(nullable: false, maxLength: 150),
                        Adres = c.String(maxLength: 500),
                        Telefon = c.String(maxLength: 15, fixedLength: true),
                        Website = c.String(maxLength: 50),
                        EMail = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Satis",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        MusteriID = c.Int(),
                        SatisTarihi = c.DateTime(nullable: false),
                        ToplamTutar = c.Decimal(nullable: false, precision: 18, scale: 2),
                        SepetteMi = c.Boolean(nullable: false),
                        KargoID = c.Int(),
                        SiparisDurumID = c.Int(),
                        KargoTakipNo = c.String(maxLength: 20),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Kargo", t => t.KargoID)
                .ForeignKey("dbo.Musteri", t => t.MusteriID)
                .ForeignKey("dbo.SiparisDurum", t => t.SiparisDurumID)
                .Index(t => t.MusteriID)
                .Index(t => t.KargoID)
                .Index(t => t.SiparisDurumID);
            
            CreateTable(
                "dbo.Musteri",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Soyadi = c.String(nullable: false, maxLength: 50),
                        KullaniciAdi = c.String(nullable: false, maxLength: 50),
                        EMail = c.String(nullable: false, maxLength: 50),
                        Telefon = c.String(nullable: false, maxLength: 15, fixedLength: true),
                        Sifre = c.String(nullable: false, maxLength: 10),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MusteriAdres",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        MusteriID = c.Int(nullable: false),
                        Adres = c.String(nullable: false, maxLength: 500),
                        Adi = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Musteri", t => t.MusteriID, cascadeDelete: true)
                .Index(t => t.MusteriID);
            
            CreateTable(
                "dbo.SatisDetay",
                c => new
                    {
                        SatisID = c.Int(nullable: false),
                        UrunID = c.Int(nullable: false),
                        Adet = c.Int(),
                        Fiyat = c.Decimal(precision: 18, scale: 2),
                        Indirim = c.Double(),
                    })
                .PrimaryKey(t => new { t.SatisID, t.UrunID })
                .ForeignKey("dbo.Satis", t => t.SatisID, cascadeDelete: true)
                .ForeignKey("dbo.Urun", t => t.UrunID, cascadeDelete: true)
                .Index(t => t.SatisID)
                .Index(t => t.UrunID);
            
            CreateTable(
                "dbo.Urun",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 50),
                        AlisFiyati = c.Decimal(nullable: false, precision: 18, scale: 2),
                        SatisFiyati = c.Decimal(nullable: false, precision: 18, scale: 2),
                        EklenmeTarihi = c.DateTime(nullable: false),
                        SonKullanmaTarihi = c.DateTime(),
                        KategoriID = c.Int(),
                        MarkaID = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Kategori", t => t.KategoriID)
                .ForeignKey("dbo.Marka", t => t.MarkaID)
                .Index(t => t.KategoriID)
                .Index(t => t.MarkaID);
            
            CreateTable(
                "dbo.Kategori",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 500),
                        ResimID = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Resim", t => t.ResimID)
                .Index(t => t.ResimID);
            
            CreateTable(
                "dbo.OzellikTip",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 500),
                        kategoriID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Kategori", t => t.kategoriID, cascadeDelete: true)
                .Index(t => t.kategoriID);
            
            CreateTable(
                "dbo.OzellikDeger",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 500),
                        OzellikTipID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.OzellikTip", t => t.OzellikTipID, cascadeDelete: true)
                .Index(t => t.OzellikTipID);
            
            CreateTable(
                "dbo.UrunOzellik",
                c => new
                    {
                        UrunID = c.Int(nullable: false),
                        OzellikTipID = c.Int(nullable: false),
                        OzellikDegerID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UrunID, t.OzellikTipID, t.OzellikDegerID })
                .ForeignKey("dbo.OzellikDeger", t => t.OzellikDegerID, cascadeDelete: true)
                .ForeignKey("dbo.OzellikTip", t => t.OzellikTipID, cascadeDelete: true)
                .ForeignKey("dbo.Urun", t => t.UrunID, cascadeDelete: true)
                .Index(t => t.UrunID)
                .Index(t => t.OzellikTipID)
                .Index(t => t.OzellikDegerID);
            
            CreateTable(
                "dbo.Resim",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        BuyukYol = c.String(maxLength: 250),
                        OrtaYol = c.String(maxLength: 250),
                        KucukYol = c.String(maxLength: 250),
                        Varsayilan = c.Boolean(),
                        SiraNo = c.Byte(),
                        UrunID = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Urun", t => t.UrunID)
                .Index(t => t.UrunID);
            
            CreateTable(
                "dbo.Marka",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 500),
                        ResimID = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Resim", t => t.ResimID)
                .Index(t => t.ResimID);
            
            CreateTable(
                "dbo.SiparisDurum",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adi = c.String(nullable: false, maxLength: 50),
                        Aciklama = c.String(maxLength: 500),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.sysdiagrams",
                c => new
                    {
                        diagram_id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 128),
                        principal_id = c.Int(nullable: false),
                        version = c.Int(),
                        definition = c.Binary(),
                    })
                .PrimaryKey(t => t.diagram_id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Satis", "SiparisDurumID", "dbo.SiparisDurum");
            DropForeignKey("dbo.SatisDetay", "UrunID", "dbo.Urun");
            DropForeignKey("dbo.Urun", "MarkaID", "dbo.Marka");
            DropForeignKey("dbo.Urun", "KategoriID", "dbo.Kategori");
            DropForeignKey("dbo.Kategori", "ResimID", "dbo.Resim");
            DropForeignKey("dbo.Resim", "UrunID", "dbo.Urun");
            DropForeignKey("dbo.Marka", "ResimID", "dbo.Resim");
            DropForeignKey("dbo.UrunOzellik", "UrunID", "dbo.Urun");
            DropForeignKey("dbo.UrunOzellik", "OzellikTipID", "dbo.OzellikTip");
            DropForeignKey("dbo.UrunOzellik", "OzellikDegerID", "dbo.OzellikDeger");
            DropForeignKey("dbo.OzellikDeger", "OzellikTipID", "dbo.OzellikTip");
            DropForeignKey("dbo.OzellikTip", "kategoriID", "dbo.Kategori");
            DropForeignKey("dbo.SatisDetay", "SatisID", "dbo.Satis");
            DropForeignKey("dbo.Satis", "MusteriID", "dbo.Musteri");
            DropForeignKey("dbo.MusteriAdres", "MusteriID", "dbo.Musteri");
            DropForeignKey("dbo.Satis", "KargoID", "dbo.Kargo");
            DropIndex("dbo.Marka", new[] { "ResimID" });
            DropIndex("dbo.Resim", new[] { "UrunID" });
            DropIndex("dbo.UrunOzellik", new[] { "OzellikDegerID" });
            DropIndex("dbo.UrunOzellik", new[] { "OzellikTipID" });
            DropIndex("dbo.UrunOzellik", new[] { "UrunID" });
            DropIndex("dbo.OzellikDeger", new[] { "OzellikTipID" });
            DropIndex("dbo.OzellikTip", new[] { "kategoriID" });
            DropIndex("dbo.Kategori", new[] { "ResimID" });
            DropIndex("dbo.Urun", new[] { "MarkaID" });
            DropIndex("dbo.Urun", new[] { "KategoriID" });
            DropIndex("dbo.SatisDetay", new[] { "UrunID" });
            DropIndex("dbo.SatisDetay", new[] { "SatisID" });
            DropIndex("dbo.MusteriAdres", new[] { "MusteriID" });
            DropIndex("dbo.Satis", new[] { "SiparisDurumID" });
            DropIndex("dbo.Satis", new[] { "KargoID" });
            DropIndex("dbo.Satis", new[] { "MusteriID" });
            DropTable("dbo.sysdiagrams");
            DropTable("dbo.SiparisDurum");
            DropTable("dbo.Marka");
            DropTable("dbo.Resim");
            DropTable("dbo.UrunOzellik");
            DropTable("dbo.OzellikDeger");
            DropTable("dbo.OzellikTip");
            DropTable("dbo.Kategori");
            DropTable("dbo.Urun");
            DropTable("dbo.SatisDetay");
            DropTable("dbo.MusteriAdres");
            DropTable("dbo.Musteri");
            DropTable("dbo.Satis");
            DropTable("dbo.Kargo");
        }
    }
}
