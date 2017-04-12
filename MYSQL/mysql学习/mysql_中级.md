pet表
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
| type    | varchar(20) | YES  |     | NULL    |       |
| remark  | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

-select species,count(*) from pet group by species;
-select sex,count(*) from pet group by sex;
-select species,sex,count(*) from pet group by species,sex;
-select species,sex from pet where species='dog' or species='cat' group by  species,sex;
-select species,sex,count(*) from pet where sex is not null group by species,sex;
-select pet1.name,pet1.sex,pet2.name,pet2.sex ,pet1.species
from
pet as pet1,pet as pet2
where pet1.species=pet2.species and pet1.sex='f'and pet2.sex='f';

-create table shop(
    -> article int(4) unsigned zerofill default '0000' not null,
    -> dealer char(20) default '' not null,
    -> price double(16,2) default '0.00' not null,
    -> primary key(article,dealer)
    -> );

-insert into shop values
(1,'A',3.45),
(1,'B',3.99),
(2,'A',10.99),
(3,'B',1.45),
(3,'C',1.69),
(3,'D',1.25),
(4,'D',19.95);

-select article,dealer,price from shop where price=(
    -> select max(price) from shop
    -> ) group by article;

-select article,dealer,price from shop s1 where price=(
    -> select max(s2.price) from shop s2 where s1.article=s2.article);

-select @max_price:=max(price) ,@min_price:=min(price) from shop;

-select article,dealer from shop where price=@max_price;

-select article,dealer from shop where price=@min_price;

-create table person(
    -> id smallint unsigned not null auto_increment,
    -> name char(60) not null,
    -> primary key(id)
    -> );

-create table shirt(
    -> id smallint unsigned not null auto_increment,
    -> style enum('t-shirt','polo','dress') not null,
    -> color enum('red','blue','orange','white','black') not null,
    -> owner smallint unsigned not null references person(id),
    -> primary key(id)
    -> );

-insert into person values (null,'antonio paz');

-select @last :=last_insert_id();

-insert into shirt values
    -> (null,'polo','blue',@last),
    -> (null,'dress','white',@last),
    -> (null,'t-shirt','blue',@last);
Query OK, 3 rows affected (0.07 sec)

-INSERT INTO person VALUES (NULL, 'Lilliana Angelovska');

- insert into shirt values
    -> (null,'dress','orange',@last),
    -> (null,'polo','red',@last),
    -> (null,'dress','blue',@last),
    -> (null,'t-shirt','white',@last);

-create table t1
    -> (year year(4),month int(2) unsigned zerofill,day int(2) unsigned zerofill);

-insert into t1 values(
    -> 2000,1,1),(2000,1,20),(2000,1,30),(2000,2,23),(2000,2,23);

-select year,month,bit_count(bit_or( 1 << day)) as days from t1 group by year month;

-select last_insert_id();

#explain查看查询情况
-explain select * from shop;
MariaDB [test]> explain select * from meta_data;
+------+-------------+-----------+------+---------------+------+---------+------+------+-------+
| id   | select_type | table     | type | possible_keys | key  | key_len | ref  | rows | Extra |
+------+-------------+-----------+------+---------------+------+---------+------+------+-------+
|    1 | SIMPLE      | meta_data | ALL  | NULL          | NULL | NULL    | NULL |    5 |       |
+------+-------------+-----------+------+---------------+------+---------+------+------+-------+
mark://===================20170412
