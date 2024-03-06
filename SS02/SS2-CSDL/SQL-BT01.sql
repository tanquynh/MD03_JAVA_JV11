CREATE DATABASE BAITAP01;
USE BAITAP01;

CREATE TABLE PHIEUXUAT(
SoPX int auto_increment key ,
NgayXuat date
);

CREATE TABLE PHIEUNHAP(
SoPN int auto_increment key,
NgayNhap datetime
);

create table VATTU(
MAVT int auto_increment key,
TenVt varchar(50)
);

create table DONDH(
SoDh int auto_increment key,
NgayCh date
);

create table NHACCC(
MaNcc int auto_increment key,
TenNcc varchar(50),
Diachi text,
SDT varchar(20)
);

create table chitietpx(
id_px int,
foreign key (id_px) references PHIEUXUAT(SoPX),
id_vattu int,
foreign key (id_vattu) references VATTU(MAVT),
Dongiaxuat float,
SLxuat int
);

create table chitietpn(
id_vattu int,
foreign key (id_vattu) references VATTU(MAVT),
id_pn int,
foreign key (id_pn) references PHIEUNHAP(SoPN),
DonGiaNhap float,
SLNHAP int
);

create table chitietdh(
id_vattu int,
foreign key (id_vattu) references VATTU(MAVT),
id_donhang int,
foreign key(id_donhang) references DONDH(SoDh)
);

