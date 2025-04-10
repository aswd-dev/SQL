USE SEDC_ACADEMY_HOMEWORK

-- Calculate the count of all grades per Teacher in the system

SELECT g.TeacherId, COUNT(*) AS GradeCount
FROM Grade g
GROUP BY g.TeacherId;

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT g.TeacherId, COUNT(*) AS GradeCount
FROM Grade g
WHERE g.StudentId < 100
GROUP BY g.TeacherId;

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT g.StudentId, 
       MAX(g.Grade) AS MaxGrade,
       AVG(g.Grade * 1.0) AS AvgGrade
FROM Grade g
GROUP BY g.StudentId;


-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT g.TeacherId, COUNT(*) AS GradeCount
FROM Grade g
GROUP BY g.TeacherId
HAVING COUNT(*) > 200;


-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT g.StudentId, 
       COUNT(*) AS GradeCount,
       MAX(g.Grade) AS MaxGrade,
       AVG(g.Grade * 1.0) AS AvgGrade
FROM Grade g
GROUP BY g.StudentId
HAVING MAX(g.Grade) = AVG(g.Grade * 1.0);


-- List Student First Name and Last Name next to the other details from previous query

SELECT g.StudentId, s.FirstName, s.LastName,
       COUNT(*) AS GradeCount,
       MAX(g.Grade) AS MaxGrade,
       AVG(g.Grade * 1.0) AS AvgGrade
FROM Grade g
JOIN Student s ON g.StudentId = s.ID
GROUP BY g.StudentId, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade * 1.0);


-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE OR ALTER VIEW vv_StudentGrades
AS
SELECT g.StudentId, COUNT(*) AS GradeCount
FROM Grade g
GROUP BY g.StudentId;


-- Change the view to show Student First and Last Names instead of StudentID

CREATE OR ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT(*) AS GradeCount
FROM Grade g
JOIN Student s ON g.StudentId = s.ID
GROUP BY s.FirstName, s.LastName;


-- List all rows from view ordered by biggest Grade Count

SELECT * 
FROM vv_StudentGrades
ORDER BY GradeCount DESC;
