create database JDBC;

USE JDBC;

create table student(
id int primary key,
Name varchar(30),
rollNo  int
);

Insert into student values (1, "Prathamesh", 3014);

select * from student;
Insert into student values (2, "Shraya", 3015), (3, " Siddie", 3016);