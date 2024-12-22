CREATE DATABASE college_dbms;

USE college_dbms;
-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Subject Table
CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100),
    CreditHours INT,
    Semester INT,
    SubjectType VARCHAR(20),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Teacher Table
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100),
    Gender VARCHAR(10),
    MaritalStatus VARCHAR(20),
    PhoneNumber VARCHAR(15),
    Qualification VARCHAR(100),
    Specialization VARCHAR(100)
);

-- Batch Table
CREATE TABLE Batch (
    BatchID INT PRIMARY KEY,
    BatchYear INT
);

-- TeachingAssignment Table
CREATE TABLE TeachingAssignment (
    AssignmentID INT PRIMARY KEY,
    TeacherID INT,
    SubjectID INT,
    BatchID INT,
    Fee DECIMAL(10, 2),
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    BatchID INT,
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);


-- Insert data into Course
INSERT INTO Course (CourseID, CourseName) VALUES 
(1, 'BCA');

-- Insert data into Subject
INSERT INTO Subject (SubjectID, SubjectName, CreditHours, Semester, SubjectType, CourseID) VALUES 
(1, 'Java Programming', 4, 2, 'Compulsory', 1),
(2, 'Database Systems', 3, 2, 'Compulsory', 1);

-- Insert data into Teacher
INSERT INTO Teacher (TeacherID, TeacherName, Gender, MaritalStatus, PhoneNumber, Qualification, Specialization) VALUES 
(1, 'Prabin Magar', 'Male', 'Single', '1234567890', 'MSc IT', 'Programming'),
(2, 'Rabita Maharjan', 'Female', 'Married', '0987654321', 'MCA', 'Database Systems');

-- Insert data into Batch
INSERT INTO Batch (BatchID, BatchYear) VALUES 
(1, 2079);

-- Insert data into TeachingAssignment
INSERT INTO TeachingAssignment (AssignmentID, TeacherID, SubjectID, BatchID, Fee) VALUES 
(1, 1, 1, 1, 75000),
(2, 2, 2, 1, 80000);

-- Insert data into Student
INSERT INTO Student (StudentID, StudentName, BatchID) VALUES 
(1, 'Utsab Chaudhary', 1),
(2, 'Sujan Basnet', 1),
(3, 'Rojesh Humagain', 1),
(4, 'Abiral Sapkota', 1),
(5, 'Rakesh Joshi', 1),
(6, 'Pratyusha Shrestha', 1),
(7, 'Anjali Chaudhary', 1),
(8, 'Bishow Chaudhary', 1),
(9, 'Anish Chaudhary', 1),
(10, 'Bijen Maharjan', 1);


SELECT * FROM Course;
SELECT * FROM Subject;
SELECT * FROM Teacher;
SELECT * FROM Batch;
SELECT * FROM TeachingAssignment;
SELECT * FROM Student;

--------------------------------------

SELECT AVG(Fee) AS AverageFee FROM TeachingAssignment;

SELECT COUNT(*) AS TotalStudents FROM Student;

SELECT TeacherName, COUNT(SubjectID) AS SubjectCount
FROM Teacher T
JOIN TeachingAssignment TA ON T.TeacherID = TA.TeacherID
GROUP BY TeacherName
ORDER BY SubjectCount DESC;

SELECT BatchYear, COUNT(StudentID) AS StudentCount
FROM Batch B
JOIN Student S ON B.BatchID = S.BatchID
GROUP BY BatchYear;

SELECT SubjectName, CreditHours
FROM Subject
WHERE CourseID = (SELECT CourseID FROM Course WHERE CourseName = 'BCA');

SELECT TeacherName
FROM Teacher T
JOIN TeachingAssignment TA ON T.TeacherID = TA.TeacherID
JOIN Subject S ON TA.SubjectID = S.SubjectID
WHERE S.SubjectName = 'Java Programming';

SELECT TeacherName
FROM Teacher
WHERE Specialization = 'Programming';

SELECT SUM(Fee) AS TotalFee
FROM TeachingAssignment TA
JOIN Batch B ON TA.BatchID = B.BatchID
WHERE B.BatchYear = 2079;

SELECT TeacherName, Qualification
FROM Teacher
WHERE Gender = 'Female';

SELECT S.SubjectName, AVG(TA.Fee) AS AverageFee
FROM Subject S
JOIN TeachingAssignment TA ON S.SubjectID = TA.SubjectID
GROUP BY S.SubjectName;

---------------------------------

CREATE VIEW StudentNamesAndBatches AS 
SELECT StudentID, StudentName, BatchYear 
FROM Student S
JOIN Batch B ON S.BatchID = B.BatchID;

CREATE VIEW TeacherSubjects AS 
SELECT T.TeacherName, S.SubjectName 
FROM Teacher T
JOIN TeachingAssignment TA ON T.TeacherID = TA.TeacherID
JOIN Subject S ON TA.SubjectID = S.SubjectID;

CREATE VIEW CourseCreditSummary AS 
SELECT C.CourseName, SUM(S.CreditHours) AS TotalCreditHours
FROM Course C
JOIN Subject S ON C.CourseID = S.CourseID
GROUP BY C.CourseName;



SELECT * FROM StudentNamesAndBatches
ORDER BY BatchYear;

SELECT * FROM TeacherSubjects
WHERE SubjectName = 'Java Programming';

SELECT * FROM CourseCreditSummary;

