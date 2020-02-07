create database if not exists private_School
default character set utf8;

use private_School;

create table trainer(
trainerid int unsigned auto_increment,
firstname varchar(20) not null,
lastname varchar(20) not null,
tsubject varchar(20) not null,
primary key(trainerid)
);

create table student(
studentid int unsigned auto_increment,
firstname varchar(20) not null,
lastname varchar(20) not null,
dateofbirth date,
tuitionfees decimal(7.3) unsigned null,
primary key(studentid),
constraint dateofbirth check (dateofbirth < '2007-01-01')
);

create table course(
courseid int unsigned auto_increment,
title varchar(20) not null,
stream varchar(20) not null,
ctype varchar(20) not null,
startdate date not null,
enddate date not null,
primary key(courseid),
constraint enddate check (enddate > startdate),
constraint ctype check (ctype= 'full time' or ctype= 'part time')
);

create table assignment(
assignmentid int unsigned auto_increment,
title varchar(25) not null,
description varchar(45) not null,
subdatetime date,
oralmark decimal(5,2) unsigned default 100,
totalmark decimal(5,2) unsigned default 100,
primary key(assignmentid)
);

create table studentpercourse(
studentpercourseid int unsigned auto_increment primary key,
studentid int unsigned,
courseid int unsigned,
constraint studentFK foreign key(studentid) references student (studentid),
constraint courseFK foreign key(courseid) references course (courseid)
);

create table trainerpercourse(
trainerpercourseid int unsigned auto_increment primary key,
trainerid int unsigned,
courseid int unsigned,
constraint trainerFK foreign key(trainerid) references trainer (trainerid),
constraint course_FK foreign key(courseid) references course (courseid)
);

create table assignmentpercourse(
assignmentpercourseid int unsigned auto_increment primary key,
assignmentid int unsigned,
courseid int unsigned,
constraint assignmentFK foreign key(assignmentid) references assignment (assignmentid),
constraint courseFK1 foreign key(courseid) references course (courseid)
);

create table assignmentpercourseperstudent(
assignmentpercourseperstudentid int unsigned auto_increment primary key,
assignmentid int unsigned,
courseid int unsigned,
studentid int unsigned,
oralmark decimal(5,2) unsigned default 100,
totalmark decimal(5,2) unsigned default 100,
constraint assignment_FK foreign key(assignmentid) references assignment (assignmentid),
constraint courseFK2 foreign key(courseid) references course (courseid),
constraint student_FK foreign key(studentid) references student (studentid)
);

insert into student(firstname, lastname, dateofbirth, tuitionfees)
values ('Nick', 'White', '1988-06-11', 1100.33),
('George', 'Black', '1992-10-24', 1300.22),
('Alan', 'Redman', '1995-03-12', 1150.56),
('Kate', 'Anderson', '1988-01-06', 880.99),
('Helen', 'Petrovsky', '1991-04-19', 1400.48),
('James', 'Green', '1981-08-15', 890.55),
('Sophie', 'Brown', '1979-12-30', 1100.44);

insert into course(title, stream, ctype, startdate, enddate)
values ('CB7', 'Java' , 'full time', '2019-09-02', '2019-12-02'),
('CB8', 'Java' , 'part time', '2019-10-14', '2020-01-24'),
('CB8', 'C#' , 'full time', '2019-10-14', '2020-01-24');

insert into trainer(trainerid, firstname, lastname, tsubject)
values (101, 'Jack', 'Daniels', 'Java Instructor'),
(102, 'Ben', 'Kenobi', 'OOP Instructor');

insert into assignment(assignmentid, title, description, subdatetime)
values (666, 'OOP assignment', 'create your first programm', '2019-11-04'),
(667, 'WEB application', 'Design a Web app', '2019-11-18');

insert into  studentpercourse(studentid, courseid)
values (1, 1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(3,3),
(2,3);

insert into trainerpercourse(trainerid,courseid)
values (101,1),
(101,2),
(102,3);

insert into assignmentpercourse(assignmentid,courseid)
values (666, 1),
(667, 1),
(666, 2),
(667, 3),
(666, 3);

insert into assignmentpercourseperstudent (assignmentid, studentid, courseid, oralmark, totalmark)
values(666, 1, 1, 80, 83),
(666, 2, 1, 69, 97),
(666, 3, 1, 78, 79),
(666, 4, 2, 95, 84),
(666, 5, 2, 72, 71),
(666, 6, 2, 89, 81),
(667, 2, 1, 73, 76),
(667, 3, 1, 68, 70),
(667, 4, 2, 60, 52),
(667, 5, 2, 99, 100),
(667, 6, 2, 86, 88),
(666, 7, 3, 89, 89),
(666, 3, 3, 81, 72),
(666, 2, 3, 93, 74);
