drop database if exists aprod;
create database aprod;
use aprod;

create table categories (
    id integer unsigned primary key not null auto_increment,
    name char(100) not null
);

create table artists (
    id integer unsigned primary key not null auto_increment,
    name char(100) not null
);

create table products (
    id integer unsigned primary key not null auto_increment,
    name char(100) not null,
    price float not null,
    cid integer unsigned not null,
    aid integer unsigned not null,
    foreign key(cid) references categories(id) on delete cascade,
    foreign key(aid) references artists(id) on delete cascade
);

create table coupons (
    id integer unsigned primary key not null auto_increment,
    name char(100) not null,
    discount_percent float not null
);
