--إنشاء علاقة بين جداول المعلمين والطلاب (حيث أن المعلم يدرّس أكثر من طالب، والطالب يقوم بتدريسه أكثر من معلم)
CREATE TABLE teacher_student (
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (teacher_id, student_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

--إنشاء علاقة بين جداول المواد والمعلمين (حيث أن المعلم يقوم بتدريس مادة واحدة فقط، والمادة يقوم بتدريسها أكثر من معلم)
ALTER TABLE teachers ADD subject_id INT;

ALTER TABLE teachers
ADD FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

--إنشاء علاقة بين جداول المواد والطلاب (حيث أن الطالب يدرس أكثر مادة، والمادة يدرسها أكثر من طالب)
CREATE TABLE student_subject (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

--قم بإنشاء Procedure باسم student_info يقوم بعرض أسماء الطلاب والمواد ويحتوي على جميع البيانات المشتركة بين جداول المواد والطلاب
DELIMITER $$
CREATE PROCEDURE student_info()
BEGIN
    SELECT 
        students.student_name AS student_name,
        subjects.subject_name AS subject_name
    FROM 
        student_subject
    JOIN students ON student_subject.student_id = students.student_id
    JOIN subjects ON student_subject.subject_id = subjects.subject_id;
END $$
DELIMITER ;

--قم باستدعائه
CALL student_info();

--قم بإنشاء view باسم teacher_info يحتوي على اسم المعلم ورقم المكتب واسم المادة التي يتم تدريسها
CREATE VIEW teacher_info AS
SELECT 
    teachers.teacher_name AS teacher_name,
    teachers.teacher_office AS office_number,
    subjects.subject_name AS subject_name
FROM 
    teachers
JOIN subjects ON teachers.subject_id = subjects.subject_id;

--قم بعرض view
SELECT * FROM teacher_info;

--قم بحذف view
DROP VIEW teacher_info;

--قم بإنشاء index للبحث باستخدام أسماء الطلاب أبجديًا
CREATE INDEX idx_student_name ON students(student_name);

--قم بعرض index
SHOW INDEX FROM students;

--قم بحذف index
DROP INDEX idx_student_name ON students;