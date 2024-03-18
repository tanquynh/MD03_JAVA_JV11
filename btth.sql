use BTTH_quanlydiemsv;

# 1 Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
# viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
# sinh viên tăng dần
select MaSV, concat(HoSV , TenSv) as 'Ho ten sinh vien', HocBong from dmsv;

# 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
# Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select MaSv, concat(HoSV , TenSv) as 'Ho ten sinh vien',Phai,NgaySinh from dmsv order by Phai asc;

# 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin
# sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select concat(HoSV , TenSv) as 'Ho ten sinh vien', NgaySinh,HocBong from dmsv order by Ngaysinh asc, HocBong desc;

# 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
# môn, Tên môn, Số tiết
select * from dmmh where TenMH like 'T%';

# 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái
select concat(HoSV , TenSv) as 'Ho ten sinh vien', NgaySinh,Phai from dmsv where TenSv like '%I';

#6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa
select MaKhoa, TenKhoa from dmkhoa where TenKhoa like '_N%';

# 7. Liệt kê những sinh viên mà họ có chứa chữ Thị
select * from dmsv where Hosv like '%thi%';

#8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
#thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
#được sắp xếp theo thứ tự Mã khoa giảm dần
select MaSV, concat(HoSV , TenSv) as 'Ho ten sinh vien',MaKhoa, HocBong from dmsv where HocBong > 100000 order by MaKhoa desc;

# 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
# các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select MaSV, concat(HoSV , TenSv) as 'Ho ten sinh vien',MaKhoa,Noisinh, HocBong from dmsv where (HocBong > 50000 and Noisinh='Ha Noi');
select * from dmkhoa;
# 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh viên, Ma khoa, Phái.
select MaSV, MaKhoa, Phai from dmsv where MaKhoa in ('AV','VL');

# 11. 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
select MaSV,NgaySinh,NoiSinh,HocBong from dmsv where NgaySinh between '1991-01-01' and '1992-06-05';

# 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select MaSV,NgaySinh,Phai,MaKhoa from dmsv where HocBong between 80000 and 150000;

# 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
select * from dmmh where sotiet between 30 and 45;

#14 Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select SV.MaSV, (concat(SV.HoSV ,' ', SV.TenSv)) as 'Ho ten sinh vien',K.TenKhoa,SV.Phai from dmsv SV join dmkhoa k on k.MaKhoa = SV.MaKhoa where SV.Phai = 'Nam' and SV.MaKhoa in ('av', 'th');

# 15 Liệt kê những sinh viên nữ, tên có chứa chữ N
select * from dmsv where TenSv like '%N%' and Phai = 'Nu';

#16 .Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 12, gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh
select HoSv,TenSv,NoiSinh,NgaySinh from dmsv where Noisinh='Ha Noi' and month(ngaySinh) = 12;

#17 Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng
select  concat(HoSV ,' ', TenSv) as 'Ho ten sinh vien',timestampdiff(year,Ngaysinh,curDate()) as 'Tuoi', HocBong from dmsv
where timestampdiff(year,Ngaysinh,curDate()) > 20;

#18 Danh sách những sinh viên có tuổi từ 20 đến 32, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select concat(HoSv, ' ' , TenSv) as 'Ho ten sinh vien' , timestampdiff(year,Ngaysinh,curdate()) as 'Tuoi' from dmsv 
where  timestampdiff(year,Ngaysinh,curDate()) between 20 and 32;

# 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh
select concat(HoSv, ' ' , TenSv) as 'Ho ten sinh vien' ,Phai, Ngaysinh from dmsv 
where year(Ngaysinh) = 1990 and month(Ngaysinh) between 01 and 04;

# 20 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
# bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình”
select Masv,Phai,MaKhoa, case when Hocbong > 80000 then 'Hoc bong cao' else 'Hoc bong thap' end as 'Muc hoc bong' from dmsv;

# 21 .Cho biết tổng số sinh viên của toàn trường
select count(*) as 'tong so sinh vien' from Dmsv;

# 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
select count(*) as 'Tong so sv' , count(case when Phai ='nu' then 1 end) as 'Tong so sv nu' from dmsv;

# 23.Cho biết tổng số sinh viên của từng khoa.
select MaKhoa, count(*) as 'Tong so sv' from dmsv group by Makhoa;

#24 Cho biết số lượng sinh viên học từng môn.
select MH.TenMh , count(distinct SV.MaSV) as 'tong so sv' from ketqua KQ
join dmsv SV on SV.MaSV = KQ.Masv
join dmmh MH on MH.MaMH = KQ.MaMH
group by MH.TenMH;

SELECT
    MaMH,
    COUNT(DISTINCT MaSV) AS 'SoLuongSinhVien'
FROM KetQua
GROUP BY MaMH;

# 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
select concat(SV.HoSv, ' ' , SV.TenSv) as 'Ho ten sinh vien' , count(KQ.MaMH) as 'So luong' from ketqua KQ
join dmsv SV on SV.MaSV = KQ.MaSV 
GROUP BY SV.MaSV, SV.HoSV, SV.TenSV; 

#26 .Cho biết tổng số học bổng của mỗi khoa.
select MK.TenKhoa, count(case when HocBong > 0 then 1 end) as 'SL hoc bong' from dmsv SV
join dmKhoa MK on MK.MaKhoa = SV.MaKhoa
group by Mk.TenKhoa;

#27 .Cho biết học bổng cao nhất của mỗi khoa.
select  MK.TenKhoa,
    SV.MaSV,
    SV.HoSV,
    SV.TenSV,
    SV.HocBong from dmsv SV
join dmKhoa MK on MK.MaKhoa = SV.MaKhoa
where (SV.MaKhoa, SV.HocBong) IN (Select MaKhoa, Max(HocBong) as MaxHocBong from dmsv group by MaKhoa);

#28 Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select MK.TenKhoa, MK.MaKhoa , sum(case when Phai = 'nam' then 1 else 0 end) as 'Sv nam' , 
       sum(case when Phai = 'Nu' then 1 else 0 end) as 'Sv nu' from dmsv SV
       join dmKhoa MK on MK.MaKhoa = sv.MaKhoa
       group by MK.TenKhoa, MK.MaKhoa ;
       
# 29.Cho biết số lượng sinh viên theo từng độ tuổi.
select timestampdiff(year,Ngaysinh,curdate()) as 'Tuoi', count(*) as 'So luong' from dmsv
group by timestampdiff(year,Ngaysinh,curdate())
order by 'soluong';

#30 Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select timestampdiff(year,Ngaysinh,curdate()) as 'Do tuoi' , count(*) as 'So luong' from dmsv
group by timestampdiff(year,Ngaysinh,curdate())
having count(*) >=1
order by count(*) ;

#31 Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select Noisinh, count(*) from dmsv
group by Noisinh
having count(*) >=2;

#32 Cho biết những môn nào có trên 3 sinh viên dự thi.

select MaMH , count(distinct MaSV) as 'So lan thi' from ketqua
group by MaMH
having count(distinct MaSV) >=3;

#33 Cho biết những sinh viên thi lại trên 2 lần
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',KQ.LanThi from dmsv SV
join ketqua KQ on KQ.MaSV = SV.MASV
where KQ.LanThi >=2;

#34 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',avg(KQ.diem) as DTB from dmsv SV
join ketqua KQ on KQ.MaSV = SV.MASV
where KQ.Lanthi = 1 
group by SV.MaSV
having  avg(KQ.diem) >=7;

# 35 Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',count(case when KQ.diem <5 then 1 end) as 'So lan rot' from dmsv SV
join ketqua KQ on KQ.MaSv=SV.MaSV
where KQ.LanThi =1
group by SV.MaSV
having count(case when KQ.diem <5 then 1 end) >= 2;

#36 Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select MK.MaKhoa , MK.tenKhoa , count(case when Phai = 'nam' then 1 end) as 'SL SV nam' from dmsv SV
join dmkhoa MK on MK.MaKhoa = sv.MaKhoa
group by Mk.MaKhoa
having count(case when Phai = 'Nam' then 1 end) >= 2;

#37 .Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000
select MK.MaKhoa , MK.tenKhoa , count(SV.MaSV) as 'So luong' from dmsv SV
join dmkhoa MK on MK.MaKhoa = sv.MaKhoa
where SV.HocBong between 50000 and 140000
group by MK.MaKHoa , MK.TenKhoa
having count(SV.MaSV) >=2;

#38 Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1.
select MaMH, count(case when Diem >= 5 then 1 end) as 'Sl Sv dau', count(case when Diem < 5 then 1 end) as'SL sv rot' from ketqua
where lanthi = 1
group by MaMH;

#39 Cho biết sinh viên nào có học bổng cao nhất.
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',max(HocBong) as 'Hoc Bong' from dmsv SV
group by SV.MaSv
order by Max(hocBong) desc limit 1;

#40 Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',max(KQ.diem) as 'Diem' from dmsv SV
join ketqua KQ on KQ.MaSV = SV.MaSV
where KQ.MaMH = '01'
group by SV.MaSv
order by Max(KQ.diem) desc limit 1;

#41 .Cho biết sinh viên khoa anh văn có tuổi lớn nhất
select SV.MaSV, concat(SV.HoSV ,' ', SV.TenSv) as 'Ho ten sinh vien',max(timestampdiff(year,NgaySinh,curdate())) as 'Nam sin Max' from dmsv SV
join dmKhoa MK on MK.MaKhoa = SV.MaKhoa
where Mk.MAKHoa = 'av'
group by SV.MaSv;

#42 .Cho biết khoa nào có đông sinh viên nhất.
with TopKhoa as (select MK.MAKhoa, MK.TenKhoa,count(SV.MaSV) as 'So luong' from dmsv SV
join dmKhoa MK on MK.MaKhoa = SV.MaKhoa
group by MK.MAKhoa, MK.TenKhoa
order by count(sv.Masv) desc
limit 1
)
select * from topkhoa
union
select MK.MAKhoa, MK.TenKhoa,count(SV.MaSV) as 'So luong' from dmsv SV
join dmKhoa MK on MK.MaKhoa = SV.MaKhoa
group by MK.MAKhoa, MK.TenKhoa
having count(SV.MaSV) = (select 'so luong' from topkhoa)
order by count(sv.Masv) desc;

#43 Cho biết khoa nào có đông nữ nhất
select MK.MAKhoa, MK.TenKhoa, count(case when SV.Phai = 'nu' then 1 end) as 'So luong' from dmsv SV
join dmkhoa  MK on MK.MaKhoa = SV.MaKhoa
group by MK.MAKhoa, MK.TenKhoa
order by count(case when SV.Phai = 'nu' then 1 end) desc
limit 1;

#44 Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select MH.MaMH, MH.TenMH, count(case when kq.diem <5  then 1 end) as 'So luong' from dmsv SV
join ketqua KQ on KQ.MaSV = SV.MaSV
join dmmh  MH on MH.MaMH = KQ.MaMH
group by MH.MaMH, MH.tenMH
order by count(case when SV.Phai = 'nu' then 1 end) desc
limit 1;

#45 .Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văncủa sinh viên học khoa anh văn.
SELECT
    SV1.MaSV AS 'MaSV_PhPhamCaoHonVan',
    CONCAT(SV1.HoSV, ' ', SV1.TenSV) AS 'HoTen_PhPhamCaoHonVan',
    KQ1.Diem AS 'DiemPham',
    KQ2.Diem AS 'DiemVan'
FROM DMSV SV1
JOIN KetQua KQ1 ON SV1.MaSV = KQ1.MaSV
JOIN DMKhoa MK1 ON SV1.MaKhoa = MK1.MaKhoa
JOIN KetQua KQ2 ON SV1.MaSV = KQ2.MaSV
JOIN DMSV SV2 ON SV2.MaKhoa = (SELECT MaKhoa FROM DMKhoa WHERE TenKhoa = 'Anh Văn') AND SV1.MaSV = KQ2.MaSV
WHERE MK1.TenKhoa != 'Anh Văn' AND KQ1.Diem > KQ2.Diem;

#46 Cho biết sinh viên có nơi sinh cùng với Hải.

