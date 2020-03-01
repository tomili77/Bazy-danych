
create database library1;
use library1;
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

INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Ferdydurke', 'Gombrowicz Witold', '1997-02-11', '348-83-342-0849-7', 'Powieść', 432, 'PWN', 23.10);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Mała Apokalipsa', 'Konwicki Tadeusz', '1994-01-13', '545-83-283-0849-1', 'Powieść', 124, 'Niezależna Oficyna Wydawnicza', 19.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Opowiadania', 'Hłasko Marek', '1997-11-02', '978-83-211-0849-3', 'Klasyka polska', 233, 'Wydawnictwo DaCapo', 9.90);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Dziady', 'Mickiewicz Adam', '2007-05-13', '111-22-283-0849-7', 'Lektury', 341, 'Greg', 22.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Mistrz i Małgorzata', 'Bułhakow Michał', '1995-01-02', '978-83-283-3333-7', 'Klasyka zagraniczna', 210, 'Czytelnik', 13.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Wielki atlas roślin', 'Nowak F.A', '1999-08-22', '978-83-44-2111-7', 'Biologia', 280, 'PWRiL', 99.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Granica', 'Nałkowska Zofia', '2000-05-14', '784-83-283-8931-7', 'Klasyka polska', 439, 'PWN', 39.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Saga o Wiedźminie t. 1 - Krew elfów', 'Sapkowski Andrzej', '2001-09-01', '978-83-283-0000-7', 'Powieść fantastyczn', 520, 'Super NOWA', 52.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Władca Pierścieni Drużyna Pierscienia T.1', 'Tolkien J. R. R.', '2002-07-01', '900-83-333-0040-7', 'Powieść fantastyczn', 780, 'MUZA S.A.', 41.00);
insert into book ( title, author, published, isbn, category, page_count, publisher, price)
values('Spring w akcji, Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie Java' 
, 624, 'Helion', 89.00);
insert into book ( title, author, published, isbn, category, page_count, publisher, price)
values('MySQL. Vademecum profesjonalisty.', 'Paul DuBios', '2014-03-28', '978-83-246-8146-4', 'Bazy danych',
1216, 'Helion', 149.90);

#Wyświetl książki z kategorii Klasyka polska.
select* from book where category like 'Klasyka polska'; 
 #Policz ile jest książek w przedziale cenowym 10 -30 zł.
select* from book where price between 10 and 30;

#Wyświetl największą liczbę stron oraz najmniejszą w książkach.
select min(page_count), max(page_count) from book; 


#Wyświetl tytuł książki z największą ilością stron.
select* from book where title =(select max(page_count) from book); 

#Wyświetl książki wydane przed 2000 rokiem.
select* from book where published <= '2000-01-01'; 

#Policz ile książek wydało każde z wydawnictw po 2000 roku.
select publisher, sum(published >= '2000-01-01') from book group by publisher; 

#Policz jaka jest suma stron książek wydanych przez wydawnictwo PWN
select sum(page_count) from book where publisher like 'PWN'; 

#Wyświetl kategorie książek dla których istnieją co najmniej 2 książki, których cena jest większa od 10.01 zł.
select* from book where category = (select price >= 10.01 ); 
SELECT* FROM book WHERE EXISTS(SELECT category WHERE price >= 10.01);

#Wyświetl tytuły książek posortowane alfabetycznie w porządku malejącym, które nie są lekturą i których cena jest większa niż 20 zł.
select* from book order by title desc;
select* from book where category not like 'Lektury' and  price > 20 ;


#Wyświetl wszystkie dane z tabeli book tłumacząc nazwy kolumn na język polski.
select title as tytuł, author as autor, published as wydane, isbn as isbn, category as kategoria, page_count as ilość_stron, 
publisher as wydawca, price as cena from book;