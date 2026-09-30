-- Bước 1: Chọn cơ sở dữ liệu để thao tác
USE QuanLySinhVien;

-- Bước 2: Hiển thị danh sách tất cả các học viên
SELECT *
FROM Student;

-- Bước 3: Hiển thị danh sách các học viên đang theo học (Status = true/1)
SELECT *
FROM Student
WHERE Status = true;

-- Bước 4: Hiển thị danh sách các môn học có số tiết/thời gian học nhỏ hơn 10 giờ
SELECT *
FROM Subject
WHERE Credit < 10;

-- Bước 5: Hiển thị danh sách các học viên thuộc lớp 'A1'
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S 
JOIN Class C ON S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Bước 6: Hiển thị điểm thi môn 'CF' của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
JOIN Mark M ON S.StudentId = M.StudentId 
JOIN Subject Sub ON M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

-- Chuyển sang sử dụng cơ sở dữ liệu QuanLySinhVien
USE QuanLySinhVien;

-- 1. Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự 'h' (không phân biệt hoa/thường)
SELECT *
FROM Student
WHERE StudentName LIKE 'h%';

-- 2. Hiển thị thông tin các lớp học có thời gian bắt đầu (StartDate) vào tháng 12
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

-- 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3 đến 5
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

-- 4. Thay đổi mã lớp (ClassID) của sinh viên có tên 'Hung' thành 2
-- LƯU Ý: Tắt chế độ Safe Update của MySQL nếu gặp lỗi không cho phép UPDATE theo tên
SET SQL_SAFE_UPDATES = 0;

UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';

-- 5. Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Sắp xếp theo điểm thi (Mark) giảm dần, nếu trùng điểm thì sắp xếp theo StudentName tăng dần (A-Z).
SELECT S.StudentName, Sub.SubName, M.Mark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
JOIN Subject Sub ON M.SubId = Sub.SubId
ORDER BY M.Mark DESC, S.StudentName ASC;
