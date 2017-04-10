//创建数据库并制定字符集
create database gy1 charset utf8;

//删除数据库
drop database gy1;

//查看所有数据库
show databases;

//切换数据库
-use gy1;

//查看当前数据库下的所有表
show tables;

//创建表，制定引擎和字符集
create table stu(
snum int,
sname varchar(10)
)engine myisam charset utf8;

//删除表
drop table stu;

//重命名表
rename table stu to newstu;

//向表中插入数据
insert stu values (1,"zhangsan"),(1,"lisi"),(3,"wangwu");

//清空表数据，速度快于delete *,底层实现为删除并建立此空表
truncate stu;

//删除表记录
delete from stu where 条件;


#这是注释
- create table class(
    -> id int primary key auto_increment,
    -> sname varchar(10) not null default "",
    -> gender char(1) not null default "",
    -> company varchar(20) not null default "",
    -> salary decimal(6,2) not null default 0.00,
    -> fanbu smallint not null default 0
    -> )engine=myisam charset=utf8;

//查看表结构
-desc class;


-insert into class 
(id,sname,gender,company,salary,fanbu) 
values 
(1,"张三","男","百度",18888.67,234);

//更新表数据
-update class 
set salary=8888.67 
where id=1;


-insert into class 
(sname,gender,salary) 
values 
("刀锋","男",8765.43);

- insert into class 
values 
(
    -> 3,"李四","女","新浪",5676.99,123);

//插入多提条数据
-insert into class 
(sname,company,salary) 
values
("刘备","皇室成员",16.35),
("孙策","江东集团",56.15),
("曹操","魏国集团","88.56");


-update class
set 
gender="女",
salary=66.33
where sname="李四";


-delete from class where salary>3000;

-delete from class where salary< 1000 and gender="女";

-select sname,salary from class;

-select sname,gender,company,salary from class where gender="女";

-select sname,salary from class where gender="男" and salary>2000;

-create table salary(
    -> sname varchar(20) not null default "",
    -> gongzi float(6,2)
    -> )engine myisam charset utf8;

-insert into salary values ("张三",-9999.99),("李四",9999.99);

//修改表结构，增加列
-alter table salary add bonus float(3,2) default 0.00;


-create table test (
    -> ca char(6) not null default "",
    -> vca varchar(6) not null default ""
    -> ) engine=innodb charset=utf8;

-insert into test 
values 
("aa ","aa ");


-select concat(ca,"!"),concat(vca,"!") from test;


-create table test3 (
    -> star varchar(20) not null default "",
    -> birth date not null default "0000-00-00"
    -> )engine myisam charset utf8;


-insert into test3 
values 
("张国荣","1961-03-12");

//修改表结构，增加列
-alter table test3 add sign time not null default 00:00:00;

-insert into test3
    -> (star,sign)
    -> values
    -> ("dd","19:10:45");


- desc test3;

- create table test4 (
    -> sname varchar(20) not null default "",
    -> logintime datetime not null default "0000-00-00 00:00:00"
    -> )engine myisam charset utf8;

-create table test5(
    -> ts timestamp default CURRENT_TIMESTAMP,
    -> id int
    -> )engine myisam charset utf8;

-insert into test5(id) values (1),(2),(3);

-select * from  test5;

//创建表
- create table member(
id int(10) unsigned primary key not null auto_increment,
username varchar(20) not null default "",
gender tinyint unsigned not  null default 0,
weight tinyint unsigned not null default 0,
birth date not null default "0000-00-00",
salary decimal(8,2) unsigned not null default 0.00,
lastlogintime datetime not null default "0000-00-00 00:00:00",
instro varchar(300) default ""
)engine=myisam charset=utf8;

-create table m1(
    -> id int unsigned auto_increment primary key
    -> )engine myisam charset utf8;

-insert into m1 values (1);

-select * from m1;

-alter table m1 add username char(20) not null default "";

-alter table m1 add birth date not null default "0000-00-00";

-alter table m1 add gender tinyint unsigned not null default 0 after username;

-alter table m1 add pid int unsigned not null default 0 first;

//删除列
-alter table m1 drop pid;

-alter table m1 modify birth timestamp not null default 0;

-alter table m1 change birth birthday timestamp not null default 0;

//创建表-反引号
- CREATE TABLE `goods` (
    ->   `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
    ->   `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
    ->   `goods_sn` varchar(60) NOT NULL DEFAULT '',
    ->   `goods_name` varchar(120) NOT NULL DEFAULT '',
    ->   `click_count` int(10) unsigned NOT NULL DEFAULT '0',
    ->   `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
    ->   `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
    ->   `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
    ->   `add_time` int(10) unsigned NOT NULL DEFAULT '0',
    ->   `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
    ->   `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
    ->   `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
    ->   PRIMARY KEY (`goods_id`)
    -> ) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-insert into test.goods
    -> select goods_id,cat_id,goods_sn,goods_name,click_count,goods_number,market_price,shop_pric
e,add_time,is_best,is_new,is_hot from gyshop.goods;

-select * from goods where goods_id=32;

-select goods_name from goods where cat_id!=3;

-select goods_name,cat_id from goods where cat_id!=3;

-select goods_name,cat_id from goods where cat_id<>3;

-select goods_name,shop_price from goods where shop_price>3000;

- select goods_name,shop_price from goods where shop_price<=100;

-select goods_name,cat_id from goods where cat_id in(4,11);

-等价于:select goods_name,cat_id from goods where cat_id=4 or cat_id=11;
-select goods_name,cat_id from goods where cat_id between 4 and 11;
- select goods_name,market_price from goods where market_price>=100 and market_price<=500;
- between ... and...包含边界值
-select goods_name,cat_id from goods where cat_id!=4 and cat_id!=11;
-select goods_name,cat_id from goods where cat_id not in(4,11);
-select goods_name,cat_id,shop_price from goods where (shop_price>=100 and shop_price<=300) or (shop_price>=2000 and shop_price<=500
0);
-select goods_name,cat_id,shop_price from goods where shop_price>=100 and shop_price<=300 or shop_price>=2000 and shop_price<=5000;
-select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and shop_price>1000 and shop_price< 3000 and click_count>5;
-select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and click_count>5 and (shop_price< 1000 or shop_price>3000);
-select goods_name,cat_id from goods where cat_id=1;
-select goods_name,shop_price from goods where goods_name like "诺基亚%";
- select goods_name,shop_price from goods where goods_name like "诺基亚E66%";
-%也能够匹配空值
- select goods_name,shop_price from goods where goods_name like "诺基亚___";
-select * from goods where 1<2;
-select * from goods where 1>2;
-select goods_id,goods_name,market_price-shop_price as descount from goods;
-select goods_id,goods_name,(market_price-shop_price) as descount from goods where (market_price-shop_price)>200;
-select goods_id,goods_name,(market_price-shop_price) as descount from goods having descount>200;
-create table mian(
    -> num tinyint
    -> );
-insert into mian values
    -> (3),(12),(15),(15),(23),(29),(34),(37),(32),(45),(48),(52);
- update mian set
    -> num=20 where num>=20 and num<=29;
-update mian set
    -> num=30 where num>=30 and num<=39;
-update mian set
    -> num=num-num%10 where num>=20 and num<=39;
-update mian set num=floor(num/10)*10 where num<=39 and num>=20;
-select goods_name,shop_price from goods order by shop_price desc limit 1;
-select max(shop_price) from goods ;
-select min(shop_price) from goods ;
-select min(goods_id) from goods;
-select count(*) from goods;
-select sum(goods_number) from goods;
-select avg(shop_price) from goods;
-select count(1) from goods;
-select count(goods_name) from goods;
-select count(*) from 表名, 查询的就是绝对的行数,哪怕某一行所有字段全为NULL,也计算在内.
而select count(列名) from 表名,
查询的是该列不为null的所有行的行数.
-select sum(goods_number) from goods where cat_id=3;
-select cat_id,sum(goods_number)as sum from goods group by cat_id;
- select goods_id,(market_price-shop_price) as discount from goods having discount>200;
-select goods_name,(goods_number*shop_price) as sum_money from  goods;
-select sum(shop_price*goods_number) from goods;
- select cat_id,sum(goods_number*shop_price) as sum_money from goods group by cat_id;
-select cat_id,sum(goods_number*shop_price) as sum_money from goods group by cat_id having sum_money>20000;
-select goods_name,(market_price-shop_price) as discount from goods having discount>200;
-select goods_name,(market_price-shop_price) as discount from goods where (market_price-shop_price)>200;
-  name char(20) not null default "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> )engine myisam charset utf8;
-insert into result
    -> values
    -> ("张三","数学",90),("张三","语文",80),("张三","地理",40),("李四","语文",55),("李四",
"政治",45),("王五","政治",30);
-select name,avg(score) from result group by name;
-select name,subject,score < 60 from result;
-select name,avg(score),sum(score<60) as cont from result group by name having cont>=2;
-select name,score,count(1) from result where score<60;
- select name,score,count(1) from result where score< 60 group by name;
select name,score,count(1) as g from result where score< 60 group by name having g>=2;
-select name,count(1) as g from result where score< 60 group by name having g>=2) as tmp;
-select goods_id,goods_name,add_time from goods order by add_time asc;
-select goods_name,add_time from goods order by add_time asc;
-select goods_id,goods_name,add_time,shop_price from goods order by add_time asc,shop_price desc;
- select goods_id,goods_name,cat_id,shop_price from goods where cat_id=4;
-select goods_id,goods_name,cat_id,shop_price from goods where cat_id=4 order by add_time asc;
-select goods_id,goods_name,cat_id from goods order by cat_id asc;
-select goods_id,goods_name,cat_id from goods order by cat_id asc,shop_price desc;
-select goods_id,goods_name,cat_id,shop_price from goods order by cat_id asc,shop_price desc limit 2,3;
-select max(goods_id),cat_id from goods group by cat_id;
-select goods_id,goods_name from goods where goods_id=(select max(goods_
id) from goods);
-select goods_id,goods_name,cat_id from goods where goods_id in(select m
ax(goods_id) from goods group by cat_id) order by cat_id;
-select goods_id ,goods_name ,cat_id from (select goods_id,goods_name,ca
t_id from goods order by cat_id asc,goods_id desc) as tmp group by cat_id;
-cat_id int auto_increment primary key,
    -> cat_name varchar(20) not null default ""
    -> )engine myisam charset utf8;
-insert into test.category
    -> select cat_id,cat_name from gyshop.category;
-select cat_id from category where exists (select * from goods where goo
ds.cat_id=category.cat_id);
- select goods_name,goods_number,shop_price from goods;
- select goods.goods_name,category.cat_name,goods.goods_number,goods.shop_price from goods,category where goods.cat_id=category.cat_id;
-select g.goods_id,g.goods_name,g.cat_id,c.cat_name from  goods as g left join category as c on g.cat_id=c.cat_id;
- select g.goods_id,g.goods_name,g.cat_id,c.cat_name from  goods as g left join category as c on g.cat_id=c.cat_id where g.cat_id=4;
-select g.goods_id,g.goods_name,g.cat_id,c.cat_name from category as c right join goods as g on g.cat_id=c.cat_id where g.cat_id=4;
-select g.goods_id,g.goods_name,g.cat_id,c.cat_name from category as c inner join goods as g on g.cat_id=c.cat_id;
-create table m(
    -> mid int,
    -> hid int,
    -> gid int,
    -> mres varchar(20),
    -> mtime date
    -> )engine myisam charset utf8;
-create table t(
    -> tid int,
    -> tname varchar(20)
    -> )engine myisam charset utf8;
-insert into m
    -> values
    -> (1,1,2,"2:0","2006-05-21"),(2,2,3,"1:2","2006-06-21"),(3,3,1,"2:5
","2006-06-25"),(4,2,1,"3:2","2006-07-21");
-insert into t
    -> values
    -> (1,"国安"),(2,"申花"),(3,"公益联队");
-select concat(hid," ",mres," ",gid," ",mtime) from m where mtime
between "2006-06-01" and "2006-07-1";
-select hid,mres,gid,mtime,tname from m left join t on hid=tid;
- select hid,mres,gid,mtime,tname from m left join t on gid=tid;
- select hid,mres,gid,mtime,t1.tname,t2.tname from m left join t as
 t1 on hid=t1.tid left join t as t2 on gid=t2.tid;
-select concat(t1.tname,"       ",t2.tname," ",mres," ",gid," ",mt
ime," ") from m left join t as t1 on hid=t1.tid left join t as t2 on gid
=t2.tid;
-select concat(t1.tname,"       ",t2.tname," ",mres," ",gid," ",mt
ime," ") from m left join t as t1 on hid=t1.tid left join t as t2 on gid
=t2.tid where mtime between "2006-06-01" and "2006-07-01";
-select goods_name,cat_id from goods where cat_id=3
    -> union
    -> select goods_name,cat_id from goods where cat_id in (4,5);
-select goods_id,goods_name,cat_id,shop_price from goods where sho
p_price< 1000
    -> union
    -> select goods_id,goods_name,cat_id,shop_price from goods where sho
p_price>4000;
- select goods_id,goods_name,cat_id,shop_price from goods where shop_price< 1000
    -> union
    -> select goods_name,cat_id,goods_id,shop_price from goods where shop_price<1000;
-select goods_name,cat_id,goods_id,shop_price from goods where shop_price< 1000 union select goods_name,cat_id,goods_id,shop_price from goods where shop_price >3000 order by shop_price;
-select goods_id,goods_name,cat_id,shop_price from goods where cat_id=3 union select goods_id,goods_name,cat_id,shop_price from goods where cat_id=5 order by shop_price;
-(select goods_id,goods_name,cat_id,shop_price from goods where cat_id=3 order by shop_price desc limit 3) union (select oods_id,goods_name,cat_id,shop_price from goods where cat_id=5 order by shop_price asc limit 2);
-(select goods_id,goods_name,cat_id,shop_price from goods where cat_id=3 order by shop_price desc limit 3) union (select oods_id,goods_name,cat_id,shop_price from goods where cat_id=5 order by shop_price asc limit 2) order by shop_price asc;
-select goods_name from goods
    -> union
    -> select goods_name from goods;
-select goods_name from goods
    -> union all
    -> select goods_name from goods;
-select floor(rand()*10+5);
- select ceiling(3.23);
-select concat(goods_id," ",goods_name)from goods;
-select ascii("A");
-select goods_name,if(shop_price>3000,"贵","便宜") from goods;
-create view goods4
    -> as
    -> select * from goods where cat_id=4;
- delete from goods4 where goods_id=1;
-select * from goods4;
-select * from goods where cat_id=4;
-create table goods_num(
    -> gid int,
    -> name varchar(20),
    -> num smallint
    -> );
-create table ord(
    -> oid int,
    -> gid int,
    -> much smallint
    -> );
-insert into goods_num values
    -> (1,"cat",34),(2,"dog",65),(3,"pig",21);
-delimiter $//换结束符;为$
- insert into ord values(123,1,2)$
-select * from goods_num$
-show triggers \G$
-create trigger t1
after insert on ord
for each row
begin
update goods_num set num=num-new.much where gid=new.gid;
end$
-insert into ord values (111,2,3)$
-select * from goods_num$
-create trigger t2
after delete on ord
for each row
begin
update goods_num set num=num+old.much where gid=old.gid;
end$
-delete from ord where oid=111$
-
-create trigger t3
before update on ord
for each row
begin
update goods_num set num=num+old.much-new.much where gid=old.gid;
end$
-update ord set much=2 where oid=110$
- select * from goods_num$
-create trigger t1
before insert on ord
for each row
begin
declare
rnum int;
select num into rnum from goods_num where gid=new.gid;
if new.much>rnum then
    set new.much=rnum;
end if;
update goods_num set num=num-new.much where gid=new.gid;
end$
-insert into ord values (111,3,25)$
-
-create procedure p1()
begin
select 2+3;
end$
-
-Create procedure name()
Begin
//sql代码
End

-Show procedure status$
-call p1()$
-show procedure status\G$
-create procedure p2()
begin
declare age tinyint default 18;
declare height tinyint default 180;
select concat("年龄是：",age,"身高是：",height);
end$
-call p2()$
-create procedure p3()
begin
declare age tinyint default 18;
declare height tinyint default 180;
set age:=age+20;
select concat("年龄是：",age,"身高是：",height);
end$
-show procedure status\G$
-create procedure p5(width int,height int)
begin
if width>height then
    select "较宽";
elseif width < height then
    select "较高";
else
    select "较方";
end if;
end$
-
-create procedure p6(width int,height int)
begin
if width>height then
    select "较宽";
elseif width < height then
    select "较高";
else
    select "较方";
end if;
select concat("你的面积是",width*height);
end$
-
-create procedure p7()
begin
    declare sum int default 0;
    declare num int default 0;
    while num<100 do
        set sum:=sum+num;
        set num:=num+1;
    end while;
    select sum;
end$
-
-create procedure p8(in n int)
begin
    declare sum int default 0;
    declare num int default 0;
    while num <= n do
        set sum:=sum+num;
        set num:=num+1;
    end while;
    select sum;
end$
-
-create procedure p9(in n int,out sum int)
begin
    declare num int default 0;
    set sum:=0;
    while num <= n do
        set sum:=sum+num;
        set num:=num+1;
    end while;
end$
-
-call p9(100,@sum)$
-select @sum$
-
-create procedure p10()
begin
    declare row_gid int;
    declare row_name varchar(20);
    declare row_cid int;
    declare getgoods cursor for
    select goods_id,goods_name,cat_id from goods;
    open getgoods;
    fetch getgoods into row_gid,row_name,row_cid;
    close getgoods;
    select row_gid,row_name,row_cid;
end$

-
-grant all on *.* to zhangsan@"localhost" identified by "111";
-mysql -hlocalhost -uzhangsan -p111
-select * from user where user="zhangsan" \G
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
