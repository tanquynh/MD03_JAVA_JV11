use SS03_Th1_quanlisinhvien;
# Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from Student  where StudentName Like 'h%' ;

# Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class where StartDate Like "_____12%";
select * from Class Where month(StartDate) = 12;

# Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject Where Credit between 3 and 5;

# Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student set classID = 2 where StudentName = 'Hung';
select * from Student;

# Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.StudentName, Sb.SubName, M.Mark from Student S 
join Mark M on S.StudentID = M.StudentID
join Subject Sb on M.SubID = Sb.SubID
order by M.Mark DESC, S.StudentName ASC
