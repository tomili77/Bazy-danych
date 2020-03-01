
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
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Ferdydurke', 'Gombrowicz Witold', '1997-02-11', '348-83-342-0849-7', 'Powieść', 432, 'PWN', 23.10);

select* from book;

alter table book modify column title varchar(128) not null;
alter table book modify column author varchar(128) not null;
alter table book modify column isbn varchar(32) not null;
alter table book modify column publisher varchar(32) default 'nieznana';

alter table book add column in_stock int default 0;
desc book;

select* from book where price between 50 and 90;
select* from book where isbn in ('978-83-283-0849-7', '978-83-246-8146-4');
select* from book where title like 'Spring w akcji, Wydanie I_';
select* from book where title like '%Spring%';

select distinct publisher from book;

select publisher, sum(price) from book group by publisher;

select sum(page_count) as total_pages from book;
select avg(page_count) from book;
select min(page_count) from book;
select max(page_count) from book;

select* from book
where exists (select* from book where price < 100);

#buckup tabeli 

CREATE TABLE backup_book  (
 title varchar(128), 
 author varchar(128), 
 published date, 
 isbn varchar(32), 
 category varchar(128), 
 page_count int(128), 
 publisher varchar(128), 
 price float
 );
 
 INSERT INTO backup_book SELECT* FROM  book;
 
 CREATE TABLE backup_book AS SELECT* FROM book; # to samo tylko w jednej linijce !!!!
 
 CREATE TABLE selected_book  (
 title varchar(128), 
 author varchar(128), 
 published date, 
 isbn varchar(32), 
 page_count int(128), 
 publisher varchar(128), 
 price float
 );
 
 INSERT INTO selected_book 
 SELECT title, author, published, isbn, page_count, publisher, price FROM book 
 WHERE category = 'Bzay danych';
 
 
 
 