--siparislerde musteri bilgisi + urun bilgisi + satici bilgisi

select
	s.siparisID,
	m.ad+' '+m.soyad as Musteri,
	m.sehir,
	s.siparisTarihi as Siparis_Tarihi,
	u.ad as Urun,
	sd.adet,
	sd.birimFiyat,
	(sd.adet*sd.birimFiyat) as Toplam_Tutar,
	sa.ad as Satici
from Siparisler s
join Musteriler m on m.musteriID=s.musteriID
join SiparisDetaylari sd on sd.siparisID=s.siparisID
join Urunler u on sd.urunID=u.urunID
join Saticilar sa on sa.saticiID=u.saticiID
order by Toplam_Tutar desc


--Hic satilmamis urunler

select 
u.urunID,
u.ad as urun_adi,
u.fiyat,
u.stock
from Urunler u
left join SiparisDetaylari sd on sd.urunID=u.urunID
where sd.urunID  is  null


--Hic siparis vermemis musteriler

select
m.ad,
m.soyad
from Musteriler m
left join Siparisler sd on sd.musteriID=m.musteriID
where sd.musteriID is null