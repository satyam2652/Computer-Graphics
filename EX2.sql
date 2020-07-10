create table STUDENTS
( 
studentID int constraint [PK_CONSTRAINT_STUDENT] primary key,
firstName varchar(20),
lastName varchar(20),
dateOfBirth date,
addressLine1 varchar(40),
addressLine2 varchar(40),
addressLine3 varchar(40)
);

TRUNCATE TABLE STUDENTS

INSERT INTO STUDENTS VALUES( 01, 'SATYAM', 'NAGVENKAR', '07/08/1989', 'MARCELA','PONDA','GOA')
INSERT INTO STUDENTS VALUES( 02, 'SHRADDHA', 'LOTLIKAR', '01/01/2000', 'PEDNE','GOA','INDIA')
INSERT INTO STUDENTS VALUES( 01, 'ABC', 'XYZ', '01/01/1999', 'PQR','LMN','MNO')						//ERROR

create table LECTURERS
( 
lecturerID int constraint [PK_CONSTRAINT_LECTURER] primary key,
firstName varchar(20),
lastName varchar(20),
);

TRUNCATE TABLE LECTURERS

INSERT INTO LECTURERS VALUES(101,'BENHAR','CHARLES') 
INSERT INTO LECTURERS VALUES(102,'VIPIN','Z') 
INSERT INTO LECTURERS VALUES(102,'XYZ','PQR')					//ERROR

create table STUDENTLECTURER
(
studentID int constraint [FK_CONSTRAINT_STUDENT_LECTURER] references STUDENTS(studentID),
lecturerID int constraint [FK_CONSTRAINT_LECTURERS_STUDENT] references LECTURERS(lecturerID),
semester varchar(5)
);

TRUNCATE TABLE STUDENTLECTURER

INSERT INTO STUDENTLECTURER VALUES(01,101,'ONE')
INSERT INTO STUDENTLECTURER VALUES(01,101,'TWO')
INSERT INTO STUDENTLECTURER VALUES(01,101,'FOUR')
INSERT INTO STUDENTLECTURER VALUES(02,102,'ONE')
INSERT INTO STUDENTLECTURER VALUES(09,109,'TWO')			//ERROR

create table COURSES
(
courseID int constraint [PK_CONSTRAINT_COURSES] primary key,
courseName varchar(20),
);

TRUNCATE TABLE COURSES

INSERT INTO COURSES VALUES (111,'COMPUTER SCIENCE')
INSERT INTO COURSES VALUES (222,'DATABASE')
INSERT INTO COURSES VALUES (333,'DOT NET')
INSERT INTO COURSES VALUES (333,'DOT NET')				//ERROR

create table STUDENTCOURSE
(
studentID int constraint [FK_CONSTRAINT_STUDENT_LECTURER2] references STUDENTS(studentID),
courseID int constraint [FK_CONSTRAINT_STUDENT_COURSES2] references COURSES(courseID),
semester varchar(5)
);

TRUNCATE TABLE STUDENTCOURSE

ALTER TABLE STUDENTCOURSE
ADD CONSTRAINT [PK_CONSTRAINT_STUDENT_COURSE] PRIMARY KEY(studentID,courseID)



INSERT INTO STUDENTCOURSE VALUES(01,111,'ONE')
INSERT INTO STUDENTCOURSE VALUES(01,222,'ONE')
INSERT INTO STUDENTCOURSE VALUES(01,333,'ONE')
INSERT INTO STUDENTCOURSE VALUES(09,999,'ONE')			//ERROR

create table LECTURERCOURSE
(
lecturerID int constraint [FK_CONSTRAINT_LECTURERS_COURSES3] references LECTURERS(lecturerID),
courseID int constraint [FK_CONSTRAINT_STUDENT_COURSES3] references COURSES(courseID),
semester varchar(5)
);

TRUNCATE TABLE LECTURERCOURSE

ALTER TABLE LECTURERCOURSE
ADD CONSTRAINT [PK_CONSTRAINT_LECTURE_COURSE] PRIMARY KEY(lecturerID,courseID)


INSERT INTO LECTURERCOURSE VALUES(101, 111,'ONE')
INSERT INTO LECTURERCOURSE VALUES(101, 222,'ONE')
INSERT INTO LECTURERCOURSE VALUES(102, 333,'ONE')
INSERT INTO LECTURERCOURSE VALUES(109, 999,'ONE')		//ERROR