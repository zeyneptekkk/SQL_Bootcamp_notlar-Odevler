create table books(
book_id int identity(1,1) primary key,
title varchar(50) not null,
author varchar(50) not null,
genre varchar(50) ,
price float,
stock_qt int,
published_year varchar(20),
added_at date,
)


insert into books(title,author,genre,price,stock_qt,published_year,added_at)
values('Kay�p Zaman�n �zninde','M. Proust','roman',129.90,25,1913,'2025-08-20'),
('Simyac�','P.Coelho','roman',89.50,40,1988,'2025-08-21'),
('Sapiens','Y.N Harari','tarih',159.00,18,2011,'2025-08-25'),
('Simyac�','P.Coelho','romqn',89.50,40,1988,'2025-08-21'),
('�nce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
('K�rl�k', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan �iftli�i', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atat�rk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('K���k Prens', 'A. de Saint-Exup�ry', '�ocuk', 69.90, 80, 1943, '2025-08-26'),
('Ba�lang��', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Al��kanl�klar', 'J. Clear', 'ki�isel geli�im', 129.00, 28, 2018, '2025-09-03'),
('Zaman�n K�sa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('�eker Portakal�', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir �dam Mahk�munun Son G�n�', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31')

select*from books

delete from books where book_id=1

---fiyatlar�n�n artan s�rada s�ralma---
select title,author,price
from books
order by price asc
---fiyatlar� azalan s�rada s�ralama---
select title,author,price
from books
order by price desc

---titlelerine g�re s�ralama--
select title 
from books
where genre='roman'
order by title asc


select title
from books
where genre='tarih'
order by title asc


---between kukan�m�---

select title,price
from books
where price between 80 and 120

---stok adedi 20 den az olan kitaplar--

select title , stock_qt
from books
where stock_qt<20

---title i�inde zaman gecenleri filtrele--

select title,author
from books
where lower(title) like '%zaman%' 


---IN kullan�m�---

select title,genre
from books
where genre IN('roman','bilim')


-------------
select title ,published_year
from books
where published_year>2000 
order by published_year desc

-----son 10 g�n i�iinde eklenen kitapla---

select  title ,added_at
from books
where added_at >=DATEADD(Day,-10,getdate())

-----top kulan�m�----

select top 5 title ,price
from books
order by price desc

----------
select title,stock_qt
from books
where stock_qt between 30 and 60
order by stock_qt asc



