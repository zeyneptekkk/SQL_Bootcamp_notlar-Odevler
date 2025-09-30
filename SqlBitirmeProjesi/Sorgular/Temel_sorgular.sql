--En çok siparis veren 5 musteri

select top 5
m.musteriID,m.ad,m.soyad,
COUNT(s.siparisID) as siparis_sayisi
from Musteriler m
left join Siparisler s on m.musteriID=s.musteriID
group by m.musteriID,m.ad,m.soyad
order by siparis_sayisi desc




--En çok satýlan urunler

select u.urunID,u.ad,
sum(s.adet) as toplam_adet
from Urunler u
left join SiparisDetaylari s on u.urunID=s.urunID
group by u.urunID,u.ad
order by toplam_adet desc



--En yuksek cirosu olan saticilar

select s.saticiID,s.ad,
s.saticiID,s.ad as satici_ad,
sum(sd.adet*sd.birimFiyat) as toplam_ciro
from Saticilar s
join Urunler u on s.saticiID=u.saticiID
join SiparisDetaylari sd on u.urunID=sd.urunID
group by s.saticiID,s.ad
order by toplam_ciro desc