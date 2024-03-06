CREATE TABLE Custome(
cID int auto_increment key,
cName varchar(50),
cAge int
);

CREATE table Ordere(
oID int auto_increment key,
cID int ,
foreign key (cID) references Custome(cID),
oDate date,
oTotalprice float
);

CREATE TABLE Product(
pID int  auto_increment key,
pName varchar(50),
pPrice float
);

CREATE TABLE OrderDetail(
oID int auto_increment key,
foreign key (oID) references Ordere(oID),
pID int, 
foreign key (pId) references Product(pId),
odQTY int
);
