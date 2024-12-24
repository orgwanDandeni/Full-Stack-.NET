/*ملاحظات:

الرقم التسلسلي هو id.
الجنس (F أو M).
المستوى الدراسي يتكون من ستة مستويات (1, 2, 3، 4, 5, 6).
المسار (علمي أو انساني).
المعدل التراكمي من 100.*/

--إنشاء قاعدة البيانات
CREATE DATABASE ESE;

--إنشاء الجداول
--طالب (الرقم التسلسلي للطالب، اسم الطالب، تاريخ الميلاد، جنس الطالب، تاريخ الالتحاق، البريد الإلكتروني للطالب، المستوى الدراسي، المسار، المعدل التراكمي للطالب)
CREATE TABLE students(
    student_id INT PRIMARY KEY NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    student_birth DATE NOT NULL,
    student_gander ENUM('F', 'M') NOT NULL,
    student_registration DATE NOT NULL,
    student_email VARCHAR(255) NOT NULL,
    student_level ENUM(1, 2, 3, 4, 5, 6) NOT NULL,
    student_career ENUM('علمي', 'أدبي'),
    student_grade INT CHECK (student_grade <= 100) NOT NULL
);

--المعلمين (الرقم التسلسلي للمعلم، اسم المعلم، تاريخ الميلاد، جنس المعلم، البريد الالكتروني للمعلم، رقم المكتب)
CREATE TABLE teachers(
    teacher_id INT PRIMARY KEY NOT NULL,
    teacher_name VARCHAR(255) NOT NULL,
    teacher_birth DATE NOT NULL,
    teacher_gander ENUM('F', 'M') NOT NULL,
    teacher_email VARCHAR(255) NOT NULL,
    teacher_office INT NOT NULL
);

--المواد (الرقم التسلسلي للمادة، اسم المادة)
CREATE TABLE subjects(
    subject_id INT PRIMARY KEY NOT NULL,
    subject_name VARCHAR(255) NOT NULL
);

--عرض الجداول المتاحة في قاعدة البيانات
USE ESE;
SHOW TABLES;

--إدخال معلومات ٣٠ طالب كحد أدنى
INSERT INTO students (student_id, student_name, student_birth, student_gander, student_registration, student_email, student_level, student_career, student_grade) 
VALUES
(1, 'Alice Johnson', '2005-04-15', 'F', '2023-09-01', 'alice.johnson@example.com', 1, 'Science', 85),
(2, 'John Smith', '2004-12-21', 'M', '2023-09-01', 'john.smith@example.com', 2, 'Literature', 90),
(3, 'Emily Davis', '2006-01-30', 'F', '2023-09-01', 'emily.davis@example.com', 3, 'Science', 78),
(4, 'Michael Brown', '2005-06-14', 'M', '2022-09-01', 'michael.brown@example.com', 4, 'Science', 88),
(5, 'Sophia Wilson', '2004-07-25', 'F', '2021-09-01', 'sophia.wilson@example.com', 5, 'Literature', 92),
(6, 'James Miller', '2003-03-11', 'M', '2020-09-01', 'james.miller@example.com', 6, 'Science', 95),
(7, 'Olivia Moore', '2005-11-08', 'F', '2023-09-01', 'olivia.moore@example.com', 1, 'Science', 80),
(8, 'William Taylor', '2004-05-22', 'M', '2023-09-01', 'william.taylor@example.com', 2, 'Literature', 77),
(9, 'Charlotte Anderson', '2006-02-03', 'F', '2023-09-01', 'charlotte.anderson@example.com', 3, 'Science', 85),
(10, 'Benjamin Thomas', '2005-09-17', 'M', '2022-09-01', 'benjamin.thomas@example.com', 4, 'Literature', 91),
(11, 'Amelia Jackson', '2004-10-01', 'F', '2021-09-01', 'amelia.jackson@example.com', 5, 'Science', 89),
(12, 'Lucas White', '2003-08-19', 'M', '2020-09-01', 'lucas.white@example.com', 6, 'Literature', 94),
(13, 'Isabella Harris', '2005-12-12', 'F', '2023-09-01', 'isabella.harris@example.com', 1, 'Literature', 86),
(14, 'Alexander Martin', '2004-07-04', 'M', '2023-09-01', 'alexander.martin@example.com', 2, 'Science', 81),
(15, 'Mia Thompson', '2006-03-15', 'F', '2023-09-01', 'mia.thompson@example.com', 3, 'Science', 87),
(16, 'Henry Garcia', '2005-05-28', 'M', '2022-09-01', 'henry.garcia@example.com', 4, 'Literature', 90),
(17, 'Harper Martinez', '2004-06-06', 'F', '2021-09-01', 'harper.martinez@example.com', 5, 'Science', 88),
(18, 'Ethan Robinson', '2003-11-24', 'M', '2020-09-01', 'ethan.robinson@example.com', 6, 'Literature', 96),
(19, 'Lily Clark', '2005-01-19', 'F', '2023-09-01', 'lily.clark@example.com', 1, 'Science', 79),
(20, 'Daniel Rodriguez', '2004-09-10', 'M', '2023-09-01', 'daniel.rodriguez@example.com', 2, 'Literature', 84),
(21, 'Eleanor Lewis', '2006-07-25', 'F', '2023-09-01', 'eleanor.lewis@example.com', 3, 'Science', 82),
(22, 'Matthew Lee', '2005-03-14', 'M', '2022-09-01', 'matthew.lee@example.com', 4, 'Science', 87),
(23, 'Ava Walker', '2004-11-08', 'F', '2021-09-01', 'ava.walker@example.com', 5, 'Literature', 91),
(24, 'Jackson Hall', '2003-10-29', 'M', '2020-09-01', 'jackson.hall@example.com', 6, 'Science', 94),
(25, 'Grace Allen', '2005-08-13', 'F', '2023-09-01', 'grace.allen@example.com', 1, 'Literature', 80),
(26, 'Sebastian Young', '2004-04-09', 'M', '2023-09-01', 'sebastian.young@example.com', 2, 'Science', 83),
(27, 'Scarlett King', '2006-06-02', 'F', '2023-09-01', 'scarlett.king@example.com', 3, 'Science', 86),
(28, 'Logan Wright', '2005-02-27', 'M', '2022-09-01', 'logan.wright@example.com', 4, 'Literature', 89),
(29, 'Abigail Scott', '2004-03-16', 'F', '2021-09-01', 'abigail.scott@example.com', 5, 'Science', 92),
(30, 'David Green', '2003-12-31', 'M', '2020-09-01', 'david.green@example.com', 6, 'Literature', 97);

--إدخال معلومات ١٠ معلمين كحد أدنى
INSERT INTO teachers (teacher_id, teacher_name, teacher_birth, teacher_gander, teacher_email, teacher_office)
VALUES
(1, 'Sarah Thompson', '1980-05-12', 'F', 'sarah.thompson@example.com', 101),
(2, 'James Anderson', '1975-03-08', 'M', 'james.anderson@example.com', 102),
(3, 'Emily Carter', '1985-07-24', 'F', 'emily.carter@example.com', 103),
(4, 'John Smith', '1990-11-15', 'M', 'john.smith@example.com', 104),
(5, 'Olivia Johnson', '1982-01-19', 'F', 'olivia.johnson@example.com', 105),
(6, 'Michael Brown', '1978-06-22', 'M', 'michael.brown@example.com', 106),
(7, 'Emma Wilson', '1989-09-05', 'F', 'emma.wilson@example.com', 107),
(8, 'William Taylor', '1983-12-14', 'M', 'william.taylor@example.com', 108),
(9, 'Sophia Davis', '1992-04-18', 'F', 'sophia.davis@example.com', 109),
(10, 'Benjamin White', '1987-08-30', 'M', 'benjamin.white@example.com', 110);

--إدخال معلومات ٦ مواد كحد أدنى
INSERT INTO subjects (subject_id, subject_name)
VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'Biology'),
(5, 'History'),
(6, 'English Literature');

--عرض محتويات جميع الجداول
SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM subjects;

--عرض محتويات جدول الطلاب مع ترتيب الصفوف تصاعديًا حسب اسم الطالب
SELECT * FROM students ORDER BY student_name ASC;

--عرض محتويات جدول الطلاب مع إعطاء اسم مستعار لحقل “اسم الطالب” لاختصار اسم العمود أو جعله ذات معنى
SELECT student_name AS Sname 
FROM students;

--التعديل على البيانات
--التعديل على بيانات أحد الطلاب وتغيير البريد الالكتروني للطالب
UPDATE students
SET student_email ='0r6wan@gmail.com'
WHERE student_id = 3;
--التعديل على بيانات أحد المعلمين وتغيير رقم المكتب الخاص به
UPDATE teachers
SET teacher_office = 106
WHERE teacher_id = 5;

--التعديل على الجداول
--تعديل اسم أحد الجداول
ALTER TABLE subjects
RENAME TO Subjects;