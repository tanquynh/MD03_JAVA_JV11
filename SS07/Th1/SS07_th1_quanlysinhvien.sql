drop database SS07_th1_quanlisinhvien;
create database SS07_th1_quanlisinhvien;
use SS07_th1_quanlisinhvien;
create table Classes(
	ClassId int primary key ,
    ClassName nvarchar(50)
);

create table Student(
	StudentId int primary key not null auto_increment,
    StudentName nvarchar(50),
    Age int ,
    Email varchar(100) not null
);
create table ClassStudent(
	StudentId int ,
    ClassId int,
    foreign key(ClassId) references Classes(ClassId),
    foreign key(StudentId) references Student(StudentId)
);

create table Subject(
	SubjectId int primary key not null auto_increment,
    SubjectName nvarchar(50)
);

create table Marks(
	Mark int not null,
	SubjectId int,
    StudentId int,
     foreign key(SubjectId) references Subject(SubjectId),
    foreign key(StudentId) references Student(StudentId)
);