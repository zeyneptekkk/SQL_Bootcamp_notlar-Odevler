--Sehirlere gore musteri sayisi

select sehir ,
count(*) as musteri_sayisi
from Musteriler
group by sehir
order by musteri_sayisi desc


--Aylara gore siparis sayisi

select 
	year(siparisTarihi) as yil,
	month(siparisTarihi) as ay,
	count(*) as siparis_sayisi
from Siparisler
group by year(siparisTarihi),month(siparisTarihi)
order by yil,ay


---Kategori bazýlý toplam satýslar

select 
k.ad as Kategori,
  sum(sd.adet*sd.birimFiyat) as Toplam_satis
from SiparisDetaylari sd
join Urunler u on sd.urunID=u.urunID
join Kategoriler k on u.kategoriID=k.kategoriID
group by k.ad
order by Toplam_satis desc


