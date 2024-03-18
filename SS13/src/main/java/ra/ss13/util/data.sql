drop database demo_ss13;
create database demo_ss13;
use demo_ss13;
create table user
(
    id      int not null primary key auto_increment,
    name    varchar(120) not null,
    email   varchar(220) not null,
    country varchar(120)

);

insert into user(name, email, country)values('Minh', 'Minh@rikkei.academy','Viet name');
insert into user(name, email, country)values('Kante', 'kante@che.uk','Kenia');
