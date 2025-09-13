INSERT INTO books(title,author,genre,price) 
values
('Anna Karenina 1','Dostoyevski','Roman',25.85),
('Anna Karenina 2','Dostoyevski','Roman',55.85),
('Anna Karenina 3','Dostoyevski','Roman',85.65),
('Cin Ali 2','Cin Ali Yazarý','Hikaye',155.45),
('Masal 1','Massal Yazarý','Masal',250);

select * from books;

-- Filtreleme iþlemleri 
-- select kolonlar from tablo_adý where kolon_adý filtre
-- Karþýlaþtýrma operatörleri.
-- < , > , <=, >= , = , != , <>

-- Yazarý Fyodor Dostoyevski olan kitaplarý listeleyiniz.
select * from books where author = 'Fyodor Dostoyevski'


-- Kitabýn fiyat  65 tl den büyük olan kitaplarý listeleyiniz.
select title,author from books where price > 65

-- türü roman olmayan kitaplar
select * from books where genre <> 'Roman';

select * from books where genre != 'Roman';

-- Mantýksal operatörler
-- And , Or , NOT 

-- fiyat aralýðý 55 ile 150 arasýndaki kitaplarý listeleyiniz.

select * from books where price >=55 and price<=150;

-- kitap türü Roman olan ve yazarý Dostoyevski olan kitaplarý listeleyiniz.
select * from books where genre = 'Roman' and author ='Dostoyevski';

-- yayýn yýlý 1972 den büyük olan veya Türü Sosyoloji olan kitaplarý listeleyiniz.
select * from books where published_year > 1972 or genre = 'Sosyoloji'

--Diðer Operatörler
-- BETWEEN, LIKE , IN 

-- fiyat aralýðý 55 ile 150 arasýndaki kitaplarý listeleyiniz.

select * from books where price BETWEEN 55 AND 150;

-- IN Komutu 
select * from books where genre IN ('Sosyoloji','Hikaye','Masal')

-- Yazarý Dos ile baþlayan bütün kitaplarý listeleyiniz.
select * from books where author LIKE 'Dos%';


-- Yazar alaný arý ile biten bütün kitaplarý listleyniz.
select * from books where author LIKE '%ARI';

-- Yazarlar içerisinde Dostoyevski Geçen kitaplarý listeleyiniz.
select * from books where author LIKE '%DOSTOYEVSKÝ%'


-- dELETE FROM TABLOADI where kolon þart
DELETE FROM books where id = 1006;

-- Update tablo_Adi set kolon1 = deger2, kolon2= deger2
UPDATE books set price = 350 where id = 4;

-- ANNA karenina ile baþlayan kitaplarýn yazarýný Tolstoy yapýnýz.
UPDATE books set author = 'Tolstoy' where title LIKE 'Anna Karenina%';
select * from books;


-- Price kolonunda %20 lik kdv oraný uygulayýnýz.
UPDATE books set price = price * 1.20


-- Books tablosunda kitaplarýn fiyatlarýnýn ortalamsýný gösteriniz.
-- AVG, SUM , MIN , MAX , COUNT 

-- AVG Ortalama alýr.

SELECT AVG(price) as Ortalama ,
SUM(price) as Toplam,
MIN(price) as [Minimum Fiyat],
MAX(price) as [Max],
COUNT(*) AS [Eleman Sayýsý]

FROM books;

--         GENRE,       COUNT()
-- SELECT KOLON, AGGREGATE_FONKSÝYON FROM Tablo_adý GROUP BY kolon;

-- Türe göre kitap sayýsý 
SELECT genre , COUNT(*) as [Kitap Sayýsý]

from books group by genre ORDER BY [Kitap Sayýsý] ASC;

-- Türe göre  ORT / MÝN/MAX fiyatlar 

SELECT genre , AVG(price) as Ortalama,
MAX(price) as En_Buyuk , 
MIN(price)  as En_kucuk,
COUNT(*) AS ELEMAN
FROM books GROUP BY genre;

-- yIL VE TÜR kolonlarýna göre daðýlým.
SELECT 
published_year, genre, COUNT(*)
FROM books
GROUP BY published_year, genre


-- türüne göre kitap fiyatlarýnýn ortalamasýný alan ortalamasý 60 dan büyükleri al
-- Gruplama iþlemlerinde filtrelenmesi gereken bir yer var ise where keywordu deðil Havýng kullanýlmalý
SELECT
genre, AVG(price) as Ortalama
FROM books
GROUP BY genre
HAVING  AVG(price)  > 60;

-- Fiyat aralýðýna göre gruplama.

SELECT 
CASE
    WHEN price <50 THEN '0-49'
    WHEN price <100 THEN '50-100'
    WHEN price <200 THEN '100-199'
    ELSE '200+'
 END
 As fiyat_araligi,
 COUNT(*) AS adet
FROM books
GROUP BY 
CASE
    WHEN price <50 THEN '0-49'
    WHEN price <100 THEN '50-100'
    WHEN price <200 THEN '100-199'
    ELSE '200+'
 END



 SELECT 
CASE
    WHEN price <50 THEN '0-49'
    WHEN price <100 THEN '50-100'
    WHEN price <200 THEN '100-199'
    ELSE '200+'
 END
FROM books;


SELECT *FROM BOOKS;