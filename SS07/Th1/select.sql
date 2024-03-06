use SS07_Th1_quanlisinhvien;
# Hiển thị danh sách tất cả các học viên.
select * from student;

# Hiển thị danh sách tất cả các môn học.
	select * from Subject;

# Tính điểm trung bình của từng học viên. 
	select S.StudentId, S.StudentName , avg(M.Mark) as DTB from Student S
	join Marks M on S.StudentId = M.StudentId 
	group by S.StudentId, S.StudentName;
    
# Hiển thị môn học nào duy nhatas sinh viên có điểm thi cao nhất.
    select Sb.SubjectId, Sb.SubjectName ,S.StudentName, max(M.Mark) as max from marks M
	inner join Student S on S.StudentId  = M.StudentId
	inner join Subject Sb on Sb.SubjectId = M.SubjectId
    group by    Sb.SubjectId, Sb.SubjectName ,S.StudentName;
    
    WITH RankedMarks AS (
    SELECT
        Sb.SubjectId,
        Sb.SubjectName,
        S.StudentId,
        S.StudentName,
        M.Mark,
        ROW_NUMBER() OVER (PARTITION BY Sb.SubjectId ORDER BY M.Mark DESC) AS row_num
    FROM marks M
    INNER JOIN Student S ON S.StudentId = M.StudentId
    INNER JOIN Subject Sb ON Sb.SubjectId = M.SubjectId
)

SELECT SubjectId, SubjectName, StudentId, StudentName, Mark
FROM RankedMarks
WHERE row_num = 1;

# Đánh số thứ tự của điểm theo chiều giảm dần.

WITH RankedMarks AS (
    SELECT
        Sb.SubjectId,
        Sb.SubjectName,
        S.StudentId,
        S.StudentName,
        M.Mark,
        DENSE_RANK() OVER (PARTITION BY Sb.SubjectId ORDER BY M.Mark DESC) AS rank_num
    FROM marks M
    INNER JOIN Student S ON S.StudentId = M.StudentId
    INNER JOIN Subject Sb ON Sb.SubjectId = M.SubjectId
)

SELECT SubjectId, SubjectName, StudentId, StudentName, Mark, rank_num
FROM RankedMarks;