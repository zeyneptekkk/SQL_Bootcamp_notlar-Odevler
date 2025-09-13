INSERT INTO books(title,author,genre,price) 
values
('Anna Karenina 1','Dostoyevski','Roman',25.85),
('Anna Karenina 2','Dostoyevski','Roman',55.85),
('Anna Karenina 3','Dostoyevski','Roman',85.65),
('Cin Ali 2','Cin Ali Yazar�','Hikaye',155.45),
('Masal 1','Massal Yazar�','Masal',250);

select * from books;

-- Filtreleme i�lemleri 
-- select kolonlar from tablo_ad� where kolon_ad� filtre
-- Kar��la�t�rma operat�rleri.
-- < , > , <=, >= , = , != , <>

-- Yazar� Fyodor Dostoyevski olan kitaplar� listeleyiniz.
select * from books where author = 'Fyodor Dostoyevski'


-- Kitab�n fiyat  65 tl den b�y�k olan kitaplar� listeleyiniz.
select title,author from books where price > 65

-- t�r� roman olmayan kitaplar
select * from books where genre <> 'Roman';

select * from books where genre != 'Roman';

-- Mant�ksal operat�rler
-- And , Or , NOT 

-- fiyat aral��� 55 ile 150 aras�ndaki kitaplar� listeleyiniz.

select * from books where price >=55 and price<=150;

-- kitap t�r� Roman olan ve yazar� Dostoyevski olan kitaplar� listeleyiniz.
select * from books where genre = 'Roman' and author ='Dostoyevski';

-- yay�n y�l� 1972 den b�y�k olan veya T�r� Sosyoloji olan kitaplar� listeleyiniz.
select * from books where published_year > 1972 or genre = 'Sosyoloji'

--Di�er Operat�rler
-- BETWEEN, LIKE , IN 

-- fiyat aral��� 55 ile 150 aras�ndaki kitaplar� listeleyiniz.

select * from books where price BETWEEN 55 AND 150;

-- IN Komutu 
select * from books where genre IN ('Sosyoloji','Hikaye','Masal')

-- Yazar� Dos ile ba�layan b�t�n kitaplar� listeleyiniz.
select * from books where author LIKE 'Dos%';


-- Yazar alan� ar� ile biten b�t�n kitaplar� listleyniz.
select * from books where author LIKE '%ARI';

-- Yazarlar i�erisinde Dostoyevski Ge�en kitaplar� listeleyiniz.
select * from books where author LIKE '%DOSTOYEVSK�%'


-- dELETE FROM TABLOADI where kolon �art
DELETE FROM books where id = 1006;

-- Update tablo_Adi set kolon1 = deger2, kolon2= deger2
UPDATE books set price = 350 where id = 4;

-- ANNA karenina ile ba�layan kitaplar�n yazar�n� Tolstoy yap�n�z.
UPDATE books set author = 'Tolstoy' where title LIKE 'Anna Karenina%';
select * from books;


-- Price kolonunda %20 lik kdv oran� uygulay�n�z.
UPDATE books set price = price * 1.20


-- Books tablosunda kitaplar�n fiyatlar�n�n ortalams�n� g�steriniz.
-- AVG, SUM , MIN , MAX , COUNT 

-- AVG Ortalama al�r.

SELECT AVG(price) as Ortalama ,
SUM(price) as Toplam,
MIN(price) as [Minimum Fiyat],
MAX(price) as [Max],
COUNT(*) AS [Eleman Say�s�]

FROM books;

--         GENRE,       COUNT()
-- SELECT KOLON, AGGREGATE_FONKS�YON FROM Tablo_ad� GROUP BY kolon;

-- T�re g�re kitap say�s� 
SELECT genre , COUNT(*) as [Kitap Say�s�]

from books group by genre ORDER BY [Kitap Say�s�] ASC;

-- T�re g�re  ORT / M�N/MAX fiyatlar 

SELECT genre , AVG(price) as Ortalama,
MAX(price) as En_Buyuk , 
MIN(price)  as En_kucuk,
COUNT(*) AS ELEMAN
FROM books GROUP BY genre;

-- yIL VE T�R kolonlar�na g�re da��l�m.
SELECT 
published_year, genre, COUNT(*)
FROM books
GROUP BY published_year, genre


-- t�r�ne g�re kitap fiyatlar�n�n ortalamas�n� alan ortalamas� 60 dan b�y�kleri al
-- Gruplama i�lemlerinde filtrelenmesi gereken bir yer var ise where keywordu de�il Hav�ng kullan�lmal�
SELECT
genre, AVG(price) as Ortalama
FROM books
GROUP BY genre
HAVING  AVG(price)  > 60;

-- Fiyat aral���na g�re gruplama.

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