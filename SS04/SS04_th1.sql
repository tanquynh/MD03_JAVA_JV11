drop database SS04_Th1_Quanlysinhvien;
create database SS04_Th1_Quanlysinhvien;
use SS04_Th1_Quanlysinhvien;
create table Class(
	ClassId int auto_increment primary key,
    ClassName varchar(60) not null,
    StartDate datetime not null,
    Status Bit
);
insert into Class() values(1,'A1','2024-3-4',1);
insert into Class() values(2,'A2','2024-3-4',1);
insert into Class() values(3,'A3','2024-3-5',0);
create table Student(
	StudentId int auto_increment primary key,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    Status Bit,
    ClassId int not null,
    foreign key(ClassId) references Class(ClassId)
);
insert into Student() values(1,'Tuan','Ha Noi','0787656397',1,1);
insert into Student() values(2,'Manh','Ha Noi','0989111851',0,2);
insert into Student() values(3,'Linh','Hai Phong','0345463585',1,3);
insert into Student() values(4,'Hai','Da Nang','0543658676',0,1);

create table Subject(
	SubId int auto_increment primary key,
    SubName varchar(30) not null,
    Credit tinyint not null default 1 check(Credit >=1),
    Status Bit default 1
);
insert into Subject()values(1,'Toan',10,1);
insert into Subject()values(2,'Van',9,0);
insert into Subject()values(3,'Anh',11,1);
create table Mark(
	MarkId int auto_increment primary key,
    SubId int not null,
    StudentId int not null,
    Mark Float default 0 check (Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique(SubId, StudentId),
    foreign key(SubId) references Subject(SubId),
    foreign key(StudentId) references Student(StudentId)
);
insert into Mark() values(1,1,1,50,50);
insert into Mark() values(2,1,2,70,40);
insert into Mark() values(3,3,3,60,30);
insert into Mark() values(4,2,4,45,20);

#Hiển thị số lượng sinh viên ở từng nơi
select Address , count(StudentId) as 'So luong hoc sinh' from Student
group by address;

# Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG 
select S.StudentId, S.StudentName, avg(M.Mark) as DTB from Mark M 
join Student  S on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;
 # Bước 4: Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15
 select S.StudentId , S.StudentName, avg(M.Mark) as DTB from Mark M
 join Student S on S.StudentId = M.StudentId
 group by S.StudentId, S.StudentName
 having avg(M.Mark) > 50
 
 # Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất
 
