select*from Urunler

update Urunler set ad='Kapiton' where urunID=222

update Urunler set stock=45 where kategoriID=1

update Urunler set kategoriID=3 where ad='Ak�ll� Telefon'

update Urunler set ad='Ak�ll� Telefon' where stock=70

update Urunler set ad='Smartwatch'  where ad='G�mlek'

update Urunler set ad='Mouse Pad' where fiyat<26

update Urunler set stock=55 where fiyat between 150.00 and 200.00

update Urunler set  ad='Dumbbell Seti' where fiyat between 50.00 and 70.00

update Urunler set  ad='Hoodie' where saticiID between 3 and 5 

update Urunler set  stock=49 where saticiID=29 or saticiID=33

update Urunler set ad='Ak�ll� Telefon' where ad like '%k'

update Urunler set ad='Laptop' where stock in(45,50)

update Urunler set fiyat=556 where saticiID in(47,45)