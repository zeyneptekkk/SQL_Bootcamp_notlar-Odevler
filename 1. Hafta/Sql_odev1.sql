create table books(
book_id int identity(1,1) primary key,
title nvarchar(50) not null,
author nvarchar(50) not null,
genre nvarchar(50) ,
price decimal(10,2) check(price>0),
stock_qt int check(stock_qt>=0),
published_year int check(published_year between 1900 and 2025),
added_at date,
)

insert into books(title,author,genre,price,stock_qt,published_year,added_at)
values('Kayýp Zamanýn Ýzninde','M. Proust','roman',129.90,25,1913,'2025-08-20'),
('Simyacý','P.Coelho','roman',89.50,40,1988,'2025-08-21'),
('Sapiens','Y.N Harari','tarih',159.00,18,2011,getdate()),
('Simyacý','P.Coelho','romqn',89.50,40,1988,'2025-08-21'),
('Ýnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
('Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan Çiftliði', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
('Baþlangýç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Alýþkanlýklar', 'J. Clear', 'kiþisel geliþim', 129.00, 28, 2018, '2025-09-03'),
('Zamanýn Kýsa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('Þeker Portakalý', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir Ýdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31')

select*from books

delete from books where book_id=1

---Sorgu 1---
select title,author,price
from books
order by price asc

--Sorgu 2--
select title 
from books
where genre=N'roman'
order by title asc


---Sorgu 3---

select title,price
from books
where price between 80 and 120

---Sorgu 4--

select title , stock_qt
from books
where stock_qt<20

---Sorgu 5--

select title,author
from books
where lower(title) like '%zaman%' 


---Sorgu 6---

select title,genre
from books
where genre IN('roman','bilim')


---Sorgu 7---
select title ,published_year
from books
where published_year>2000 
order by published_year desc

----Sorgu 8---

select  title ,added_at
from books
where added_at >=DATEADD(Day,-10,getdate())

------Sorgu 9----

select top 5 title ,price
from books
order by price desc

----Sorgu 10----
select title,stock_qt
from books
where stock_qt between 30 and 60
order by stock_qt asc



