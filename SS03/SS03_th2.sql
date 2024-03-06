
use SS03_Th1_quanlisinhvien;

select * from Student;
# Hiển thị danh sách các học viên đang theo học.
select * from Student where Status = 1;
# Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from Subject where Credit < 10;
# Hiển thị danh sách học viên lớp A1
	select S.StudentID, S.StudentName, C.ClassName from Student S 
	join Class C on S.ClassID = C.classID
	 where C.ClassName ="A1";

# Hiển thị điểm môn CF của các học viên
select S.StudentID, S.StudentName ,Sb.SubName, M.mark from Mark M 
join Subject Sb on Sb.SubID = M.SubID
join student S on S.StudentID = M.StudentID 
where Sb.SubName = 'CF';
