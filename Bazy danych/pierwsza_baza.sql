#1. Tworzenie bazy danych i użytkownika 
CREATE DATABASE library;
USE library;
CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON library.* TO 'library_user'@'localhost';
FLUSH PRIVILEGES;

# Odbieranie uprawnień użytkownikom 
# REVOKE ALL PRIVILEGES ON library.* FROM 'library_user'@'localhost';

#2. tworzenie tabel, komenda if not exiist - spraawdza czy istnieje juz tabela 
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


