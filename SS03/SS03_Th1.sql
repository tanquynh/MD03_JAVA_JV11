drop database SS03_Th1_quanlisinhvien;
create database SS03_Th1_quanlisinhvien;
use SS03_Th1_quanlisinhvien;
create table Class(
ClassID int primary Key,
ClassName Varchar(100),
StartDate DateTime,
Status int
);

create table Student(
StudentID int primary key,
StudentName varchar(100),
Address varchar(100),
phone varchar(11),
Status int,
ClassID int,
foreign key(ClassID) references Class(CLassID)
);

create table Subject(
SubID int primary key,
SubName varchar(100),
Credit int,
Status int
);

create table Mark(
MarkID int primary key,
SubID int,
StudentID int,
Mark int,
ExamTimes int,
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)
);

insert into Class () values(1,'A1','2008-12-20',1);
insert into Class () values(2,'A2','2008-12-22',1);
insert into Class () values(3,'A2',current_date(),0);

insert into Student(StudentID, StudentName,Address,Phone,Status,ClassID) values(1,'Hung','Ha Noi','0912113113',1,1);
insert into Student(StudentID, StudentName,Address,Status,ClassID) values(2,'Hoa','Hai Phong',1,1);
insert into Student(StudentID, StudentName,Address,Phone,Status,ClassID) values(3,'Manh','HCM','0123123123',0,2);

insert into Subject() values(1,'CF',5,1);
insert into Subject() values(2,'C',6,1);
insert into Subject() values(3,'HDJ',5,1);
insert into Subject() values(4,'RDBMS',10,1);

insert into Mark() values (1,1,1,8,1);
insert into Mark() values (2,1,2,10,2);
insert into Mark() values (3,2,1,12,1);

