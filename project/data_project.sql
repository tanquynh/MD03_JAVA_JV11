drop database Md03_project;
create database Md03_project;
Use Md03_project;
CREATE TABLE category
(
    id        int primary key auto_increment,
    name      varchar(100) not null unique,
    status    bit(1) default 1,
    image varchar(255),
    parent_id int
);

CREATE TABLE product
(
    id          int primary key auto_increment,
    name        varchar(100) not null unique,
    price       double       not null,
    description text         not null,
    brand       varchar(100),
    stock       int          not null,
    status      bit(1) default 1,
    image       text,
    category_id int          not null,
    foreign key (category_id) references category (id)
);

CREATE TABLE USER
(
    id       int primary key auto_increment,
    name     varchar(100) not null,
    email    varchar(50)  not null unique,
    address  text         not null,
    phone    varchar(20)  not null,
    role     bit(1) default 1,
    status   bit(1) default 1,
    avatar   varchar(255),
    password varchar(255) not null
);

CREATE TABLE `orders`
(
    id       int primary key auto_increment,
    user_id  int,
    foreign key (user_id) references user (id),
    total    double,
    address  text,
    note     text,
    status   int(1) default 0,
    order_at date   default (DATE(NOW()))
);

CREATE TABLE order_detail
(
    order_id   int,
    foreign key (order_id) references orders (id),
    product_id int,
    foreign key (product_id) references product (id),
    quantity   int,
    price      double
);
CREATE TABLE CART
(
    id      int primary key auto_increment,
    user_id int,
    foreign key (user_id) references user (id)
);
CREATE TABLE cart_item
(
cart_id    int,
    foreign key (cart_id) references cart (id),
    product_id int,
    foreign key (product_id) references product (id),
    quantity   int
);

CREATE TABLE WISHLIST
(
    id         int primary key auto_increment,
    user_id    int,
    foreign key (user_id) references user (id),
    product_id int,
    foreign key (product_id) references product (id)
);
