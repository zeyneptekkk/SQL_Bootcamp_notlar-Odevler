select*from Urunler

update Urunler set ad='Kapiton' where urunID=222

update Urunler set stock=45 where kategoriID=1

update Urunler set kategoriID=3 where ad='Akýllý Telefon'

update Urunler set ad='Akýllý Telefon' where stock=70

update Urunler set ad='Smartwatch'  where ad='Gömlek'

update Urunler set ad='Mouse Pad' where fiyat<26

update Urunler set stock=55 where fiyat between 150.00 and 200.00

update Urunler set  ad='Dumbbell Seti' where fiyat between 50.00 and 70.00

update Urunler set  ad='Hoodie' where saticiID between 3 and 5 

update Urunler set  stock=49 where saticiID=29 or saticiID=33

update Urunler set ad='Akýllý Telefon' where ad like '%k'

update Urunler set ad='Laptop' where stock in(45,50)


update Urunler set fiyat=556 where saticiID in(47,45)

CREATE PROCEDURE Sp_SiparisEkle
    @urunID INT,
    @adet INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Stok kontrolü ve güncelleme
    UPDATE Urunler
    SET Stock = Stock - @adet
    WHERE UrunID = @urunID
      AND Stock >= @adet;

    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Stok yetersiz, sipariş eklenemedi.', 16, 1);
        RETURN;
    END

    -- Sipariş ekleme
    INSERT INTO OrderItems(UrunID, Quantity)
    VALUES (@urunID, @adet);
END
