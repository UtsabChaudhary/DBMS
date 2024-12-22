CREATE DATABASE college_db;

USE college_db;
CREATE TABLE students(
std_id INT PRIMARY KEY NOT NULL,
name VARCHAR(50),
dob DATE,
batch VARCHAR(50)
);

CREATE TABLE college(
college_name varchar(100),
program varchar(30),
email varchar(30),
phone int
);

Create TABLE subject(
sub_code int primary key,
subname varchar(50),
writer varchar(30),
Publication varchar(100)
);

ALTER TABLE college
DROP COLUMN program;

ALTER TABLE subject
DROP COLUMN writer;

DROP TABLE college;
DROP TABLE students;
DROP TABLE subject;

..............................................

CREATE TABLE Cources(
cource_id VARCHAR(5) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
credit_hrs INT,
university VARCHAR(50)
);

CREATE  TABLE Students(
std_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
dob DATE,
batch VARCHAR(5),
cource_id VARCHAR(5),
FOREIGN KEY (cource_id) REFERENCES Cources(cource_id)
);

INSERT INTO Cources (cource_id, name, credit_hrs, university)
VALUES
('c001', 'IIT', 75, 'KU'),
('c002', 'DBMS', 55 ,'PU'),
('c003', 'PYTHON', 102, 'TU'),
('c004', 'JAVA', 99, 'TU'),
('c005', 'PHP', 83, 'PoU');

INSERT INTO Students(std_id, name, dob, batch, cource_id)
VALUES
(1,'Utsab Chaudhary', '2059-09-16', '2079', 'c001'),
(2,'Bishow Chaudhary', '2060-05-01', '2079', 'c002'),
(3,'Anjali Chaudhary', '2060-03-18', '2079', 'c003'),
(4,'Rojesh Humagain', '2061-09-15', '2079', 'c004'),
(5,'Sujan Basnet', '2060-05-03', '2079', 'c001'),
(6,'Rakesh Joshi', '2058-11-26', '2079', 'c003'),
(7,'Tanu Tadav', '2058-06-12', '2079', 'c002'),
(8,'Mijala Maharjan', '2059-07-21', '2079', 'c004'),
(9,'Bijen Maharjan', '2061-08-04', '2079', 'c003'),
(10,'Anish Chaudhary', '2058-03-05', '2079', 'c001');

................................................................

SELECT * FROM Cources;
SELECT * FROM Students;
SELECT std_id, name FROM students WHERE batch = '2079';
SELECT * FROM cources WHERE university = 'TU' AND credit_hrs > 100;
SELECT COUNT(*) FROM students WHERE batch = '2080';
SELECT name, credit_hrs FROM cources WHERE university IN ('KU','TU');
SELECT * FROM students WHERE name LIKE 'U%';
SELECT * FROM students WHERE dob < '2000-01-01';
UPDATE students SET dob='2004-09-02' where std_id=1;