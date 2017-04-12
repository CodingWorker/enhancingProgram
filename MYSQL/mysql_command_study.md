##3.教程
函数:
verison()：返回当前使用的mysql服务器版本
current_date():返回当前日期-年-月-日
current_date:同current_date()
current_time():返回当前时间-hh:mm:ss
current_time:同current_time()
pi():返回圆周率
sin():正弦函数
now():当前时间-yyyy-MM-dd HH:mm:ss
user():当前用户

-select version();current_date;
+-----------------+
| version()       |
+-----------------+
| 10.1.10-MariaDB |
+-----------------+
1 row in set (0.07 sec)

MariaDB [(none)]> select current_time();
+----------------+
| current_time() |
+----------------+
| 18:45:17       |
+----------------+
1 row in set (0.00 sec)

MariaDB [(none)]> select sin(pi()/2);
+-------------+
| sin(pi()/2) |
+-------------+
|           1 |
+-------------+

MariaDB [(none)]> select now();
+---------------------+
| now()               |
+---------------------+
| 2017-04-11 18:48:24 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [(none)]> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.01 sec)

MariaDB [(none)]> select current_time;
+--------------+
| current_time |
+--------------+
| 18:50:44     |
+--------------+
1 row in set (0.00 sec)

-select
    -> user(),
    -> current_date;
-select * fr \c    #取消之前的输入

-select 'user
    '> \c
    '> '\c

#最好在查询字段或者创建字段的时候使用反引号``，这样可以防止mysql命令作为库名、表名或者
#字段名时语法错误
#而在为字段类型为字符串的字段赋值时使用单引号''
#查询的时候mysql的关键字应该使用大写形式

-show databases;
-use `test`;
-show tables;
-create database `menagerie` charset utf8;
#可以在创建表的时候使用=指明字符集
create database menagerie charset=utf8


-use menagerie;
-show tables;
-create table `pet` (
`name` varchar(20),
`owner` varchar(20),
`species` varchar(20),
`sex` char(1),
`birth` date,
`death` date);
-show tables;
-describe `pet`;  #同desc pet

-pet.txt文件中：Whistler    Gwen    bird    \N  1997-12-09  \N 
  命令行：load data local infile 'E:\mysql学习\pet.txt' into table pet;
-insert `pet`
values(
'Puffball','Diane','hamster','f','1999-03-30',null
);

- select * from `pet`;
-update `pet`
set
`birth`='1989-08-31'
where `name`='Bowser';

-select * from `pet` where `name`='Bowser';

-select * from `pet` where `birth` > '1998-1-1';
#可以在查询条件中直接使用字符串的时间格式，如'1998-1-1'


-select * from `pet` where `species`='dog' and `sex`='f';
-select * from `pet` where `species`='snake' or `species`='bird';
-select * from `pet`
where
(`species`='cat' and `sex`='m') or (`species`='dog'and `sex`='f');

#查询指定列不同的值
-select distinct `owner` from `pet`;

#精确匹配'='
- select `name`,`species`,`birth` from `pet` where
  -> `species`='dog' or `species`='cat;

SELECT * FROM meta_data ORDER BY `TimeModified` DESC;
-select `name`,`birth` from `pet` order by `birth`;
-select `name`,`birth` from `pet` order by `birth` DESC;
-select `name`,`species`,`birth` from `pet` order by `species`,`birth` desc;

#year函数返回时间格式之中的年
#month函数返回时间格式之中的月
#day函数返回时间格式中的天
#hour函数返回时
#minute函数返回分钟
#second函数返回秒
select year('2010-01-01');
select month('20100101');
select day('2010/01/01');
select hour(now());
select minute(now());
select second(now());

#right函数返回参数指定右边个数的字符
select right('advanced');

#相对应的有left函数
select left('advanced',2);

#as重命名搜索结果列
-select `name`,`birth`,curdate(),(year(curdate())-year(birth))-(right(curda
te(),5) < right(birth,5)) as `age` from `pet`;

-select `name`,`birth`,curdate(),(year(curdate())-year(birth))-(right(curda
te(),5)< right(birth,5)) as `age` from `pet` order by `name`;

#判断null使用is null 或者is not null
-select 1=null,1<>null,1<null,1>null;
-select 1 is null,1 is not null;
-select 0 is null,0 is not null,'' is null,'' is not null;

-select `name`,`birth`,`death`,(year(curdate())-year(birth))-(right(curdate()
,5)< right(birth,5))as `age` from `pet` where `death` is not null order by `age`;

-select name,birth from pet where month(birth)=month(date_add(curdate()
,interval 1 month));
-select `name`,`birth` from `pet` where month(`birth`)=mod(month(`birth`),12)+1;


#like匹配，_单个字符匹配，regexp正则匹配
#like匹配前缀明确的时候可以使用索引
-select * from `pet` where `name` like 'b%';
-select * from `pet` where `name` like '%fy';

#下面的查询不能使用索引
-select * from `pet` where `name` like '%w%';

#正则匹配
- select * from `pet` where `name` like '_____';
-select * from pet where name regexp '^b';
-select * from pet where name regexp binary '^b';
-select * from pet where name regexp 'fy$';
-select * from pet where name regexp 'w';
-select * from pet where name regexp '^.....$';
-select * from pet where name regexp '^.{5}$';

-select count(*) from pet;
-select owner,count(*) from pet group by owner;
-select species,count(*) from pet group by species;
-select sex,count(*) from pet group by sex;
-select species,sex,count(*) from pet group by species,sex;
- select species,sex,count(*) from pet where species="dog" or species="c
at" group by species,sex;
- select species,sex,count(*) from pet where sex is not null group by sp
ecies,sex;
-create table `event` (
`name` varchar(20),`date` date,`type` varchar(15),`remark` varchar(255)
 );

-alter table `pet` add `type` varchar(20);
-alter table `pet` add `remark` varchar(50);
-update `pet`
set `type`='litter',
`remark`='5 puppies,2 female,3 male'
where `name`='Buffy';

-desc event;
-SELECT pet.name,
    -> (YEAR(date)-YEAR(birth)) - (RIGHT(date,5)<RIGHT(birth,5)) AS age,
    -> remark
    -> FROM pet, event
    -> WHERE pet.name = event.name AND event.type = 'litter';

-select p1.name,p1.sex,p2.name,p2.sex,p1.species from pet as p1,pet as p2 whe
re p1.species=p2.species and p1.sex='f' and p2.sex='m';

#返回当前数据库
-select database();


-create table `shop`(
`article` int(4) unsigned zerofill default '0000' not null,
`dealer` char(20) default '' not null,
`price` double(16,2) default '0.00' not null,
primary key(article,dealer)
);

-insert into shop values(1,'A',3.45);
-INSERT INTO SHOP VALUES(1,'B',3.99);
-INSERT INTO SHOP VALUES(4,'D',19.95);

-SELECT * FROM SHOP;

#max函数
#min函数
-select max(article) as article from shop;
- select article,dealer,price from shop
where price=(select max(price) from shop);

-select `article`,`dealer`,`price` from `shop` order by `price` desc limit 1;
-select `article`,max(`price`) as `price` from `shop` group by `article`;

-select `article`,`dealer`,`price`
from `shop` s1
where `price`=(
select max(`price`)
from `shop` s2
where s1.`article`=s2.`article`
);

#定义变量并为变量赋值
-select @min_price:=min(price),@max_price:=max(price) from shop;
- select * from shop where price=@min_price or price=@max_price;
-select @min_price;
-select @max_price;

#定义一个变量age并为其赋值为'aa'
MariaDB [test]> select @age:='aa';
+------------+
| @age:='aa' |
+------------+
| aa         |
+------------+
1 row in set (0.01 sec)

MariaDB [test]> select @age;
+------+
| @age |
+------+
| aa   |
+------+
1 row in set (0.00 sec)

#查询语句中使用变量
MariaDB [test]> select * from meta_data where Name=@age;
+----+------+-----+---------------------+---------------------+
| Id | Name | Url | TimeCreated         | TimeModified        |
+----+------+-----+---------------------+---------------------+
|  1 | aa   | aa  | 2017-04-11 15:40:20 | 2017-04-11 15:40:20 |
+----+------+-----+---------------------+---------------------+
1 row in set (0.07 sec)

MariaDB [test]> select @Name:=min(Name) from meta_data;
+------------------+
| @Name:=min(Name) |
+------------------+
| aa               |
+------------------+
1 row in set (0.02 sec)

MariaDB [test]> select @Name;
+-------+
| @Name |
+-------+
| aa    |
+-------+
1 row in set (0.00 sec)


-create table `person`(
`id` smallint unsigned not null auto_increment,
`name` char(60) not null,
primary key(id)
);

#enum类似枚举，在创建表的时候可限制该字段的可能取值范围
#references 可以指定字段的外键
#last_insert_id()获取最近插入项的identifiable值
#mysql的赋值符号时:=
#'=’在mysql中只表达相等
-create table `shirt`(
`id` smallint unsigned not null auto_increment,
`style` enum('t-shirt','polo','dress') not null,
`color` enum('red','blue','orange','white','black') not null,
`owner` smallint unsigned not null references person(`id`),
primary key(`id`)
);

#null可以在插入表数据的时候被记录标志列忽略，如id对应的值为null时id并不会为null而会自动增加
- insert into `person`
values(
null,'Antonio Paz'
);

-select @last:=last_insert_id();
- select @last;
-insert into `shirt` values(null,'polo','blue',@last);

-insert into `shirt`
values
(null,'dress','white',@last),
(null,'t-shirt','blue',@last);

- insert into `person`
values
(null,'Lilliana Angelovska');

-select @last:=last_insert_id();
-insert into `shirt`
values
(null,'dress','orange',@last),
(null,'polo','red',@last),
(null,'dress','blue',@last),
(null,'t-shirt','white',@last);

-select * from `person`;
-select * from `shirt`;
-select s.* from `person` p,`shirt` s where p.name like 'Lilliana%' and s.ow
ner=p.id and s.color<>'white';
-show create table shirt\G
-SELECT field1_index, field2_index FROM test_table
WHERE
field1_index = '1' OR  field2_index = '1';

#union:查询结果合并，删除重复
#union all：查询结果合并，不删除重复
-SELECT field1_index, field2_index
    FROM test_table WHERE field1_index = '1'
UNION
SELECT field1_index, field2_index
    FROM test_table WHERE field2_index = '1';


-create table `t1` (
`year` year(4),
`month` int(2) unsigned zerofill,
`day` int(2) unsigned zerofill
);

-select `year`,`month`,bit_count(bit_or(1<<day)) as days from t1 group by year,month;

-create table animals(
    -> id mediumint not null auto_increment,
    -> name char(30) not null,
    -> primary key(id)
    -> );

-insert into animals(name) values
    -> ('dog'),('cat'),('penguin'),('lax'),('whale'),('ostrich');

-select * from animals;
-ALTER TABLE tbl AUTO_INCREMENT = 100;


###w3school
-delete from animals where name='ostrich';
-delete from animals;
-delete * from animals;
-select * from persons limit 5;
-select * from persons where city like 'n%';
-select * from persons where city like '%n';
-select * from persons where city like '%n%';
-select * from persons where lastname like 'c_r_er';
-select * from persons where city like '[aof]%';
-select * from persons where city like '[^aof]%';
-select * from persons where lastname in ('adams',''carter);
-select * from persons where lastname between 'adams' and 'carter';
-select * from persons where lastname not between 'adams' and 'carter';
-select last_name_str as lns from persons;
-selec * from first_name_big_lag as fnbl;
-select po.orderid,p.lastname,p.firstname from persons as p,product_orders as po where p.lastname='adams' and p.firstname='john';
-select lastname as family,firstname as name from persons;
-select persons.lastname,persons.firstname,orders.orderno from persons,orders where persons.id_p=orders.id_p;
-select persons.lastname,persons.firstname,orders.orderno from persons inner join orders on person.id_p=orders.id_p order by persons.lastname;
-select persons.lastname,persons.firstname,orders.orderno from persons inner join orders o
n persons.id_p=orders.id_p;
-select persons.lastname,persons.firstname,orders.orderno from persons left join orders on persons.id_p=orders.id_p;
-select persons.lastname,persons.firstname,orders.orderno from persons right join orders on persons.id_p=orders.id_p;
-select persons.lastname,persons.firstname,orders.orderno from persons left join orders on persons.id_p=orders.id_p
    -> union
    ->  select persons.lastname,persons.firstname,orders.orderno from persons right join orders on persons.id_p=orders.id_p;
-select persons.lastname,persons.firstname,orders.orderno from persons left join orders on persons.id_p=orders.id_p
    -> union all
    ->  select persons.lastname,persons.firstname,orders.orderno from persons right join orders on persons.id_p=orders.id_p;
-select e_name from employees_china union all select e_name from employees_usa;
-create database my_db;
-create table personss (id_p int,lastname varchar(255),firstname varchar(255),
address varchar(255),city varchar(255));
-NOT NULL 约束强制列不接受 NULL 值。这意味着，如果不向字段添加值，就无法插入新纪录或者更新记录。
-create table personss (id_p int not null,lastname varchar(255) not null,first
name varchar(255),address varchar(255),city varchar(255));
-UNIQUE 约束唯一标识数据库表中的每条记录。和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证。
PRIMARY KEY 拥有自动定义的 UNIQUE 约束。每个表可以有多个 UNIQUE 约束，但是每个表只能有一个 PRIMARY KEY 约束。
-drop table personss;
-drop database dd;
- create table personss (id_p int not null,lastname varchar(255) not null,first
name varchar(255),address varchar(255),city varchar(255),unique(id_p));
-create table personss (id_p int not null,lastname varchar(255) not null,first
name varchar(255),address varchar(255),city varchar(255),constraint uc_personid unique(id_p,lastname));
-alter table personss drop index uc_personid;
- alter table personss add unique index (firstname);
-PRIMARY KEY 约束唯一标识数据库表中的每条记录。主键列不能包含 NULL 值。每个表应该都一个主键，并且每个表只能有一个主键
- create table personss (id_p int not null,lastname varchar(255),firstname varc
har(255),address varchar(255),city varchar(255),primary key (id_p));
-alter table personss add primary key (id_p);
-alter table personss drop primary key;

-个表中的 FOREIGN KEY 指向另一个表中的 PRIMARY KEY。
-create table orderss (id_o int not null,orderno int not null,id_p
int,primary key (id_o),foreign key (id_p) references personss(id_p));
-alter table orderss add primary key(id_o);
-ALTER TABLE Orders ADD CONSTRAINT fk_PerOrders FOREIGN KEY (Id_P) REFERENCES Persons(Id_P)
-ALTER TABLE Orders DROP FOREIGN KEY fk_PerOrders

-DEFAULT 约束用于向列中插入默认值。如果没有规定其他的值，那么会将默认值添加到所有的新纪录。
-create table personss(id_p int not null primary key,lastname varchar(255) not null,city varchar(255) default 'sandnes');
- alter table personss alter city set default 'new york';
-alter table personss alter city drop default;
-CREATE INDEX 语句用于在表中创建索引。
在不读取整个表的情况下，索引使数据库应用程序可以更快地查找数据。您可以在表中创建索引，以便更加快速高效地查询数据。
用户无法看到索引，它们只能被用来加速搜索/查询 更新一个包含索引的表需要比更新一个没有索引的表更多的时间，
这是由于索引本身也需要更新。因此，理想的做法是仅仅在常常被搜索的列（以及表）上面创建索引。
- create index index_name on personss(city);
-create unique index index_name1 on personss(lastname);
-create index on personss (city,lastname);
-create index on personss (city desc)
-通过使用 DROP 语句，可以轻松地删除索引、表和数据库。
-drop index index_name on personss;
- drop index index_name1 on personss;
-alter table personss drop index index_name;
-drop table personss;
-create database qq;
-drop database qq;
-ALTER TABLE 语句用于在已有的表中添加、修改或删除列。
-alter table person add age int;
-alter table person drop column age;
-alter table person modify name varchar(20);
-alter table person change name new_name int;
-在 SQL 中，视图是基于 SQL 语句的结果集的可视化的表。视图总是显示最近的数据。每当用户查询视图时，
数据库引擎通过使用 SQL 语句来重建数据

-create view person_view as
    -> select * from person;
-select * from person_view;
-DROP VIEW view_name
-内建Date处理函数
-select now();
-select curdate();
-select curtime();
-select date('20160501');
-select date('2016-05-01');
- select date('2016-05-01 12:00:00');
-select extract(second from '2016-05-01');
-select date_add('2016-05-01',interval 1 day);
-select date_add('2016-05-01',interval 1 month);
-select date_sub('2016-05-02',interval 1 day);
-select datediff('2016-05-10','2016-05-01');
-select datediff('2016-05-10','2016-05-01') date_dalta;
-select date_format(now(),'%b %d %y %h:%i %p');
-select date_format(now(),'%b-%d-%y');
-select date_format(now(),'%b/%d/%y');

-无法使用比较运算符来测试 NULL 值，比如 =, <, 或者 <>,我们必须使用 IS NULL 和 IS NOT NULL 操作符。
-select * from pet where death is not null;
-select * from pet where remark is null;
-SELECT ProductName,UnitPrice*(UnitsInStock+IFNULL(UnitsOnOrder,0))
FROM Products
-SELECT ProductName,UnitPrice*(UnitsInStock+COALESCE(UnitsOnOrder,0))
FROM Products

-MySQL 数据类型 在 MySQL 中，有三种主要的类型：文本、数字和日期/时间类型。
-text类型 char() varchar() tinytext  text blob mediumtext mediumblob longtext  longblob  enum(x,y,z,etc) set
-number类型
-tinyint() smallint() mediumint() int() bigint() float() doube() decimal()
-Date类型
-dae() datetime() timestamp() time() year()
-SQL函数
-SELECT Customer,SUM(OrderPrice) FROM Orders GROUP BY Customer

-在 SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与合计函数一起使用。
-SELECT Customer,SUM(OrderPrice) FROM Orders GROUP BY Customer HAVING SUM(OrderPrice)<2000
-SELECT Customer,SUM(OrderPrice) FROM Orders WHERE Customer='Bush' OR Customer='Adams' GROUP BY Customer HAVING SUM(OrderPrice)>1500
-SELECT MID(City,1,3) as SmallCity FROM Persons
-SELECT LEN(column_name) FROM table_name
-SELECT ROUND(column_name,decimals) FROM table_name
-SELECT ProductName, UnitPrice, FORMAT(FORMAT(),'YYYY-MM-DD') as PerDate
FROM Products
