use md03_project;

insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('2', 'Ip15', '120000', 'Iphone moi', '100', 'hjghkg', '5');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('3', 'Note10', '110000', 'Samsun moi', '100', 'hjggdhkg', '4');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('4', 'Note11', '1400000', 'Samsun moi', '100', 'fsdgfdh', '4');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('5', 'Dell 1', '210000', 'Dell moi', '100', 'bdfrw', '6');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('6', 'Dell 2', '22357568', 'Dell moi', '100', 'qrty', '6');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('7', 'HP 1', '2300000', 'HP moi', '100', 'mvb', '7');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('8', 'HP 2', '210000', 'HP moi', '100', 'gdgfd', '7');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('9', 'LG 1', '3214567', 'LG moi', '100', 'bdbvc', '8');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('10', 'LG 2', '3465675867', 'LG moi', '100', 'bcbv', '8');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('11', 'SS 1', '6544353', 'SS moi', '100', 'hghf', '9');
insert into `md03_project`.`product` (`id`, `name`, `price`, `description`, `stock`, `image`, `category_id`) values ('12', 'SS 2', '45756867', 'SS moi', '100', 'bjfertcbv', '9');

# Hien thi toan bo san pham
DELIMITER //
create procedure PROC_PRODUCT_FIND_ALL()
begin
	select * from product;
end //

# Hien thi san pham active
DELIMITER //
create procedure PROC_PRODUCT_ACTIVE_FIND_ALL(in status_active bit)
begin
	select * from product where status = status_active;
end //

# Phân trang
DELIMITER //
create procedure PROC_PRODUCT_PAGINATION(in limit_in int, In current_page int, Out total_page int)
begin 
 Declare offset_page Int;
 Set offset_page = (current_page -1 ) * limit_in;
 set total_page = Ceil((select count(*) from product) / limit_in);
 select * from product Limit limit_in offset offset_page;
end //

# Đếm sản phẩm by status
create procedure PROC_PRODUCT_COUNT_BY_COUNT(IN status_in bit, OUT pro_count int)
begin
	select * from product where status = status_in;
    set pro_count = (select count(*) from product where status = status_in);
end //

# them moi product
DELIMITER //
create procedure PROC_PRODUCT_ADD( IN name_in varchar(100),
price_in double, description_in text , brand_in varchar(100) ,
stock_in int, image_in text, category_id_in int, OUT product_id_add int)
begin 
	insert into product(name, price, description, brand, stock, image, category_id) values (
    name_in, price_in, description_in, brand_in, stock_in, image_in, category_id_in);
	select last_insert_id() into product_id_add;
end //

# update thong tin product
DELIMITER //
create procedure PROC_PRODUCT_EDIT( IN name_in varchar(100),
price_in double, description_in text , brand_in varchar(100) ,
stock_in int, image_in text, category_id_in int,id_in int, OUT product_id_add int)
begin 
	UPDATE product
    set name = name_in,
		price = price_in,
		description = description_in,
        brank = brank_in,
        stock = stock_in,
        image = image_in,
        category_id = category_id_in
	where id = id_in;
end //

# list thuong hieu
DELIMITER //
create procedure PROC_LIST_BRAND()
begin 
	select distinct brand from product;
end //

# Tim product thong qua brand
DELIMITER //
create procedure PROC_PRODUCT_FIND_BY_BRAND(IN brand_in int, out total_product int)
begin
	select * from product where brand = brand_in;
    set total_product = (select count(*) from product where brand = brand_in);
end //

# Tim kiem product theo id
DELIMITER //
create procedure PROC_PRODUCT_FIND_BY_ID(IN id_in int)
begin
	select * from product where id = id_in;
end //

# Tim kiem product theo category_id
DELIMITER //
 create procedure PROC_PRODUCT_FIND_BY_VATEGORY_ID(IN id_in int)
 begin
	select * from product where category_id = id_in;
 end //
 
 # Thay doi status cho product
 DELIMITER //
 create procedure PROC_PRODUCT_CHANGE_STATUS(IN id_in int)
 begin
	update product set status = status ^ 1 where id = id_in;
 end //