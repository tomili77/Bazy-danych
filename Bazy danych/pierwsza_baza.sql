
CREATE DATABASE library;
USE library;
CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON library.* TO 'library_user'@'localhost';
FLUSH PRIVILEGES;



create table if not exists author (
first_name varchar(128),
last_name varchar(128)
);

create table if not exists book (
 title varchar(128), 
 author varchar(128), 
 published date, 
 isbn varchar(32), 
 category varchar(128), 
 page_count int(128), 
 publisher varchar(128), 
 price float
 );
 show databases;
 show tables;
 desc book;
insert into book ( title, author, published, isbn, category, page_count, publisher, price)
values('Spring w akcji, Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie Java' 
, 624, 'Helion', 89.00);

insert into book ( title, author, published, isbn, category, page_count, publisher, price)
values('MySQL. Vademecum profesjonalisty.', 'Paul DuBios', '2014-03-28', '978-83-246-8146-4', 'Bazy danych',
1216, 'Helion', 149.90);
select* from book;

