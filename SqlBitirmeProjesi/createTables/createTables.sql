---Database oluþturduk

create database TrendyolDB
go
use TrendyolDB
go 

---Tablolar

create table Kategoriler (
kategoriID int identity(1,1) primary key,
ad nvarchar(100) not null unique
)

create table Saticilar(
saticiID int identity(1,1) primary key,
ad nvarchar(150) not null,
adres nvarchar(250) null
)

create table Musteriler(
musteriID int identity(1,1) primary key,
ad nvarchar(50) not null,
soyad nvarchar(50) not null,
eposta nvarchar(100) null unique,
sehir nvarchar(50) null,
kayitTarihi datetime2 default sysdatetime()
)

create table Urunler(
urunID int identity(1,1) primary key,
ad nvarchar(200) not null,
fiyat decimal(10,2) not null check(fiyat>=0),
stock int not null default 0 check (stock >=0),
kategoriID int not null,
saticiID int not null,
foreign key (kategoriID) references Kategoriler(kategoriID),
foreign key(saticiID) references Saticilar(saticiID)
)

create table Siparisler(
siparisID int identity(1,1) primary key,
musteriID int not null,
siparisTarihi datetime2 default sysdatetime(),
toplamTutar decimal(10,2) not null default 0,
OdemeTuru nvarchar(50),
foreign key (musteriID) references Musteriler(musteriID)
)

create table SiparisDetaylari(
detayID int identity(1,1) primary key,
siparisID int not null,
urunID int not null,
adet int not null check (adet>0),
birimFiyat decimal(10,2),
foreign key (siparisID) references Siparisler(siparisID),
foreign key(urunID)  references Urunler(urunID)
)


