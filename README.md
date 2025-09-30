📌 **1. HAFTA KONULARI (SQL)**

● Microsoft SQL Server indirimi ve kurulumu  
● SQL Server ve SQL Server Management Studio (SSMS) yükleme  
● Veritabanı bağlantısı oluşturma  

● CREATE işlemleri  
● CREATE DATABASE -> Yeni veritabanı oluşturma  
● CREATE TABLE -> Yeni tablo oluşturma  

● Veri tipleri (Data Types)  
● INT -> Tam sayılar  
● BIGINT -> Büyük tam sayılar  
● SMALLINT -> Küçük tam sayılar  
● TINYINT -> 0-255 arası  
● DECIMAL(p,s) / NUMERIC(p,s) -> Hassas ondalıklı sayılar  
● FLOAT, REAL -> Yaklaşık ondalıklı sayılar  
● CHAR(n) -> Sabit uzunluklu karakter dizisi  
● VARCHAR(n) -> Değişken uzunluklu karakter dizisi  
● TEXT, VARCHAR(MAX) -> Uzun metinler  
● NCHAR(n), NVARCHAR(n), NTEXT -> Unicode metinler  
● DATE -> Tarih (YYYY-MM-DD)  
● DATETIME, DATETIME2 -> Tarih ve saat  
● SMALLDATETIME -> Daha düşük hassasiyetli tarih/saat  
● TIME -> Sadece saat bilgisi  
● BIT -> 0 veya 1 (boolean benzeri)  
● BINARY / VARBINARY -> İkili veriler  
● UNIQUEIDENTIFIER -> GUID saklamak için  

● Yeni tablo oluşturma  
● Alan isimleri, veri tipleri ve kısıtlamalar (constraints) tanımlama  
● PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, FOREIGN KEY kullanımı  

● Tabloya veri ekleme (INSERT INTO)  
● Tek satır veri ekleme  
● Birden fazla satır ekleme  
● COLUMN listesiyle ekleme  


📌 **2. HAFTA KONULARI (SQL)**

● SELECT işlemleri  
● Filtreleme işlemleri (WHERE kullanımı)  
● Karşılaştırma operatörleri (=, <>, >, <, >=, <=)  
● Mantıksal operatörler (AND, OR, NOT)  
● BETWEEN kullanımı  
● LIKE kullanımı  
● IN kullanımı  

● UPDATE işlemi  
● DELETE işlemi  

● AVG, SUM, MIN, MAX, COUNT fonksiyonları  
● AS (takma ad kullanımı)  
● Aggregate (Toplama) fonksiyonları  
● GROUP BY kullanımı  
● DESC ve ASC ile sıralama  
● HAVING koşulu  

● CASE - WHEN - THEN - ELSE kullanımı  


Online Alışveriş Platformu — Veri Tabanı Tasarımı-Bitirme Projesi
1. Giriş

Bu projenin amacı, bir online alışveriş platformunun temel işlevlerini destekleyecek ilişkisel veritabanı tasarımını gerçekleştirmektir. Proje kapsamında müşteri, sipariş, ürün, kategori ve satıcı bilgileri yönetilecek; sipariş süreçleri, stok takibi ve raporlama yapılabilecektir.

2. Tasarım

Tablolar: Müşteriler, Siparişler, SiparişDetayları, Ürünler, Kategoriler, Satıcılar.

Normalizasyon: 3. Normal Form seviyesinde tutulmuştur. Veri tekrarları azaltılmış, bağımlılıklar minimuma indirilmiştir.

Kritik İlişkiler:

Bir müşteri birden fazla sipariş verebilir.

Bir sipariş birden fazla ürün içerebilir.

Bir ürün bir kategoride yer alır ve bir satıcıya aittir.

ON DELETE / ON UPDATE:

ON DELETE CASCADE: Müşteri silindiğinde ilgili siparişleri de sil.

ON DELETE SET NULL: Satıcı silindiğinde ürünlerin satıcı alanı boş bırakılabilir.

ON UPDATE CASCADE: Kimlik (ID) güncellemelerinde ilişkili tablolar otomatik güncellenir.

3. Uygulama

Veritabanı motoru: PostgreSQL (alternatif olarak MySQL kullanılabilir).

Veri tipleri:

Kimlik alanları → INT (AUTO INCREMENT / SERIAL)

Metinsel alanlar → NVARCHAR

Tarih alanları → DATE / DATETIME

Fiyat ve tutar → DECIMAL(10,2)

Örnek veri ekleme:

INSERT INTO Musteriler (Ad, Soyad, Email) VALUES ('Ahmet', 'Yılmaz', 'ahmet@example.com');

INSERT INTO Siparisler (MusteriID, ToplamTutar, OdemeTuru) VALUES (1, 500.00, 'Kredi Kartı');

4. Raporlama Sorguları

Aylara göre sipariş sayısı → Satışların dönemsel dağılımı ölçülür.

Kategori bazlı toplam satışlar → Hangi kategorinin daha çok gelir getirdiği incelenir.

Hiç satılmamış ürünler → Depoda bekleyen ürünleri tespit etmek için.

Hiç sipariş vermemiş müşteriler → Platformda aktif olmayan kullanıcıları görmek için.

En çok satılan ürünler → Trend ürünleri bulmak için.

En yüksek ciroya sahip satıcılar → En çok kazandıran iş ortaklarını belirlemek için.

5. Karşılaşılan Problemler

Aynı e-posta adresiyle müşteri kaydı yapıldığında unique constraint hatası.

Stok güncellemelerinde yanlış adet girilmesi nedeniyle negatif stok tutarsızlıkları.

Çok sayıda sipariş ve ürün sorgusunda performans düşüklüğü → indeks ihtiyacı ortaya çıktı.

DELETE işlemlerinde foreign key hataları (ör. sipariş silinince sipariş detaylarının da silinmesi gerekmesi).
