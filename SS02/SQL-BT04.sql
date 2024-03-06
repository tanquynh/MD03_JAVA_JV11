create database baitap04;
use baitap04;

create table test(
id int primary key not null unique,
name varchar(50),
age varchar(30),
address varchar(30),
image varchar(255),
status bit(1)
);
-- them ban ghi
insert into test(id,name,age,address,image,status) values(1,'son',23,'ha noi','image.jpg',1);
DROP TABLE test;

--  chỉnh sửa bảng
-- thêm cột
alter TABLE test add COLUMN test_1 text;

-- thêm mới ràng buộc
alter table test add check(test_1>100);

-- xoá cột 
alter table test drop column test_1;

-- chỉnh sửa kiểu dữ liệu
alter table test modify test_1 varchar(50);

-- xoá theo id
delete from test where id=1;


