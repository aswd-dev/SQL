-- Class 04

DECLARE @FirstName VARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

DECLARE @FemaleStudent TABLE
(StudentId INT NOT NULL, StudentName NVARCHAR(100), DateOfBirth datetime)

INSERT INTO @FemaleStudent (StudentId, StudentName, DateOfBirth)
SELECT Id, FirstName + ' ' + LastName AS StudentName, DateOfBirth
FROM Student
WHERE Gender = 'F';

SELECT * FROM @FemaleStudent

-- Temp Table

DROP TABLE IF EXISTS #MaleStudentTempTable

CREATE TABLE #MaleStudentTempTable
(LastName NVARCHAR(100), EnrolledDate Datetime)

INSERT INTO #MaleStudentTempTable
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' AND FirstName LIKE '%A'

SELECT *
FROM #MaleStudentTempTable
WHERE LEN(LastName) = 7



-- Find all teachers whose FirstName length is less than 5 and
-- the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 AND LEFT (FirstName, 3) = LEFT (LastName, 3)