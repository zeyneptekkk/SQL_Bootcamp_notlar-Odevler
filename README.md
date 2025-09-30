# Online Alışveriş Platformu — Veri Tabanı Tasarımı

## 1. Giriş
Bu projenin amacı, bir online alışveriş platformunun temel işlevlerini destekleyecek ilişkisel veritabanı tasarımını gerçekleştirmektir.  
Proje kapsamında müşteri, sipariş, ürün, kategori ve satıcı bilgileri yönetilecek; sipariş süreçleri, stok takibi ve raporlama yapılabilecektir.

---

## 2. Tasarım
- **Tablolar:** Müşteriler, Siparişler, SiparişDetayları, Ürünler, Kategoriler, Satıcılar.  
- **Kritik İlişkiler:**  
  - Bir müşteri birden fazla sipariş verebilir.  
  - Bir sipariş birden fazla ürün içerebilir.  
  - Bir ürün bir kategoride yer alır ve bir satıcıya aittir.  

---

## 3. Uygulama
- **Veritabanı motoru:** SQL Server   
- **Veri tipleri:**  
  - Kimlik alanları → `INT`  
  - Metinsel alanlar → `NVARCHAR`  
  - Tarih alanları → `DATE / DATETIME`  
  - Fiyat ve tutar → `DECIMAL(10,2)`  
- **Örnek veri ekleme:**  
```sql
INSERT INTO Musteriler (Ad, Soyad, Email) 
VALUES ('Ahmet', 'Yılmaz', 'ahmet@example.com');

INSERT INTO Siparisler (MusteriID, ToplamTutar, OdemeTuru) 
VALUES (1, 500.00, 'Kredi Kartı');
```

---

## 4. Raporlama Sorguları
- **Aylara göre sipariş sayısı** → Satışların dönemsel dağılımı.  
- **Kategori bazlı toplam satışlar** → Hangi kategorinin daha çok gelir getirdiği.  
- **Hiç satılmamış ürünler** → Depoda bekleyen ürünler.  
- **Hiç sipariş vermemiş müşteriler** → Platformda aktif olmayan kullanıcılar.  
- **En çok satılan ürünler** → Trend ürünler.  
- **En yüksek ciroya sahip satıcılar** → En çok kazandıran iş ortakları.  

---

## 5. Karşılaşılan Problemler
- Aynı e-posta adresiyle müşteri kaydı yapıldığında **unique constraint hatası**.  
- Stok güncellemelerinde yanlış adet girilmesi nedeniyle **negatif stok tutarsızlıkları**.  
- Çok sayıda sipariş ve ürün sorgusunda **performans düşüklüğü** → indeks ihtiyacı.  
- `DELETE` işlemlerinde **foreign key hataları** (ör. sipariş silinince sipariş detaylarının da silinmesi gerekmesi).  

---
