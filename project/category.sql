
use Md03_project;

INSERT INTO `md03_project`.`category` (`id`, `name`, `image`) VALUES ('1', 'Dien thoai', '123');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`) VALUES ('2', 'May tinh', '4324');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`) VALUES ('3', 'Tivi', '432');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('4', 'sam sung', 'gfd', '1');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('5', 'iphone', 'hgfhf', '1');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('6', 'dell', 'gdfhfj', '2');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('7', 'HP', 'gdrte', '2');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('8', 'LG','gfrw', '3');
INSERT INTO `md03_project`.`category` (`id`, `name`,  `image`, `parent_id`) VALUES ('9', 'Samsung', 'we', '3');

# Phan trang
DELIMITER //
create procedure PROC_CATEGORY_PAGINATION(IN limit_int int, IN current_page_in int, out tatal_page int )
begin 
	DECLARE offset_page int;
    set offset_page = (current_page_in -1) * limit_in;
    set total_page = CEIL((select count(*) from category)/limit_int);
    select * from category LIMIT limit_in offset offset_page;
end //


# Tìm toàn bộ danh mục
DELIMITER //
CREATE PROCEDURE PROC_CATEGORY_FIND_ALL()
	BEGIN
    SELECT * FROM category;
    END //
    
call PRO_CATEGORY_FIND_ALL;

DELIMITER //
# tìm category parent
CREATE PROCEDURE PROC_CATEGORY_FIND_PARENT()
begin
    SELECT *FROM category order by id limit 3;
end //
call PROC_CATEGORY_FIND_PARENT;

# Dem sluong cata theo status
DELIMITER //
CREATE PROCEDURE PROC_CATEGORY_COUNT_BY_STATUS(IN status_in bit, out cata_count int)
BEGIN
		if (status_in != 0 and status_in != 1) THEN
			SET cata_count = (SELECT count(*) FROM category);
		else 
			set cate_count = (select count(*) from category where status = status_in);
		END IF;
END //

# Tao procedure them moi category

DELIMITER //
create procedure PROC_CATEGORY_ADD(iN name_in varchar(100), parent_id_in int, image_in varchar(255))
begin 
		insert into category(name,image,parent_id) values(name_in,  image_in,parent_id_id);
end //

# Taoj procedure edit
DELIMITER //
create procedure PROC_CATEGORY_EDIT(IN name_in varchar(100), parent_id_in int , image_in varchar(255) , id_in int)
begin 
		update category set name = name_in, parent = parent_in, image = image_in where id = id_in;
end//

# Tao procedure thay doi trang thai status
DELIMITER //
create procedure PROC_CATEGORY_CHANGE_STATUS(IN id_in int)
begin
	UPDATE category set status = status^1 where id = id_in;
    # Toan tu XOR (^) bitwise để chuyển đổi cột status giữa 0 và 1
end //

# Tim kiem category by id
DELIMITER //
create procedure PROC_CATEGORY_FIND_BY_ID(IN id_in int)
begin
	select * from category where id = id_in;
end //

# Tim kiem category by name
DELIMITER //
create procedure PROC_CATEGORY_FIND_BY_NAME(IN name_in varchar(100))
begin
	select * from category 
    where LCASE(name) LIKE concat('%', LCASE(name_in),'%')
    or id LIKE concat('%', LCASE(name_in), '%');
end//

# Tim category
DELIMITER //
CREATE PROCEDURE PROC_CATEGORY_FIND(IN name_in varchar(100), OUT total_page int)
begin
    SELECT *
    FROM category
    WHERE LCASE(name) LIKE concat('%', LCASE(name_in), '%')
       or id LIKE concat('%', LCASE(name_in), '%');
    SET total_page = ceil((SELECT count(*)
                           FROM category
                           WHERE LCASE(name) LIKE concat('%', LCASE(name_in), '%')
                              or id LIKE concat('%', LCASE(name_in), '%')) / 5);
end //

# sort by id
DELIMITER //
create procedure PROC_SORT_BY_ID(IN sort_order varchar(4) )
begin
	if sort_order = 'DEST' THEN
    select * from category order by id desc;
    elseif sort_order = 'ASC' THEN
    select * from category order by id asc;
    else select * from category;
    end if;
end //

# Tim category_parent by id
DELIMITER //
create procedure PROC_CATEGOTY_FIND_PARENT_BY_ID(IN parent_id_in int)
begin
	select * from category where parent_id = parent_id_in;
end //

# Tim category by name
DELIMITER //
create procedure PROC_CATEGORY_FIND_BY_NAME(IN name_in varchar(100))
begin 
	select * from category where lcase(name) LIKE concat('%',Lcase(name_in),'%');
end //


