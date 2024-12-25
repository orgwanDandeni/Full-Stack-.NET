--إنشاء جدول للطلاب المتفوقين من جدول الطلاب، بحيث يحتوي هذا الجدول على بيانات الطلاب الذي يكون معدلهم التراكمي أعلى من ٩٠
CREATE TABLE top_students
SELECT * FROM students WHERE student_grade >= 90;

--إنشاء جدول للطلاب الغير مجتازين من جدول الطلاب، بحيث يحتوي هذا الجدول على بيانات الطلاب الذي يكون معدلهم التراكمي أقل من ٦٠
CREATE TABLE fail_students
SELECT * FROM students WHERE student_grade < 60;

--عرض أسماء الطلاب التي تبدأ بحرف A
SELECT * FROM students
WHERE student_name LIKE 'A%';

--عرض أسماء الطلاب التي تحتوي أسمائهم على أربع خانات
SELECT * FROM students
WHERE student_name LIKE '____';

--تطبيق AVG, MAX, MIN) Aggregate functions) على المعدل التراكمي للطالب مع إضافة تسمية واضحة للناتج
SELECT AVG(student_grade) AS avg_student
FROM students;

SELECT MAX(student_grade) AS max_student
FROM students;

SELECT MIN(student_grade) AS min_student
FROM students;

--حصر وعرض أسماء الطلاب المتفوقين في المستوى السادس الحاصلين على معدل تراكمي يساوي 100
SELECT * FROM students WHERE student_level = 6 AND student_grade = 100;

--عرض الطلاب اللذين في المستوى الأول وأعمارهم بين ١٥ و ١٦ سنة
SELECT * FROM students
WHERE student_level = 1 AND (YEAR(CURDATE()) - YEAR(student_birth)) BETWEEN 15 AND 16;

--عرض عدد الطلاب الموجودين بالمستوى ٢
SELECT COUNT(student_id)
FROM students
WHERE student_level = 2;

--استعراض مسارات الطلاب في المدرسة بدون تكرار
SELECT DISTINCT student_career
FROM students;

--عرض أسماء المواد ويتم عرض الكلمات بالأحرف الكبيرة
SELECT UPPER(subject_name)
FROM subjects;

--عرض المتوسط الحسابي للمعدل التراكمي وقرب الرقم لأقرب أصغر عدد (باستخدام numeric functions)
SELECT FLOOR(AVG(student_grade)) AS avg_grade
FROM students;

--تبديل جميع الصفوف من جدول الطلاب التي تحتوي على الجنس F إلى Female، و M إلى Male (باستخدام string functions)
UPDATE students
SET student_gander = CASE
    WHEN student_gander = 'F' THEN 'Female'
    WHEN student_gander = 'M' THEN 'Male'
END;

--تحديث المعدل التراكمي للطلاب الذي معدلهم التراكمي أقل من ٦٠ وزيادة معدلهم بخمس درجات
UPDATE students
SET student_grade = student_grade + 5
WHERE student_grade < 60;