mysql> show tables;
+---------------+
| Tables_in_gy1 |
+---------------+
| class         |
| salary        |
| stu           |
| test          |
+---------------+
4 rows in set (0.00 sec)

mysql> create table test3 (
    -> star varchar(20) not null default "",
    -> birth date not null default "0000-00-00"
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.10 sec)

mysql> desc test3;
+-------+-------------+------+-----+------------+-------+
| Field | Type        | Null | Key | Default    | Extra |
+-------+-------------+------+-----+------------+-------+
| star  | varchar(20) | NO   |     |            |       |
| birth | date        | NO   |     | 0000-00-00 |       |
+-------+-------------+------+-----+------------+-------+
2 rows in set (0.02 sec)

mysql> insert into test3 ("张国荣","1961-03-12");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"张国荣","1961-03-12")' at line 1
mysql> insert into test3 values ("张国荣","1961-03-12");
Query OK, 1 row affected (0.00 sec)

mysql> select * from test3;
+--------+------------+
| star   | birth      |
+--------+------------+
| 张国荣 | 1961-03-12 |
+--------+------------+
1 row in set (0.00 sec)

mysql> alter table test3 add sign time not null default 00:00:00;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':00:00' at line 1
mysql> alter table test3 add sign time not null default "00:00:00";
Query OK, 1 row affected (0.09 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc test3;
+-------+-------------+------+-----+------------+-------+
| Field | Type        | Null | Key | Default    | Extra |
+-------+-------------+------+-----+------------+-------+
| star  | varchar(20) | NO   |     |            |       |
| birth | date        | NO   |     | 0000-00-00 |       |
| sign  | time        | NO   |     | 00:00:00   |       |
+-------+-------------+------+-----+------------+-------+
3 rows in set (0.02 sec)

mysql> insert into test3
    -> (star,sign)
    -> values
    -> ("dd","19:10:45");
Query OK, 1 row affected (0.00 sec)

mysql> select * from test3;
+--------+------------+----------+
| star   | birth      | sign     |
+--------+------------+----------+
| 张国荣 | 1961-03-12 | 00:00:00 |
| dd     | 0000-00-00 | 19:10:45 |
+--------+------------+----------+
2 rows in set (0.00 sec)

mysql> create table test4 (
    -> sname varchar(20) not null default "",
    -> logintime datetime not null default "0000-00-00 00:00:00"
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.09 sec)

mysql> insert into test4
    -> values
    -> ("张三","2009-10-12 15:34:45");
Query OK, 1 row affected (0.00 sec)

mysql> select * from test4;
+-------+---------------------+
| sname | logintime           |
+-------+---------------------+
| 张三  | 2009-10-12 15:34:45 |
+-------+---------------------+
1 row in set (0.00 sec)

mysql> create table test5(
    -> ts timestamp default CURRENT_TIMESTAMP,
    -> id int
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.09 sec)

mysql> insert into test5
    -> values
    -> (nu\c
mysql> insert into test5(id) values (1),(2),(3);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from  test5;
+---------------------+------+
| ts                  | id   |
+---------------------+------+
| 2016-05-31 13:19:31 |    1 |
| 2016-05-31 13:19:31 |    2 |
| 2016-05-31 13:19:31 |    3 |
+---------------------+------+
3 rows in set (0.00 sec)

mysql> insert into test5(id) values(4);
Query OK, 1 row affected (0.00 sec)

mysql> select * from test5;
+---------------------+------+
| ts                  | id   |
+---------------------+------+
| 2016-05-31 13:19:31 |    1 |
| 2016-05-31 13:19:31 |    2 |
| 2016-05-31 13:19:31 |    3 |
| 2016-05-31 13:20:46 |    4 |
+---------------------+------+
4 rows in set (0.00 sec)

mysql> create member(
    -> id int(10) primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint not  null default "",
    -> weight tinyint not null default 、c、c\c
mysql> create member(
    -> id int(10) primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint not  null default 0,
    -> weight tinyint not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary smallint not null default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'member(
id int(10) primary key not null auto_increment,
username varchar(20) not' at line 1
mysql> create table member(
    ->     -> id int(10) primary key not null auto_increment,
    ->     -> username varchar(20) not null default "",
    ->     -> gender tinyint not  null default 0,
    ->     -> weight tinyint not null default 0,
    ->     -> birth date not null default "0000-00-00",
    ->     -> salary smallint not null default 0,
    ->     -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    ->     -> instro varchar(300) default ""
    ->     -> )engine myisam charset utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> id int(10) primary key not null auto_increment,
    -> username varchar(20) n' at line 2
mysql> create table member(
    -> id int(10) primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint not  null default 0,
    -> weight tinyint not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary smallint not null default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.11 sec)

mysql> desc member;
+---------------+--------------+------+-----+---------------------+----------------+
| Field         | Type         | Null | Key | Default             | Extra          |
+---------------+--------------+------+-----+---------------------+----------------+
| id            | int(10)      | NO   | PRI | NULL                | auto_increment |
| username      | varchar(20)  | NO   |     |                     |                |
| gender        | tinyint(4)   | NO   |     | 0                   |                |
| weight        | tinyint(4)   | NO   |     | 0                   |                |
| birth         | date         | NO   |     | 0000-00-00          |                |
| salary        | smallint(6)  | NO   |     | 0                   |                |
| lastlogintime | datetime     | NO   |     | 0000-00-00 00:00:00 |                |
| instro        | varchar(300) | YES  |     |                     |                |
+---------------+--------------+------+-----+---------------------+----------------+
8 rows in set (0.15 sec)

mysql> desc member;
+---------------+--------------+------+-----+---------------------+----------------+
| Field         | Type         | Null | Key | Default             | Extra          |
+---------------+--------------+------+-----+---------------------+----------------+
| id            | int(10)      | NO   | PRI | NULL                | auto_increment |
| username      | varchar(20)  | NO   |     |                     |                |
| gender        | tinyint(4)   | NO   |     | 0                   |                |
| weight        | tinyint(4)   | NO   |     | 0                   |                |
| birth         | date         | NO   |     | 0000-00-00          |                |
| salary        | smallint(6)  | NO   |     | 0                   |                |
| lastlogintime | datetime     | NO   |     | 0000-00-00 00:00:00 |                |
| instro        | varchar(300) | YES  |     |                     |                |
+---------------+--------------+------+-----+---------------------+----------------+
8 rows in set (0.05 sec)

mysql> drop table member;
Query OK, 0 rows affected (0.00 sec)

mysql> show member;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'member' at line 1
mysql> create table member(
    -> id int(10) unsigned primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint unsigned not  null default 0,
    -> weight tinyint unsigned not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary smallint not unsignednull default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsignednull default 0,
lastlogintime datetime not null default "0000-00-00 00:0' at line 7
mysql> create table member(
    -> id int(10) unsigned primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint unsigned not  null default 0,
    -> weight tinyint unsigned not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary smallint not unsigned null default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsigned null default 0,
lastlogintime datetime not null default "0000-00-00 00:' at line 7
mysql> create table member(
    -> id int(10) unsigned primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint unsigned not  null default 0,
    -> weight tinyint unsigned not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary smallint unsigned not null default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.10 sec)

mysql> desc member;
+---------------+----------------------+------+-----+---------------------+----------------+
| Field         | Type                 | Null | Key | Default             | Extra          |
+---------------+----------------------+------+-----+---------------------+----------------+
| id            | int(10) unsigned     | NO   | PRI | NULL                | auto_increment |
| username      | varchar(20)          | NO   |     |                     |                |
| gender        | tinyint(3) unsigned  | NO   |     | 0                   |                |
| weight        | tinyint(3) unsigned  | NO   |     | 0                   |                |
| birth         | date                 | NO   |     | 0000-00-00          |                |
| salary        | smallint(5) unsigned | NO   |     | 0                   |                |
| lastlogintime | datetime             | NO   |     | 0000-00-00 00:00:00 |                |
| instro        | varchar(300)         | YES  |     |                     |                |
+---------------+----------------------+------+-----+---------------------+----------------+
8 rows in set (0.02 sec)

mysql> desc member;
+---------------+----------------------+------+-----+---------------------+----------------+
| Field         | Type                 | Null | Key | Default             | Extra          |
+---------------+----------------------+------+-----+---------------------+----------------+
| id            | int(10) unsigned     | NO   | PRI | NULL                | auto_increment |
| username      | varchar(20)          | NO   |     |                     |                |
| gender        | tinyint(3) unsigned  | NO   |     | 0                   |                |
| weight        | tinyint(3) unsigned  | NO   |     | 0                   |                |
| birth         | date                 | NO   |     | 0000-00-00          |                |
| salary        | smallint(5) unsigned | NO   |     | 0                   |                |
| lastlogintime | datetime             | NO   |     | 0000-00-00 00:00:00 |                |
| instro        | varchar(300)         | YES  |     |                     |                |
+---------------+----------------------+------+-----+---------------------+----------------+
8 rows in set (0.02 sec)

mysql> drop table member;
Query OK, 0 rows affected (0.00 sec)

mysql> create table member(
    -> id int(10) unsigned primary key not null auto_increment,
    -> username varchar(20) not null default "",
    -> gender tinyint unsigned not  null default 0,
    -> weight tinyint unsigned not null default 0,
    -> birth date not null default "0000-00-00",
    -> salary decimal(8,2) unsigned not null default 0,
    -> lastlogintime datetime not null default "0000-00-00 00:00:00",
    -> instro varchar(300) default ""
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.06 sec)

mysql> desc member;
+---------------+-----------------------+------+-----+---------------------+----------------+
| Field         | Type                  | Null | Key | Default             | Extra          |
+---------------+-----------------------+------+-----+---------------------+----------------+
| id            | int(10) unsigned      | NO   | PRI | NULL                | auto_increment |
| username      | varchar(20)           | NO   |     |                     |                |
| gender        | tinyint(3) unsigned   | NO   |     | 0                   |                |
| weight        | tinyint(3) unsigned   | NO   |     | 0                   |                |
| birth         | date                  | NO   |     | 0000-00-00          |                |
| salary        | decimal(8,2) unsigned | NO   |     | 0.00                |                |
| lastlogintime | datetime              | NO   |     | 0000-00-00 00:00:00 |                |
| instro        | varchar(300)          | YES  |     |                     |                |
+---------------+-----------------------+------+-----+---------------------+----------------+
8 rows in set (0.05 sec)

mysql> create table m1(
    -> id int unsigned auto_increment primary key
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.12 sec)

mysql> insert into m1 values (1);
Query OK, 1 row affected (0.00 sec)

mysql> select * from m1;
+----+
| id |
+----+
|  1 |
+----+
1 row in set (0.00 sec)

mysql> alter table m1 add username char(20) not null default "";
Query OK, 1 row affected (0.09 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+------------------+------+-----+---------+----------------+
| Field    | Type             | Null | Key | Default | Extra          |
+----------+------------------+------+-----+---------+----------------+
| id       | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| username | char(20)         | NO   |     |         |                |
+----------+------------------+------+-----+---------+----------------+
2 rows in set (0.03 sec)

mysql> alter table m1 add birth date not null default "0000-00-00";
Query OK, 1 row affected (0.07 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+------------------+------+-----+------------+----------------+
| Field    | Type             | Null | Key | Default    | Extra          |
+----------+------------------+------+-----+------------+----------------+
| id       | int(10) unsigned | NO   | PRI | NULL       | auto_increment |
| username | char(20)         | NO   |     |            |                |
| birth    | date             | NO   |     | 0000-00-00 |                |
+----------+------------------+------+-----+------------+----------------+
3 rows in set (0.04 sec)

mysql> alter table m1 gender tinyint unsigned not null default 0 after username;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'gender tinyint unsigned not null default 0 after username' at line 1
mysql> alter table m1 add gender tinyint unsigned not null default 0 after username;
Query OK, 1 row affected (0.11 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+---------------------+------+-----+------------+----------------+
| Field    | Type                | Null | Key | Default    | Extra          |
+----------+---------------------+------+-----+------------+----------------+
| id       | int(10) unsigned    | NO   | PRI | NULL       | auto_increment |
| username | char(20)            | NO   |     |            |                |
| gender   | tinyint(3) unsigned | NO   |     | 0          |                |
| birth    | date                | NO   |     | 0000-00-00 |                |
+----------+---------------------+------+-----+------------+----------------+
4 rows in set (0.04 sec)

mysql> alter table m1 add pid int unsigned not null default 0 first;
Query OK, 1 row affected (0.17 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+---------------------+------+-----+------------+----------------+
| Field    | Type                | Null | Key | Default    | Extra          |
+----------+---------------------+------+-----+------------+----------------+
| pid      | int(10) unsigned    | NO   |     | 0          |                |
| id       | int(10) unsigned    | NO   | PRI | NULL       | auto_increment |
| username | char(20)            | NO   |     |            |                |
| gender   | tinyint(3) unsigned | NO   |     | 0          |                |
| birth    | date                | NO   |     | 0000-00-00 |                |
+----------+---------------------+------+-----+------------+----------------+
5 rows in set (0.05 sec)

mysql> alter table m1 drop pid;
Query OK, 1 row affected (0.07 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+---------------------+------+-----+------------+----------------+
| Field    | Type                | Null | Key | Default    | Extra          |
+----------+---------------------+------+-----+------------+----------------+
| id       | int(10) unsigned    | NO   | PRI | NULL       | auto_increment |
| username | char(20)            | NO   |     |            |                |
| gender   | tinyint(3) unsigned | NO   |     | 0          |                |
| birth    | date                | NO   |     | 0000-00-00 |                |
+----------+---------------------+------+-----+------------+----------------+
4 rows in set (0.02 sec)

mysql> alter table m1 modify birth timestamp not null default 0;
Query OK, 1 row affected (0.09 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+---------------------+------+-----+---------------------+----------------+
| Field    | Type                | Null | Key | Default             | Extra          |
+----------+---------------------+------+-----+---------------------+----------------+
| id       | int(10) unsigned    | NO   | PRI | NULL                | auto_increment |
| username | char(20)            | NO   |     |                     |                |
| gender   | tinyint(3) unsigned | NO   |     | 0                   |                |
| birth    | timestamp           | NO   |     | 0000-00-00 00:00:00 |                |
+----------+---------------------+------+-----+---------------------+----------------+
4 rows in set (0.02 sec)

mysql> desc m1;
+----------+---------------------+------+-----+---------------------+----------------+
| Field    | Type                | Null | Key | Default             | Extra          |
+----------+---------------------+------+-----+---------------------+----------------+
| id       | int(10) unsigned    | NO   | PRI | NULL                | auto_increment |
| username | char(20)            | NO   |     |                     |                |
| gender   | tinyint(3) unsigned | NO   |     | 0                   |                |
| birth    | timestamp           | NO   |     | 0000-00-00 00:00:00 |                |
+----------+---------------------+------+-----+---------------------+----------------+
4 rows in set (0.02 sec)

mysql> alter table m1 change birth birthday timestamp not null default 0'
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''
'' at line 1
mysql> alter table m1 change birth birthday timestamp not null default 0;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc m1;
+----------+---------------------+------+-----+---------------------+----------------+
| Field    | Type                | Null | Key | Default             | Extra          |
+----------+---------------------+------+-----+---------------------+----------------+
| id       | int(10) unsigned    | NO   | PRI | NULL                | auto_increment |
| username | char(20)            | NO   |     |                     |                |
| gender   | tinyint(3) unsigned | NO   |     | 0                   |                |
| birthday | timestamp           | NO   |     | 0000-00-00 00:00:00 |                |
+----------+---------------------+------+-----+---------------------+----------------+
4 rows in set (0.05 sec)

mysql> 
mysql> show databases;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    1
Current database: gy1

+--------------------+
| Database           |
+--------------------+
| information_schema |
| a112               |
| blog               |
| edu                |
| file               |
| gy1                |
| gyshop             |
| hd                 |
| menagerie          |
| myblog             |
| mysql              |
| performance_schema |
| t                  |
| t1                 |
| test               |
| u                  |
| webclass           |
| wenda              |
| wish               |
| y                  |
+--------------------+
20 rows in set (0.09 sec)

mysql> use shop;
ERROR 1049 (42000): Unknown database 'shop'
mysql> use gyshop;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_gyshop    |
+---------------------+
| account_log         |
| ad                  |
| ad_custom           |
| ad_position         |
| admin_action        |
| admin_log           |
| admin_message       |
| admin_user          |
| adsense             |
| affiliate_log       |
| agency              |
| area_region         |
| article             |
| article_cat         |
| attribute           |
| auction_log         |
| auto_manage         |
| back_goods          |
| back_order          |
| bonus_type          |
| booking_goods       |
| brand               |
| card                |
| cart                |
| cat_recommend       |
| category            |
| collect_goods       |
| comment             |
| crons               |
| delivery_goods      |
| delivery_order      |
| email_list          |
| email_sendlist      |
| error_log           |
| exchange_goods      |
| favourable_activity |
| feedback            |
| friend_link         |
| goods               |
| goods_activity      |
| goods_article       |
| goods_attr          |
| goods_cat           |
| goods_gallery       |
| goods_type          |
| group_goods         |
| keywords            |
| link_goods          |
| mail_templates      |
| member_price        |
| nav                 |
| order_action        |
| order_goods         |
| order_info          |
| pack                |
| package_goods       |
| pay_log             |
| payment             |
| plugins             |
| products            |
| reg_extend_info     |
| reg_fields          |
| region              |
| role                |
| searchengine        |
| sessions            |
| sessions_data       |
| shipping            |
| shipping_area       |
| shop_config         |
| snatch_log          |
| stats               |
| suppliers           |
| tag                 |
| template            |
| topic               |
| user_account        |
| user_address        |
| user_bonus          |
| user_feed           |
| user_rank           |
| users               |
| virtual_card        |
| volume_price        |
| vote                |
| vote_log            |
| vote_option         |
| wholesale           |
+---------------------+
88 rows in set (0.15 sec)

mysql> desc good;
ERROR 1146 (42S02): Table 'gyshop.good' doesn't exist
mysql> desc goods;
+--------------------+------------------------+------+-----+---------+----------------+
| Field              | Type                   | Null | Key | Default | Extra          |
+--------------------+------------------------+------+-----+---------+----------------+
| goods_id           | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| cat_id             | smallint(5) unsigned   | NO   | MUL | 0       |                |
| goods_sn           | varchar(60)            | NO   | MUL |         |                |
| goods_name         | varchar(120)           | NO   |     |         |                |
| goods_name_style   | varchar(60)            | NO   |     | +       |                |
| click_count        | int(10) unsigned       | NO   |     | 0       |                |
| brand_id           | smallint(5) unsigned   | NO   | MUL | 0       |                |
| provider_name      | varchar(100)           | NO   |     |         |                |
| goods_number       | smallint(5) unsigned   | NO   | MUL | 0       |                |
| goods_weight       | decimal(10,3) unsigned | NO   | MUL | 0.000   |                |
| market_price       | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| shop_price         | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| promote_price      | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| promote_start_date | int(11) unsigned       | NO   | MUL | 0       |                |
| promote_end_date   | int(11) unsigned       | NO   | MUL | 0       |                |
| warn_number        | tinyint(3) unsigned    | NO   |     | 1       |                |
| keywords           | varchar(255)           | NO   |     |         |                |
| goods_brief        | varchar(255)           | NO   |     |         |                |
| goods_desc         | text                   | NO   |     | NULL    |                |
| goods_thumb        | varchar(255)           | NO   |     |         |                |
| goods_img          | varchar(255)           | NO   |     |         |                |
| original_img       | varchar(255)           | NO   |     |         |                |
| is_real            | tinyint(3) unsigned    | NO   |     | 1       |                |
| extension_code     | varchar(30)            | NO   |     |         |                |
| is_on_sale         | tinyint(1) unsigned    | NO   |     | 1       |                |
| is_alone_sale      | tinyint(1) unsigned    | NO   |     | 1       |                |
| is_shipping        | tinyint(1) unsigned    | NO   |     | 0       |                |
| integral           | int(10) unsigned       | NO   |     | 0       |                |
| add_time           | int(10) unsigned       | NO   |     | 0       |                |
| sort_order         | smallint(4) unsigned   | NO   | MUL | 100     |                |
| is_delete          | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_best            | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_new             | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_hot             | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_promote         | tinyint(1) unsigned    | NO   |     | 0       |                |
| bonus_type_id      | tinyint(3) unsigned    | NO   |     | 0       |                |
| last_update        | int(10) unsigned       | NO   | MUL | 0       |                |
| goods_type         | smallint(5) unsigned   | NO   |     | 0       |                |
| seller_note        | varchar(255)           | NO   |     |         |                |
| give_integral      | int(11)                | NO   |     | -1      |                |
| rank_integral      | int(11)                | NO   |     | -1      |                |
| suppliers_id       | smallint(5) unsigned   | YES  |     | NULL    |                |
| is_check           | tinyint(1) unsigned    | YES  |     | NULL    |                |
+--------------------+------------------------+------+-----+---------+----------------+
43 rows in set (0.06 sec)

mysql> select * from goods;
+----------+--------+-----------+------------------------------+------------------+-------------+----------+---------------+--------------+--------------+--------------+------------+---------------+--------------------+------------------+-------------+-------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------+------------------------------------------------+-------------------------------------------------+---------+----------------+------------+---------------+-------------+----------+------------+------------+-----------+---------+--------+--------+------------+---------------+-------------+------------+-------------+---------------+---------------+--------------+----------+
| goods_id | cat_id | goods_sn  | goods_name                   | goods_name_style | click_count | brand_id | provider_name | goods_number | goods_weight | market_price | shop_price | promote_price | promote_start_date | promote_end_date | warn_number | keywords                                                                                                    | goods_brief                                                                                        | goods_desc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | goods_thumb                                          | goods_img                                      | original_img                                    | is_real | extension_code | is_on_sale | is_alone_sale | is_shipping | integral | add_time   | sort_order | is_delete | is_best | is_new | is_hot | is_promote | bonus_type_id | last_update | goods_type | seller_note | give_integral | rank_integral | suppliers_id | is_check |
+----------+--------+-----------+------------------------------+------------------+-------------+----------+---------------+--------------+--------------+--------------+------------+---------------+--------------------+------------------+-------------+-------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------+------------------------------------------------+-------------------------------------------------+---------+----------------+------------+---------------+-------------+----------+------------+------------+-----------+---------+--------+--------+------------+---------------+-------------+------------+-------------+---------------+---------------+--------------+----------+
|        1 |      4 | ECS000000 | KD876                        | +                |           7 |        8 |               |            1 |        0.110 |      1665.60 |    1388.00 |          0.00 |                  0 |                0 |           1 | LG 3g 876 支持 双模 2008年04月 灰色 GSM,850,900,1800,1900                                                   |                                                                                                    | <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多朋友都已经抢先体验了3G网络的可视通话、高速上网等功能。LG KD876手机<span style="font-size: x-large;"><span style="color: rgb(255, 0, 0);"><strong>支持TD-SCDMA/GSM双模单待</strong></span></span>，便于测试初期GSM网络和TD网络之间的切换和共享。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876手机整体采用银色塑料材质，<strong><span style="font-size: x-large;"><span style="color: rgb(255, 0, 0);">特殊的旋转屏设计是本机的亮点</span></span></strong>，而机身背部的300万像素摄像头也是首发的六款TD-SCDMA手机中配置最高的。LG KD876手机屏幕下方设置有外键盘，该键盘由左/右软键、通话/挂机键、返回键、五维摇杆组成，摇杆灵敏度很高，定位准确。KD876的内键盘由标准12个电话键和三个功能键、一个内置摄像头组成。三个功能键分别为视频通话、MP3、和菜单键，所有按键的手感都比较一般，键程适中，当由于按键排列过于紧密，快速发短信时很容易误按，用户在使用时一定要多加注意。LG KD876手机机身周边的接口设计非常简洁，手机的厚度主要来自屏幕旋转轴的长度，如果舍弃旋屏设计的话，估计<span style="font-size: x-large;"><strong><span style="color: rgb(255, 0, 0);">厚度可以做到10mm以下</span></strong></span>。</p> | images/200905/thumb_img/1_thumb_G_1240902890710.jpg  | images/200905/goods_img/1_G_1240902890755.jpg  | images/200905/source_img/1_G_1240902890895.gif  |       1 |                |          1 |             1 |           0 |       13 | 1240902890 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589545 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|        4 |      8 | ECS000004 | 诺基亚N85原装充电器          | +                |           0 |        1 |               |           17 |        0.000 |        69.60 |      58.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/4_thumb_G_1241422402467.jpg  | images/200905/goods_img/4_G_1241422402722.jpg  | images/200905/source_img/4_G_1241422402919.jpg  |       1 |                |          1 |             0 |           0 |        0 | 1241422402 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1242110662 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        3 |      8 | ECS000002 | 诺基亚原装5800耳机           | +                |           3 |        1 |               |           24 |        0.000 |        81.60 |      68.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/3_thumb_G_1241422082679.jpg  | images/200905/goods_img/3_G_1241422082168.jpg  | images/200905/source_img/3_G_1241422082367.jpg  |       1 |                |          1 |             1 |           0 |        0 | 1241422082 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972255 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        5 |     11 | ECS000005 | 索爱原装M2卡读卡器           | +                |           3 |        7 |               |            8 |        0.000 |        24.00 |      20.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/5_thumb_G_1241422518886.jpg  | images/200905/goods_img/5_G_1241422518773.jpg  | images/200905/source_img/5_G_1241422518470.jpg  |       1 |                |          1 |             1 |           0 |        0 | 1241422518 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1241972241 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|        6 |     11 | ECS000006 | 胜创KINGMAX内存卡            | +                |           0 |        0 |               |           15 |        0.000 |        50.40 |      42.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                      |                                                |                                                 |       1 |                |          1 |             0 |           0 |        0 | 1241422573 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972238 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        7 |      8 | ECS000007 | 诺基亚N85原装立体声耳机HS-82 | +                |           0 |        1 |               |           20 |        0.000 |       120.00 |     100.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/7_thumb_G_1241422785492.jpg  | images/200905/goods_img/7_G_1241422785856.jpg  | images/200905/source_img/7_G_1241422785657.jpg  |       1 |                |          1 |             1 |           0 |        1 | 1241422785 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972232 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|        8 |      3 | ECS000008 | 飞利浦9@9v                   | +                |           9 |        4 |               |            1 |        0.075 |       478.79 |     399.00 |        385.00 |         1241366400 |       1244044800 |           1 | 双模 2008年春 黑色 直板 中低档                                                                              |                                                                                                    | <p align="left">作为一款性价比极高的入门级<font size="3" color="#ff0000"><strong>商务手机</strong></font>，飞利浦<a href="mailto:9@9v">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size="3" color="#ff0000">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size="3"><strong><font color="#ff0000">别</font><font color="#ff0000">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>
<p align="left">&nbsp;</p>
<p align="left">此款手机采用<strong><font size="3" color="#ff0000">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size="3" color="#ff0000">记事提醒</font></strong>，让商务应用更加随意。</p>
<p align="left">&nbsp;</p>
<p align="left">&nbsp;作为入门级为数不多支持<strong><font size="3" color="#ff0000">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href="mailto:9@9V">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>
<p align="left">&nbsp;</p>
<p align="left">&nbsp;</p> | images/200905/thumb_img/8_thumb_G_1241425513488.jpg  | images/200905/goods_img/8_G_1241425513055.jpg  | images/200905/source_img/8_G_1241425513518.jpg  |       1 |                |          1 |             1 |           0 |        3 | 1241425512 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589533 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|        9 |      3 | ECS000009 | 诺基亚E66                    | +                |          20 |        1 |               |            4 |        0.121 |      2757.60 |    2298.00 |          0.00 |                  0 |                0 |           1 | SMS EMS MMS 短消息群发 语音 阅读器 SMS,EMS,MMS,短消息群发语音合成信息阅读器 黑色 白色 滑盖                  |                                                                                                    | <p>在机身材质方面，诺基亚E66大量采用金属材质，刨光的金属表面光泽动人，背面的点状效果规则却又不失变化，时尚感总是在不经意间诠释出来，并被人们所感知。E66机身尺寸为<span style="color: rgb(255, 0, 0);"><span style="font-size: larger;"><strong>107.5&times;49.5&times;13.6毫米，重量为121克</strong></span></span>，滑盖的造型竟然比E71还要轻一些。</p>
<p>&nbsp;</p>
<div>诺基亚E66机身正面是<span style="color: rgb(255, 0, 0);"><span style="font-size: larger;"><strong>一块2.4英寸1600万色QVGA分辨率（240&times;320像素）液晶显示屏</strong></span></span>。屏幕上方拥有光线感应元件，能够自适应周 围环境光调节屏幕亮度；屏幕下方是方向功能键区。打开滑盖，可以看到传统的数字键盘，按键的大小、手感、间隔以及键程适中，手感非常舒适。</div>
<div>&nbsp;</div>
<div>诺基亚为E66配备了一颗320万像素自动对焦摄像头，带有LED 闪光灯，支持多种拍照尺寸选择。</div>
<p>&nbsp;</p>                                                                                                                                                                            | images/200905/thumb_img/9_thumb_G_1241511871555.jpg  | images/200905/goods_img/9_G_1241511871574.jpg  | images/200905/source_img/9_G_1241511871550.jpg  |       1 |                |          1 |             1 |           0 |       22 | 1241511871 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589743 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       10 |      3 | ECS000010 | 索爱C702c                    | +                |          11 |        7 |               |            7 |        0.000 |      1593.60 |    1328.00 |       1250.00 |         1243785600 |       1277827200 |           1 | 2008年05月 GSM,850,900,1800,1900 直板                                                                       |                                                                                                    | <p>C702可以说是一种在外观上复古的产物，不仅延续T系列早期的直板造型，而且在屏幕和键盘的组合分布上都继承了前辈的精髓。C702的机身尺寸为106&times;48&times;15.5毫米，重量为105克。此外索尼爱立信为C702融入了<font size="3" color="#ff0000"><strong>三防特性，即防尘、防滑和防水溅</strong></font>，这款新的C702搭载了索尼爱立信经典A200平台，界面布局与W908c、K858c一致，典型的特征就是配备左右软键、中央确定键和通话/挂机键。</p>
<p>索尼爱立信C702配备一块<strong><font size="3" color="#ff0000">2.2英寸26万色TFT液晶显示屏</font></strong>，分辨率为240&times;320像素(QVGA)，显示效果属于目前主流水准。C702可以说是索尼爱立信首批<strong><font size="3" color="#ff0000">内置GPS模块</font></strong>的 手机产品之一，C702的搜星、定位一气呵成，十分精准，误差大约在10米之内。基本上定位后可以将有效卫星数量控制在4&mdash;6颗，可以说可以满足我们的需 要了。C702还提供了&ldquo;影像定位&rdquo;功能，配合内置的AGPS全球定位辅助系统，只须启动Geo-Tagging智能影像定位功能，便可将拍摄地点记录在 照片内，方便用户随时查询。</p>
<p>&nbsp;</p>
<p>作为一款Cyber-shot系列影像手机，索尼爱立信C702在拍照功能方面同样有不俗的表现。并且手机内置的<strong><font size="3" color="#ff0000">320万像素摄像头</font></strong>也 同样在拍照功能上也不错的表现。不仅支持自动聚焦和双LED闪光功能，而且还拥有2倍数码变焦、防红眼、Photo fix优画及场景模式等功能。索尼爱立信C702除了配备的是最大光圈为F3.2的4.2毫米镜头之外，该机也如同门中的旗舰C902一样增加了对脸部有 先自动聚焦功能的支持。</p>
<p>&nbsp;</p> | images/200905/thumb_img/10_thumb_G_1242973436403.jpg | images/200905/goods_img/10_G_1242973436141.jpg | images/200905/source_img/10_G_1242973436172.jpg |       1 |                |          1 |             1 |           0 |       13 | 1241965622 |        100 |         0 |       0 |      0 |      1 |          1 |             0 |  1245290333 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       11 |      3 | ECS000011 | 索爱C702c                    | +                |           0 |        7 |               |            1 |        0.000 |         0.00 |    1300.00 |          0.00 |                  0 |                0 |           1 | 直板                                                                                                        |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                      |                                                |                                                 |       1 |                |          0 |             1 |           0 |        0 | 1241966951 |        100 |         1 |       0 |      0 |      0 |          0 |             0 |  1241966960 |          7 |             |            -1 |            -1 |         NULL |     NULL |
|       12 |      3 | ECS000012 | 摩托罗拉A810                 | +                |          13 |        2 |               |            8 |        0.000 |      1179.60 |     983.00 |        960.00 |         1241107200 |       1255104000 |           1 | SMS EMS MMS pda 摄像 智能 音乐 SMS,EMS,MMS                                                                  |                                                                                                    | <p>全机使用的材质除去电池盖部分采用了金属以外，其它均使用了ABS工程塑料作为主材，这款手机的三围是105&times;51&times;14毫米，有着100克的轻量级重量，拿在手中的感觉还是非常不错的。A810手机作为一款<strong><font size="3" color="#ff0000">PDA手机</font></strong>在设计的时候取消了键盘配置，一切数字键都要依靠手机内提供的虚拟键盘进行操作，在手机的左上侧是一个<strong><font size="3" color="#ff0000">3.5mm的标准耳机插口</font></strong>，这种设计可以让用户使用自己习惯或者喜欢的耳机去欣赏音乐。</p>
<p>&nbsp;</p>
<p>这款摩托罗拉A810手机配置了一块<font size="3" color="#ff0000"><strong>26万色的2.2英寸TFT全触摸屏幕</strong></font>，其分辨率达到了主流的QVGA水平（240&times;320像素），摩托罗拉A810采用了内部核心为2.6.10的<strong><font size="3" color="#ff0000">LINUX操作系统</font></strong>，菜单上依然采用传统的9宫格的显示方式，一般手机的名片式电话本只能支持诸如电话、邮件、传真、公司等一些基本信息，而A810手机的电话本除了这些还支持公司地址，配偶信息、子女姓名、上司名称、助手等等，对于一款手机来说，电话本不可谓不强大。A810的<strong><font size="3" color="#ff0000">手写识别能力相当的惊人</font></strong>，对连笔、草书和倒插笔的识别率都相当的高，同时还为左右手设置了不同的书写习惯选择，并支持手写速度的调节。</p>
<p>这款A810手机<strong><font size="3" color="#ff0000">内置的音乐播放功能</font></strong>可以支持MP3、WAV、AMR、AAC等格式的音乐播放，<font size="3" color="#ff0000"><strong>支持后台播放</strong></font>。视频方面，这款A810支持MP4、3GP、H.263格式的播放，视频播放器同样简约，操作方便，这款摩托罗拉A810还内置了6款游戏，每一款都有很高的耐玩性，而且都是支持触摸屏操作的，同时这款手机还内置了<strong><font size="3" color="#ff0000">FM收音机</font></strong>，支持自动搜索，并提供了20个频道供用户存储，不过收音机并不支持后台播放。</p>
<p>&nbsp;</p> | images/200905/thumb_img/12_thumb_G_1241965978410.jpg | images/200905/goods_img/12_G_1241965978209.jpg | images/200905/source_img/12_G_1241965978878.jpg |       1 |                |          1 |             1 |           0 |        9 | 1245297652 |        100 |         0 |       0 |      1 |      0 |          1 |             0 |  1245297670 |          3 |             |            -1 |            -1 |         NULL |     NULL |
|       13 |      3 | ECS000013 | 诺基亚5320 XpressMusic       | +                |          13 |        1 |               |            8 |        0.000 |      1573.20 |    1311.00 |          0.00 |                  0 |                0 |           1 | 摄像 智能 音乐 蓝色 红色 舒适 直板 中档 2008年07月 黑色 GSM,850,900,1800,1900                               |                                                                                                    | <p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size="3" color="#ff0000">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size="3" color="#ff0000">90g</font></strong>，手感舒适。</p>
<p>&nbsp;</p>
<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size="3" color="#ff0000"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>
<p>&nbsp;</p>
<p>手机背面，诺基亚为5320XM配备一颗<strong><font size="3" color="#ff0000">200W像素</font></strong>的摄像头，并且带有<strong><font size="3" color="#ff0000">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>
<p>&nbsp;</p>                                                                                                                                                                                                                                     | images/200905/thumb_img/13_thumb_G_1241968002527.jpg | images/200905/goods_img/13_G_1241968002233.jpg | images/200905/source_img/13_G_1241968002732.jpg |       1 |                |          1 |             1 |           0 |       13 | 1241967762 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1269589198 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       14 |      4 | ECS000014 | 诺基亚5800XM                 | +                |           6 |        1 |               |            1 |        0.000 |      3150.00 |    2625.00 |          0.00 |                  0 |                0 |           1 | GSM 64和弦 2009年2月 320万摄像头 GPS 直板 工程塑料 支持 2008年10月 黑色                                     |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/14_thumb_G_1241968492116.jpg | images/200905/goods_img/14_G_1241968492932.jpg | images/200905/source_img/14_G_1241968492305.jpg |       1 |                |          1 |             1 |           0 |       26 | 1241968492 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1269589186 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       15 |      3 | ECS000015 | 摩托罗拉A810                 | +                |           8 |        2 |               |            3 |        0.000 |       945.60 |     788.00 |          0.00 |                  0 |                0 |           1 | 600 直板 工程塑料 蓝牙 视频拍摄 音乐 黑色 白色                                                              |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/15_thumb_G_1242973362970.jpg | images/200905/goods_img/15_G_1242973362318.jpg | images/200905/source_img/15_G_1242973362751.jpg |       1 |                |          1 |             1 |           0 |        5 | 1241968703 |        100 |         1 |       0 |      1 |      1 |          0 |             0 |  1245297631 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       16 |      2 | ECS000016 | 恒基伟业G101                 | +                |           3 |       11 |               |            0 |        0.000 |       988.00 |     823.33 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/16_thumb_G_1241968949103.jpg | images/200905/goods_img/16_G_1241968949002.jpg | images/200905/source_img/16_G_1241968949402.jpg |       1 |                |          0 |             1 |           0 |        8 | 1241968949 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1245290562 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|       17 |      3 | ECS000017 | 夏新N7                       | +                |           2 |        5 |               |            1 |        0.000 |      2760.00 |    2300.00 |          0.00 |                  0 |                0 |           1 | 2008年01月 GSM,900,1800,1900,2100 直板 262144万 240×400 像素 SMS,EMS,MMS,超长信息发送,短消息群发 黑色 CDMA |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/17_thumb_G_1241969394587.jpg | images/200905/goods_img/17_G_1241969394677.jpg | images/200905/source_img/17_G_1241969394844.jpg |       1 |                |          1 |             1 |           0 |       23 | 1241969394 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1269589169 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       18 |      4 | ECS000018 | 夏新T5                       | +                |           0 |        5 |               |            1 |        0.000 |      3453.60 |    2878.00 |          0.00 |                  0 |                0 |           1 | 2008年04月 3G(GSM,900,1800,1900,TD-SCDMA ) 直板 262144万 320×240 像素 是 银色                              |                                                                                                    | <p>&nbsp;  TD-SCDMA/GSM两种模式任意切换，中国3G手机先驱，支持大陆特有3G网络，轻松实现可视电话、视频留言、视频会议功能，2.6英寸Q屏，手写、键盘双输入，内置移动证券，支持手机邮箱、手机地图、无驱U盘</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                      |                                                |                                                 |       1 |                |          1 |             1 |           0 |       28 | 1241969533 |        100 |         1 |       0 |      0 |      0 |          0 |             0 |  1241969533 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|       19 |      3 | ECS000019 | 三星SGH-F258                 | +                |           7 |        6 |               |           12 |        0.000 |      1029.60 |     858.00 |          0.00 |                  0 |                0 |           1 | 滑盖 GSM 258 时尚 蓝牙 黑色 金色 白色                                                                       | 从整体来看，三星SGH-F258比较时尚可爱，三围尺寸为94×46×17.5mm，重量为96克，曲线柔和具有玲珑美感
 | <p>从整体来看，三星SGH-F258比较<font size="3" color="#ff0000"><strong>时尚</strong></font>可爱，三围尺寸为94&times;46&times;17.5mm，重量为96克，曲线柔和具有玲珑美感。</p>
<p>&nbsp;</p>
<p>三星F258的前面板整体应用<strong><font size="3" color="#ff0000">镜面效果</font></strong>，2.0英寸显示屏幕略显窄小，导航键与功能键在滑盖滑开之前是前面板的全部控制键，没有挂断和接听键，不过，五向键有<font size="3"><strong><font color="#ff0000">音乐操</font><font color="#ff0000">作</font></strong></font>功能，明确显示了F258音乐手机的定位。</p>
<p>&nbsp;</p>
<p>F258的数字键键区采用了极具金属质感的平板式设计，每颗按键的面积足够大，按键与按键之间的间隔明显，操作起来手感舒适。</p>                                                                                                                                                                                                                                                                                                                                                                    | images/200905/thumb_img/19_thumb_G_1241970175208.jpg | images/200905/goods_img/19_G_1241970175091.jpg | images/200905/source_img/19_G_1241970175549.jpg |       1 |                |          1 |             1 |           0 |        8 | 1241970139 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589154 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       20 |      3 | ECS000020 | 三星BC01                     | +                |          14 |        6 |               |           12 |        0.000 |       336.00 |     280.00 |        238.00 |         1241884800 |       1251648000 |           1 | GSM 直板 40和弦 金属材质 2008年07月 黑色 GSM,900,1800,1900,2100                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/20_thumb_G_1242106490058.jpg | images/200905/goods_img/20_G_1242106490663.jpg | images/200905/source_img/20_G_1242106490922.jpg |       1 |                |          1 |             1 |           0 |        2 | 1241970417 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589110 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       21 |      3 | ECS000021 | 金立 A30                     | +                |           4 |       10 |               |           40 |        0.000 |      2400.00 |    2000.00 |          0.00 |                  0 |                0 |           1 | 2008年03月 GSM,900,1800,1900,2100 直板 1600万 240×400 像素 2007年12月 200万摄像头 黑色                     |                                                                                                    | <p>&nbsp;</p>
<p align="left"><span style="font-size: medium;"><font size="3">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">输入法: 中文输入法</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">短信功能: 支持短信300条和彩信100条</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">通话记录：支持电话录音,恢复/静音,双音多频,免提</font></span></p>
<p>&nbsp;</p>
<p><font size="3">高级功能</font></p>
<p align="left"><span style="font-size: medium;"><font size="3">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">内置游戏:智能拼图</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</font></span></p>
<p><span style="font-size: medium;"><font size="3">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</font></span></p> | images/200905/thumb_img/21_thumb_G_1242109298150.jpg | images/200905/goods_img/21_G_1242109298873.jpg | images/200905/source_img/21_G_1242109298831.jpg |       1 |                |          1 |             1 |           0 |       20 | 1241970634 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1269589102 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       22 |      3 | ECS000022 | 多普达Touch HD               | +                |          15 |        3 |               |            1 |        0.000 |      7198.80 |    5999.00 |          0.00 |                  0 |                0 |           1 | 500万摄像头 蓝牙 手写 GPS 办公应用 语音拨号 2008年12月 黑色 GSM,850,900,1800,1900 直板                      |                                                                                                    | <p><img src="http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg" alt="" /></p>
<p>&nbsp;</p>
<p><img src="http://www.ouku.com/upimg/ouku/Image/002(1).jpg" alt="" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | images/200905/thumb_img/22_thumb_G_1241971076803.jpg | images/200905/goods_img/22_G_1241971076358.jpg | images/200905/source_img/22_G_1241971076130.jpg |       1 |                |          1 |             1 |           0 |       59 | 1241971076 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1269589090 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       23 |      5 | ECS000023 | 诺基亚N96                    | +                |          17 |        1 |               |            8 |        0.000 |      4440.00 |    3700.00 |          0.00 |                  0 |                0 |           1 | 500万摄像头 microSD 工程塑料 蓝牙 数码相机 内置游戏 滑盖 高档 2008年09月 320×240 像素 黑色                 |                                                                                                    | <p>诺基亚N96采用了<strong><font size="3" color="#ff0000">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size="3" color="#ff0000">2.8英寸</font></strong>的屏幕，支持<strong><font size="3" color="#ff0000">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>
<p><img alt="" src="file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg" /></p>
<p>&nbsp;</p>
<p>&nbsp;<img src="http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg" alt="" /></p>
<p>诺基亚N96设置有专门的<strong><font size="3" color="#ff0000">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size="3" color="#ff0000">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size="3" color="#ff0000">N-Gage游戏平台</font></strong>，内置包括<font size="3" color="#ff0000"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>
<p><img src="http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg" alt="" /></p>
<p>&nbsp;</p> | images/200905/thumb_img/23_thumb_G_1241971556399.jpg | images/200905/goods_img/23_G_1241971556855.jpg | images/200905/source_img/23_G_1241971556256.jpg |       1 |                |          1 |             1 |           0 |       37 | 1241971488 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1269589078 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       24 |      3 | ECS000024 | P806                         | +                |          35 |        9 |               |          100 |        0.000 |      2400.00 |    2000.00 |       1850.00 |         1243785600 |       1277827200 |           1 | 旅行充电器 图形菜单 Wap 上网 红外接口 移动 MSN 支持 2008年06月 灰色                                         |                                                                                                    | <div>
<div>
<div><font size="4">规格参数</font></div>
<p><font size="4"><span>上市时间：</span><span>2008年06月</span></font></p>
<p><font size="4"><span>网络频率：</span><span>GSM/GPRS；900/1800MHz</span></font></p>
<p><font size="4"><span>重　量　：</span><span>未知</span></font></p>
<p><font size="4"><span>尺寸/体积：</span><span>未知</span></font></p>
<p><font size="4"><span>可选颜色：</span><span>银色</span></font></p>
<p><font size="4"><span>屏幕参数：</span><span>26万色TFT彩色屏幕；</span></font></p>
<p><font size="4"><span>WAP上网：</span><span>支持飞笺</span></font></p>
<p><font size="4"><span>基本配置:<em><strong><font size="5" color="#ff00ff">二电(1760毫安) 一充 数据线 耳机 手写笔 512M内存卡</font></strong></em></span></font></p>
<p>&nbsp;</p>
</div>
</div>
<div><font size="4">基本功能</font></div>
<p><font size="4"><span>『时钟』</span><span>『内置振动』</span><span>『录音』</span><span>『可选铃声』</span></font></p>
<p><font size="4"><span>『和弦铃声』</span><span>『MP3铃声』</span><span>『来电铃声识别』</span><span>『来电图片识别』</span></font></p>
<p><font size="4"><span>『情景模式』</span><span>『待机图片』</span><span>『图形菜单』</span><span>『触摸屏』</span></font></p>
<p><span><font size="4">『手写输入』</font></span></p>
<div><font size="4">通信功能</font></div>
<p><font size="4"><span>『双卡双待』</span><span>『内置天线』</span><span>『输入法』</span><span>『中文短信』</span></font></p>
<p><font size="4"><span>『短信群发』</span><span>『多媒体短信』</span><span>『话机通讯录』</span><span>『通话记录』</span></font></p>
<p><font size="4"><span>『免提通话』</span><span>『飞行模式』</span></font></p>
<div><font size="4">多媒体娱乐 :支持3GP、MP4文件播放</font></div>
<p><font size="4"><span>『视频播放』</span><span>『MP3播放器』</span></font></p>
<p><font size="4"><span>多媒体卡扩展：</span><span>支持microSD卡扩展&nbsp;</span></font></p>
<p><font size="4"><span>摄像头：</span><span>内置</span></font></p>
<p><font size="4"><span>摄像头像素：</span><span>30万像素</span></font></p>
<p><font size="4"><span>传感器类型：</span><span>CMOS</span></font></p>
<p><font size="4"><span>变焦模式：</span><span>数码变焦</span></font></p>
<p><font size="4"><span>照片分辨率：</span><span>多种照片分辨率选择</span></font></p>
<p><font size="4"><span>拍摄模式：</span><span>多种拍摄模式选择</span></font></p>
<p><font size="4"><span>照片质量：</span><span>多种照片质量选择</span></font></p>
<p><font size="4"><span>视频拍摄：</span><span>有声视频拍摄</span></font></p>
<div><font size="4">数据传输</font></div>
<p><font size="4"><span>『WAP浏览器』</span><span>『数据线接口』</span></font></p>
<div><font size="4">个人助理</font></div>
<p><font size="4"><span>『闹钟』</span><span>『日历』</span><span>『计算器』</span></font></p> | images/200905/thumb_img/24_thumb_G_1241971981429.jpg | images/200905/goods_img/24_G_1241971981284.jpg | images/200905/source_img/24_G_1241971981107.jpg |       1 |                |          1 |             1 |           0 |       20 | 1241971981 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589064 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       25 |     13 | ECS000025 | 小灵通/固话50元充值卡        | +                |           0 |        0 |               |            2 |        0.000 |        57.59 |      48.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/25_thumb_G_1241972709885.jpg | images/200905/goods_img/25_G_1241972709544.jpg | images/200905/source_img/25_G_1241972709750.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972709 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047546 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       26 |     13 | ECS000026 | 小灵通/固话20元充值卡        | +                |           0 |        0 |               |            2 |        0.000 |        22.80 |      19.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/26_thumb_G_1241972789393.jpg | images/200905/goods_img/26_G_1241972789293.jpg | images/200905/source_img/26_G_1241972789353.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972789 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1245047540 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       27 |     15 | ECS000027 | 联通100元充值卡              | +                |           0 |        0 |               |            2 |        0.000 |       100.00 |      95.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/27_thumb_G_1241972894068.jpg | images/200905/goods_img/27_G_1241972894061.jpg | images/200905/source_img/27_G_1241972894069.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972894 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1245047557 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       28 |     15 | ECS000028 | 联通50元充值卡               | +                |           0 |        0 |               |            0 |        0.000 |        50.00 |      45.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/28_thumb_G_1241972976986.jpg | images/200905/goods_img/28_G_1241972976313.jpg | images/200905/source_img/28_G_1241972976695.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972976 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1245047542 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       29 |     14 | ECS000029 | 移动100元充值卡              | +                |           0 |        0 |               |            0 |        0.000 |         0.00 |      90.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/29_thumb_G_1241973022239.jpg | images/200905/goods_img/29_G_1241973022206.jpg | images/200905/source_img/29_G_1241973022514.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241973022 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047543 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       30 |     14 | ECS000030 | 移动20元充值卡               | +                |           1 |        0 |               |            9 |        0.000 |        21.00 |      18.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/30_thumb_G_1241973114800.jpg | images/200905/goods_img/30_G_1241973114234.jpg | images/200905/source_img/30_G_1241973114587.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241973114 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047549 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       31 |      3 | ECS000031 | 摩托罗拉E8                   | +                |           5 |        2 |               |            1 |        0.000 |      1604.39 |    1337.00 |          0.00 |                  0 |                0 |           1 | 直板                                                                                                        |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/31_thumb_G_1242110412996.jpg | images/200905/goods_img/31_G_1242110412332.jpg | images/200905/source_img/31_G_1242110412519.jpg |       1 |                |          0 |             1 |           0 |       13 | 1242110412 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1242140652 |          7 |             |            -1 |            -1 |         NULL |     NULL |
|       32 |      3 | ECS000032 | 诺基亚N85                    | +                |           9 |        1 |               |            4 |        0.000 |      3612.00 |    3010.00 |       2750.00 |         1243785600 |       1277827200 |           1 | 2008年10月 GSM,850,900,1800,1900 黑色                                                                       |                                                                                                    | <p>诺基亚N85参数</p>
<div>&nbsp;</div>
<div>
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
    <tbody>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>基本参数</b></p>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">手机昵称</td>
            <td width="450" bgcolor="#ffffff">N85</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">上市日期</td>
            <td width="450" bgcolor="#ffffff">2008年10月</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">手机类型</td>
            <td width="450" bgcolor="#ffffff">3G手机；拍照手机；智能手机</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">手机制式</td>
            <td width="450" bgcolor="#ffffff">GSM</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">支持频段</td>
            <td width="450" bgcolor="#ffffff">GSM850/900/1800/1900MHz</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">数据传输</td>
            <td width="450" bgcolor="#ffffff">GPRS、EDGE</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">屏幕材质</td>
            <td width="450" bgcolor="#ffffff">AMOLED</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">屏幕色彩</td>
            <td width="450" bgcolor="#ffffff">1600万色</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">主屏尺寸</td>
            <td width="450" bgcolor="#ffffff">2.6英寸</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">主屏参数</td>
            <td width="450" bgcolor="#ffffff">QVGA 320&times;240像素</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">铃音描述</td>
            <td width="450" bgcolor="#ffffff">可选MP3、WAV、AAC或和弦Midi铃声等格式</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">操作系统</td>
            <td width="450" bgcolor="#ffffff">Symbian OS v9.3操作系统与S60 v3.2平台的组合</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">机身内存</td>
            <td width="450" bgcolor="#ffffff">74MB 内部动态存储空间<br />
            78MB 内置NAND闪存</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">存储卡</td>
            <td width="450" bgcolor="#ffffff">支持MicroSD(T-Flash)卡扩展最大至8GB</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">电池规格</td>
            <td width="450" bgcolor="#ffffff">1200毫安时锂电池</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">标配</td>
            <td width="450" bgcolor="#ffffff">诺基亚 N85<br />
            诺基亚电池（BL-5K）<br />
            诺基亚旅行充电器（AC-10）<br />
            诺基亚视频数据线（CA-75U）<br />
            诺基亚数据线（CA-101）<br />
            诺基亚音乐耳机（HS-45、AD-54）<br />
            诺基亚 8 GB microSD 卡（MU-43）<br />
            《用户手册》<br />
            《快速入门》</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">理论通话时间</td>
            <td width="450" bgcolor="#ffffff">6.9 小时</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">理论待机时间</td>
            <td width="450" bgcolor="#ffffff">363 小时</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>产品外形</b></p>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">外观设计</td>
            <td width="450" bgcolor="#ffffff">双向滑盖</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">产品尺寸</td>
            <td width="450" bgcolor="#ffffff">103&times;50&times;16mm<br />
            体积：76 立方厘米</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">手机重量</td>
            <td width="450" bgcolor="#ffffff">128克</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">产品天线</td>
            <td width="450" bgcolor="#ffffff">内置</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>拍照功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">定时器</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">摄像头</td>
            <td width="450" bgcolor="#ffffff">内置</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">摄像头像素</td>
            <td width="450" bgcolor="#ffffff">500万像素</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">连拍功能</td>
            <td width="450" bgcolor="#ffffff">支持</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">LED闪光灯</td>
            <td width="450" bgcolor="#ffffff">双LED 闪光灯</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">数码变焦</td>
            <td width="450" bgcolor="#ffffff">20 倍数码变焦</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">拍摄模式</td>
            <td width="450" bgcolor="#ffffff">静止、连拍、自动定时器、摄像</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">照片特效</td>
            <td width="450" bgcolor="#ffffff">正常、怀旧、黑白、负片、逼真</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">拍照描述</td>
            <td width="450" bgcolor="#ffffff">支持最大2592&times;1944分辨率照片拍摄<br />
            支持JPEG、Exif格式<br />
            白平衡模式：自动、阳光、阴天、白炽灯、荧光灯<br />
            感光度模式：高、中、低、自动</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">视频拍摄</td>
            <td width="450" bgcolor="#ffffff">最高支持640 x 480 像素（VGA）、30 帧/秒</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>娱乐功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">收音机</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">TV-OUT</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">录音功能</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">电子书</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">视频播放</td>
            <td width="450" bgcolor="#ffffff">内置RealPlayer播放器, 支持MPEG4、H.264/AVC、H.263/3GP、RealVideo等视频格式全屏播放</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">音乐播放</td>
            <td width="450" bgcolor="#ffffff">内置播放器, 支持mp3、.wma、.aac、eAAC、eAAC+格式</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">游戏</td>
            <td width="450" bgcolor="#ffffff">内置</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">Java功能</td>
            <td width="450" bgcolor="#ffffff">支持Java MIDP 2.0 CLDC 1.1</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">Flash功能</td>
            <td width="450" bgcolor="#ffffff">第3.0版Flash lite播放器</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>数据功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">蓝牙功能</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">数据线接口</td>
            <td width="450" bgcolor="#ffffff">USB数据线 3.5mm立体声耳机插孔</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>基本功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">短信(SMS)</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">彩信(MMS)</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">免提通话</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">情景模式</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">闹钟功能</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">日历功能</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">输入方式</td>
            <td width="450" bgcolor="#ffffff">键盘</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">通话记录</td>
            <td width="450" bgcolor="#ffffff">未接来电+已接来电+已拨电话记录</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">通讯录</td>
            <td width="450" bgcolor="#ffffff">S60标准化名片式通讯录</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>网络功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">电子邮件</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">WWW浏览器</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">WAP浏览器</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>商务功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">飞行模式</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">语音拨号</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">备忘录</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">日程表</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">世界时间</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>其他功能</b></p>
            </td>
        </tr>
        <tr>
            <td width="550" valign="center" bgcolor="#ffffff" align="left" style="padding: 8px 0px;" colspan="2">
            <table cellspacing="1" cellpadding="0" border="0" align="left">
                <tbody>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">GPS功能</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">电子词典</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">待机图片</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">计算器</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">来电铃声识别</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">来电图片识别</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">来电防火墙</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">动画屏保</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">图形菜单</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">秒表</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">单位换算</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0">
                            <tbody>
                                <tr>
                                    <td width="100%" align="middle" style="padding: 2px; float: none;">&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
    </tbody>
</table>
</div>
<p>&nbsp;</p> | images/200905/thumb_img/32_thumb_G_1242110760196.jpg | images/200905/goods_img/32_G_1242110760868.jpg | images/200905/source_img/32_G_1242110760437.jpg |       1 |                |          1 |             1 |           0 |       30 | 1242110760 |        100 |         0 |       0 |      1 |      1 |          1 |             0 |  1269589051 |          9 |             |            -1 |            -1 |         NULL |     NULL |
+----------+--------+-----------+------------------------------+------------------+-------------+----------+---------------+--------------+--------------+--------------+------------+---------------+--------------------+------------------+-------------+-------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------+------------------------------------------------+-------------------------------------------------+---------+----------------+------------+---------------+-------------+----------+------------+------------+-----------+---------+--------+--------+------------+---------------+-------------+------------+-------------+---------------+---------------+--------------+----------+
31 rows in set (0.06 sec)

mysql> 
mysql> desc good;
ERROR 1146 (42S02): Table 'gyshop.good' doesn't exist
mysql> desc goods;
+--------------------+------------------------+------+-----+---------+----------------+
| Field              | Type                   | Null | Key | Default | Extra          |
+--------------------+------------------------+------+-----+---------+----------------+
| goods_id           | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| cat_id             | smallint(5) unsigned   | NO   | MUL | 0       |                |
| goods_sn           | varchar(60)            | NO   | MUL |         |                |
| goods_name         | varchar(120)           | NO   |     |         |                |
| goods_name_style   | varchar(60)            | NO   |     | +       |                |
| click_count        | int(10) unsigned       | NO   |     | 0       |                |
| brand_id           | smallint(5) unsigned   | NO   | MUL | 0       |                |
| provider_name      | varchar(100)           | NO   |     |         |                |
| goods_number       | smallint(5) unsigned   | NO   | MUL | 0       |                |
| goods_weight       | decimal(10,3) unsigned | NO   | MUL | 0.000   |                |
| market_price       | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| shop_price         | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| promote_price      | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| promote_start_date | int(11) unsigned       | NO   | MUL | 0       |                |
| promote_end_date   | int(11) unsigned       | NO   | MUL | 0       |                |
| warn_number        | tinyint(3) unsigned    | NO   |     | 1       |                |
| keywords           | varchar(255)           | NO   |     |         |                |
| goods_brief        | varchar(255)           | NO   |     |         |                |
| goods_desc         | text                   | NO   |     | NULL    |                |
| goods_thumb        | varchar(255)           | NO   |     |         |                |
| goods_img          | varchar(255)           | NO   |     |         |                |
| original_img       | varchar(255)           | NO   |     |         |                |
| is_real            | tinyint(3) unsigned    | NO   |     | 1       |                |
| extension_code     | varchar(30)            | NO   |     |         |                |
| is_on_sale         | tinyint(1) unsigned    | NO   |     | 1       |                |
| is_alone_sale      | tinyint(1) unsigned    | NO   |     | 1       |                |
| is_shipping        | tinyint(1) unsigned    | NO   |     | 0       |                |
| integral           | int(10) unsigned       | NO   |     | 0       |                |
| add_time           | int(10) unsigned       | NO   |     | 0       |                |
| sort_order         | smallint(4) unsigned   | NO   | MUL | 100     |                |
| is_delete          | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_best            | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_new             | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_hot             | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_promote         | tinyint(1) unsigned    | NO   |     | 0       |                |
| bonus_type_id      | tinyint(3) unsigned    | NO   |     | 0       |                |
| last_update        | int(10) unsigned       | NO   | MUL | 0       |                |
| goods_type         | smallint(5) unsigned   | NO   |     | 0       |                |
| seller_note        | varchar(255)           | NO   |     |         |                |
| give_integral      | int(11)                | NO   |     | -1      |                |
| rank_integral      | int(11)                | NO   |     | -1      |                |
| suppliers_id       | smallint(5) unsigned   | YES  |     | NULL    |                |
| is_check           | tinyint(1) unsigned    | YES  |     | NULL    |                |
+--------------------+------------------------+------+-----+---------+----------------+
43 rows in set (0.05 sec)

mysql> select goods_id,cat_id,goods_sn,goods_name,goods_count,goods_num,market_price,shop_price from goods;
ERROR 1054 (42S22): Unknown column 'goods_count' in 'field list'
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| a112               |
| blog               |
| edu                |
| file               |
| gy1                |
| gyshop             |
| hd                 |
| menagerie          |
| myblog             |
| mysql              |
| performance_schema |
| t                  |
| t1                 |
| test               |
| u                  |
| webclass           |
| wenda              |
| wish               |
| y                  |
+--------------------+
20 rows in set (0.00 sec)

mysql> use test;
Database changed
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| person         |
| shirt          |
| shop           |
| t1             |
| user           |
+----------------+
5 rows in set (0.00 sec)

mysql> use gyshop;
Database changed
mysql> show create table goods\G
*************************** 1. row ***************************
       Table: goods
Create Table: CREATE TABLE `goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

mysql> USE TEST;
Database changed
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| person         |
| shirt          |
| shop           |
| t1             |
| user           |
+----------------+
5 rows in set (0.00 sec)

mysql> Create Table: CREATE TABLE `goods` (
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
    ->   PRIMARY KEY (`goods_id`),
    -> ) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ': CREATE TABLE `goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREM' at line 1
mysql> Create Table: CREATE TABLE `goods` (
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
    ->   PRIMARY KEY (`goods_id`),
    -> ) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ': CREATE TABLE `goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREM' at line 1
mysql> CREATE TABLE `goods` (
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
    ->   PRIMARY KEY (`goods_id`),
    -> ) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8' at line 15
mysql> CREATE TABLE `goods` (
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
Query OK, 0 rows affected (0.05 sec)

mysql> desc goods;
+--------------+------------------------+------+-----+---------+----------------+
| Field        | Type                   | Null | Key | Default | Extra          |
+--------------+------------------------+------+-----+---------+----------------+
| goods_id     | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| cat_id       | smallint(5) unsigned   | NO   |     | 0       |                |
| goods_sn     | varchar(60)            | NO   |     |         |                |
| goods_name   | varchar(120)           | NO   |     |         |                |
| click_count  | int(10) unsigned       | NO   |     | 0       |                |
| goods_number | smallint(5) unsigned   | NO   |     | 0       |                |
| market_price | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| shop_price   | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| add_time     | int(10) unsigned       | NO   |     | 0       |                |
| is_best      | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_new       | tinyint(1) unsigned    | NO   |     | 0       |                |
| is_hot       | tinyint(1) unsigned    | NO   |     | 0       |                |
+--------------+------------------------+------+-----+---------+----------------+
12 rows in set (0.03 sec)

mysql> #导入数据
mysql> insert into test.goods
    -> select goods_id,cat_id,goods_sn,goods_name,click_count,goods_number,market_price,shop_price,add_time,is_best,is_new,is_hot from gyshop.goods;
Query OK, 31 rows affected (0.05 sec)
Records: 31  Duplicates: 0  Warnings: 0

mysql> select * from goods wdere goods_id=32;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'goods_id=32' at line 1
mysql> select * from goods where goods_id=32;
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       32 |      3 | ECS000032 | 诺基亚N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select * from goods where goods_id=32;
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       32 |      3 | ECS000032 | 诺基亚N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> 
mysql> 
mysql> select * from goods where goods_id=32;
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       32 |      3 | ECS000032 | 诺基亚N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select goods_name from goods where cat_id!=3;
+------------------------------+
| goods_name                   |
+------------------------------+
| KD876                        |
| 诺基亚N85原装充电器          |
| 诺基亚原装5800耳机           |
| 索爱原装M2卡读卡器           |
| 胜创KINGMAX内存卡            |
| 诺基亚N85原装立体声耳机HS-82 |
| 诺基亚5800XM                 |
| 恒基伟业G101                 |
| 夏新T5                       |
| 诺基亚N96                    |
| 小灵通/固话50元充值卡        |
| 小灵通/固话20元充值卡        |
| 联通100元充值卡              |
| 联通50元充值卡               |
| 移动100元充值卡              |
| 移动20元充值卡               |
+------------------------------+
16 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id!=3 and ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select goods_name,cat_id from goods where cat_id!=3;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 索爱原装M2卡读卡器           |     11 |
| 胜创KINGMAX内存卡            |     11 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 诺基亚5800XM                 |      4 |
| 恒基伟业G101                 |      2 |
| 夏新T5                       |      4 |
| 诺基亚N96                    |      5 |
| 小灵通/固话50元充值卡        |     13 |
| 小灵通/固话20元充值卡        |     13 |
| 联通100元充值卡              |     15 |
| 联通50元充值卡               |     15 |
| 移动100元充值卡              |     14 |
| 移动20元充值卡               |     14 |
+------------------------------+--------+
16 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id<>3;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 索爱原装M2卡读卡器           |     11 |
| 胜创KINGMAX内存卡            |     11 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 诺基亚5800XM                 |      4 |
| 恒基伟业G101                 |      2 |
| 夏新T5                       |      4 |
| 诺基亚N96                    |      5 |
| 小灵通/固话50元充值卡        |     13 |
| 小灵通/固话20元充值卡        |     13 |
| 联通100元充值卡              |     15 |
| 联通50元充值卡               |     15 |
| 移动100元充值卡              |     14 |
| 移动20元充值卡               |     14 |
+------------------------------+--------+
16 rows in set (0.00 sec)

mysql> select sname,shop_price from goods where shop_price>3000;
ERROR 1054 (42S22): Unknown column 'sname' in 'field list'
mysql> select goods_name,shop_price from goods where shop_price>3000;
+----------------+------------+
| goods_name     | shop_price |
+----------------+------------+
| 多普达Touch HD |    5999.00 |
| 诺基亚N96      |    3700.00 |
| 诺基亚N85      |    3010.00 |
+----------------+------------+
3 rows in set (0.00 sec)

mysql> select goods_name,shop_price from goods where shop_price<=100;
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| 诺基亚N85原装充电器          |      58.00 |
| 诺基亚原装5800耳机           |      68.00 |
| 索爱原装M2卡读卡器           |      20.00 |
| 胜创KINGMAX内存卡            |      42.00 |
| 诺基亚N85原装立体声耳机HS-82 |     100.00 |
| 小灵通/固话50元充值卡        |      48.00 |
| 小灵通/固话20元充值卡        |      19.00 |
| 联通100元充值卡              |      95.00 |
| 联通50元充值卡               |      45.00 |
| 移动100元充值卡              |      90.00 |
| 移动20元充值卡               |      18.00 |
+------------------------------+------------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id in(4,11);
+--------------------+--------+
| goods_name         | cat_id |
+--------------------+--------+
| KD876              |      4 |
| 索爱原装M2卡读卡器 |     11 |
| 胜创KINGMAX内存卡  |     11 |
| 诺基亚5800XM       |      4 |
| 夏新T5             |      4 |
+--------------------+--------+
5 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=4 or cat_id=11;
+--------------------+--------+
| goods_name         | cat_id |
+--------------------+--------+
| KD876              |      4 |
| 索爱原装M2卡读卡器 |     11 |
| 胜创KINGMAX内存卡  |     11 |
| 诺基亚5800XM       |      4 |
| 夏新T5             |      4 |
+--------------------+--------+
5 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id between 4 and 11;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 索爱原装M2卡读卡器           |     11 |
| 胜创KINGMAX内存卡            |     11 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 诺基亚5800XM                 |      4 |
| 夏新T5                       |      4 |
| 诺基亚N96                    |      5 |
+------------------------------+--------+
9 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where market_price>=100 and market_price<=500;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 飞利浦9@9v                   |      3 |
| 三星BC01                     |      3 |
| 联通100元充值卡              |     15 |
+------------------------------+--------+
4 rows in set (0.00 sec)

mysql> select goods_name,market_price from goods where market_price>=100 and market_price<=500;
+------------------------------+--------------+
| goods_name                   | market_price |
+------------------------------+--------------+
| 诺基亚N85原装立体声耳机HS-82 |       120.00 |
| 飞利浦9@9v                   |       478.79 |
| 三星BC01                     |       336.00 |
| 联通100元充值卡              |       100.00 |
+------------------------------+--------------+
4 rows in set (0.00 sec)

mysql> 
mysql> select goods_name,cat_id from goods where cat_id!=4 or cat_id!=11
    -> ;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 索爱原装M2卡读卡器           |     11 |
| 胜创KINGMAX内存卡            |     11 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 飞利浦9@9v                   |      3 |
| 诺基亚E66                    |      3 |
| 索爱C702c                    |      3 |
| 索爱C702c                    |      3 |
| 摩托罗拉A810                 |      3 |
| 诺基亚5320 XpressMusic       |      3 |
| 诺基亚5800XM                 |      4 |
| 摩托罗拉A810                 |      3 |
| 恒基伟业G101                 |      2 |
| 夏新N7                       |      3 |
| 夏新T5                       |      4 |
| 三星SGH-F258                 |      3 |
| 三星BC01                     |      3 |
| 金立 A30                     |      3 |
| 多普达Touch HD               |      3 |
| 诺基亚N96                    |      5 |
| P806                         |      3 |
| 小灵通/固话50元充值卡        |     13 |
| 小灵通/固话20元充值卡        |     13 |
| 联通100元充值卡              |     15 |
| 联通50元充值卡               |     15 |
| 移动100元充值卡              |     14 |
| 移动20元充值卡               |     14 |
| 摩托罗拉E8                   |      3 |
| 诺基亚N85                    |      3 |
+------------------------------+--------+
31 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id!=4 and cat_id!=11;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 飞利浦9@9v                   |      3 |
| 诺基亚E66                    |      3 |
| 索爱C702c                    |      3 |
| 索爱C702c                    |      3 |
| 摩托罗拉A810                 |      3 |
| 诺基亚5320 XpressMusic       |      3 |
| 摩托罗拉A810                 |      3 |
| 恒基伟业G101                 |      2 |
| 夏新N7                       |      3 |
| 三星SGH-F258                 |      3 |
| 三星BC01                     |      3 |
| 金立 A30                     |      3 |
| 多普达Touch HD               |      3 |
| 诺基亚N96                    |      5 |
| P806                         |      3 |
| 小灵通/固话50元充值卡        |     13 |
| 小灵通/固话20元充值卡        |     13 |
| 联通100元充值卡              |     15 |
| 联通50元充值卡               |     15 |
| 移动100元充值卡              |     14 |
| 移动20元充值卡               |     14 |
| 摩托罗拉E8                   |      3 |
| 诺基亚N85                    |      3 |
+------------------------------+--------+
26 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id not in(4,11);
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| 诺基亚N85原装充电器          |      8 |
| 诺基亚原装5800耳机           |      8 |
| 诺基亚N85原装立体声耳机HS-82 |      8 |
| 飞利浦9@9v                   |      3 |
| 诺基亚E66                    |      3 |
| 索爱C702c                    |      3 |
| 索爱C702c                    |      3 |
| 摩托罗拉A810                 |      3 |
| 诺基亚5320 XpressMusic       |      3 |
| 摩托罗拉A810                 |      3 |
| 恒基伟业G101                 |      2 |
| 夏新N7                       |      3 |
| 三星SGH-F258                 |      3 |
| 三星BC01                     |      3 |
| 金立 A30                     |      3 |
| 多普达Touch HD               |      3 |
| 诺基亚N96                    |      5 |
| P806                         |      3 |
| 小灵通/固话50元充值卡        |     13 |
| 小灵通/固话20元充值卡        |     13 |
| 联通100元充值卡              |     15 |
| 联通50元充值卡               |     15 |
| 移动100元充值卡              |     14 |
| 移动20元充值卡               |     14 |
| 摩托罗拉E8                   |      3 |
| 诺基亚N85                    |      3 |
+------------------------------+--------+
26 rows in set (0.00 sec)

mysql> select goods_name,cat_id shop_price from goods where (shop_price>=100 and shop_price<=300) or (shop_price>=2000 and shop_price<=5000);
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| 诺基亚N85原装立体声耳机HS-82 |          8 |
| 诺基亚E66                    |          3 |
| 诺基亚5800XM                 |          4 |
| 夏新N7                       |          3 |
| 夏新T5                       |          4 |
| 三星BC01                     |          3 |
| 金立 A30                     |          3 |
| 诺基亚N96                    |          5 |
| P806                         |          3 |
| 诺基亚N85                    |          3 |
+------------------------------+------------+
10 rows in set (0.00 sec)

mysql> select goods_name,cat_id shop_price from goods where (shop_price>=100 and shop_price<=300);
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| 诺基亚N85原装立体声耳机HS-82 |          8 |
| 三星BC01                     |          3 |
+------------------------------+------------+
2 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price from goods where (shop_price>=100 and shop_price<=300) or (shop_price>=2000 and shop_price<=5000);
+------------------------------+--------+------------+
| goods_name                   | cat_id | shop_price |
+------------------------------+--------+------------+
| 诺基亚N85原装立体声耳机HS-82 |      8 |     100.00 |
| 诺基亚E66                    |      3 |    2298.00 |
| 诺基亚5800XM                 |      4 |    2625.00 |
| 夏新N7                       |      3 |    2300.00 |
| 夏新T5                       |      4 |    2878.00 |
| 三星BC01                     |      3 |     280.00 |
| 金立 A30                     |      3 |    2000.00 |
| 诺基亚N96                    |      5 |    3700.00 |
| P806                         |      3 |    2000.00 |
| 诺基亚N85                    |      3 |    3010.00 |
+------------------------------+--------+------------+
10 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price from goods where shop_price>=100 and shop_price<=300 or shop_price>=2000 and shop_price<=500
    -> 0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '0' at line 2
mysql> select goods_name,cat_id,shop_price from goods where shop_price>=100 and shop_price<=300 or shop_price>=2000 and shop_price<=5000;
+------------------------------+--------+------------+
| goods_name                   | cat_id | shop_price |
+------------------------------+--------+------------+
| 诺基亚N85原装立体声耳机HS-82 |      8 |     100.00 |
| 诺基亚E66                    |      3 |    2298.00 |
| 诺基亚5800XM                 |      4 |    2625.00 |
| 夏新N7                       |      3 |    2300.00 |
| 夏新T5                       |      4 |    2878.00 |
| 三星BC01                     |      3 |     280.00 |
| 金立 A30                     |      3 |    2000.00 |
| 诺基亚N96                    |      5 |    3700.00 |
| P806                         |      3 |    2000.00 |
| 诺基亚N85                    |      3 |    3010.00 |
+------------------------------+--------+------------+
10 rows in set (0.00 sec)

mysql> 
mysql> select goods_name from goods where cat_id=3 and shop_price>1000 and shop_price<3000 and click_count>5;
+------------------------+
| goods_name             |
+------------------------+
| 诺基亚E66              |
| 索爱C702c              |
| 诺基亚5320 XpressMusic |
| P806                   |
+------------------------+
4 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and shop_price>1000 and shop_price<3000 and click_count>5;
+------------------------+--------+------------+-------------+
| goods_name             | cat_id | shop_price | click_count |
+------------------------+--------+------------+-------------+
| 诺基亚E66              |      3 |    2298.00 |          20 |
| 索爱C702c              |      3 |    1328.00 |          11 |
| 诺基亚5320 XpressMusic |      3 |    1311.00 |          13 |
| P806                   |      3 |    2000.00 |          35 |
+------------------------+--------+------------+-------------+
4 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=3;
+------------------------+--------+
| goods_name             | cat_id |
+------------------------+--------+
| 飞利浦9@9v             |      3 |
| 诺基亚E66              |      3 |
| 索爱C702c              |      3 |
| 索爱C702c              |      3 |
| 摩托罗拉A810           |      3 |
| 诺基亚5320 XpressMusic |      3 |
| 摩托罗拉A810           |      3 |
| 夏新N7                 |      3 |
| 三星SGH-F258           |      3 |
| 三星BC01               |      3 |
| 金立 A30               |      3 |
| 多普达Touch HD         |      3 |
| P806                   |      3 |
| 摩托罗拉E8             |      3 |
| 诺基亚N85              |      3 |
+------------------------+--------+
15 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=3 and click_count>5;
+------------------------+--------+
| goods_name             | cat_id |
+------------------------+--------+
| 飞利浦9@9v             |      3 |
| 诺基亚E66              |      3 |
| 索爱C702c              |      3 |
| 摩托罗拉A810           |      3 |
| 诺基亚5320 XpressMusic |      3 |
| 摩托罗拉A810           |      3 |
| 三星SGH-F258           |      3 |
| 三星BC01               |      3 |
| 多普达Touch HD         |      3 |
| P806                   |      3 |
| 诺基亚N85              |      3 |
+------------------------+--------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id,click_count from goods where cat_id=3 and click_count>5;
+------------------------+--------+-------------+
| goods_name             | cat_id | click_count |
+------------------------+--------+-------------+
| 飞利浦9@9v             |      3 |           9 |
| 诺基亚E66              |      3 |          20 |
| 索爱C702c              |      3 |          11 |
| 摩托罗拉A810           |      3 |          13 |
| 诺基亚5320 XpressMusic |      3 |          13 |
| 摩托罗拉A810           |      3 |           8 |
| 三星SGH-F258           |      3 |           7 |
| 三星BC01               |      3 |          14 |
| 多普达Touch HD         |      3 |          15 |
| P806                   |      3 |          35 |
| 诺基亚N85              |      3 |           9 |
+------------------------+--------+-------------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and click_count>5 and shop_price>1000;
+------------------------+--------+------------+-------------+
| goods_name             | cat_id | shop_price | click_count |
+------------------------+--------+------------+-------------+
| 诺基亚E66              |      3 |    2298.00 |          20 |
| 索爱C702c              |      3 |    1328.00 |          11 |
| 诺基亚5320 XpressMusic |      3 |    1311.00 |          13 |
| 多普达Touch HD         |      3 |    5999.00 |          15 |
| P806                   |      3 |    2000.00 |          35 |
| 诺基亚N85              |      3 |    3010.00 |           9 |
+------------------------+--------+------------+-------------+
6 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and click_count>5 and (shop_price<1000 or shop_price>3000);
+----------------+--------+------------+-------------+
| goods_name     | cat_id | shop_price | click_count |
+----------------+--------+------------+-------------+
| 飞利浦9@9v     |      3 |     399.00 |           9 |
| 摩托罗拉A810   |      3 |     983.00 |          13 |
| 摩托罗拉A810   |      3 |     788.00 |           8 |
| 三星SGH-F258   |      3 |     858.00 |           7 |
| 三星BC01       |      3 |     280.00 |          14 |
| 多普达Touch HD |      3 |    5999.00 |          15 |
| 诺基亚N85      |      3 |    3010.00 |           9 |
+----------------+--------+------------+-------------+
7 rows in set (0.00 sec)

mysql> select goods_name,cat_id where cat_id=1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where cat_id=1' at line 1
mysql> select goods_name,cat_id from goods where cat_id=1;
Empty set (0.00 sec)

mysql> select * from goods where cat_id=1;
Empty set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "诺基亚%";
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| 诺基亚N85原装充电器          |      58.00 |
| 诺基亚原装5800耳机           |      68.00 |
| 诺基亚N85原装立体声耳机HS-82 |     100.00 |
| 诺基亚E66                    |    2298.00 |
| 诺基亚5320 XpressMusic       |    1311.00 |
| 诺基亚5800XM                 |    2625.00 |
| 诺基亚N96                    |    3700.00 |
| 诺基亚N85                    |    3010.00 |
+------------------------------+------------+
8 rows in set (0.01 sec)

mysql> select goods_name,shop_price from goods where goods_name like "诺基亚E66%";
+------------+------------+
| goods_name | shop_price |
+------------+------------+
| 诺基亚E66  |    2298.00 |
+------------+------------+
1 row in set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "诺基亚__";
Empty set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "诺基亚___";
+------------+------------+
| goods_name | shop_price |
+------------+------------+
| 诺基亚E66  |    2298.00 |
| 诺基亚N96  |    3700.00 |
| 诺基亚N85  |    3010.00 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> select * from goods where 1>2;
Empty set (0.00 sec)

mysql> 
mysql> select * from goods where 1<2;
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name                   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|        1 |      4 | ECS000000 | KD876                        |           7 |            1 |      1665.60 |    1388.00 | 1240902890 |       1 |      1 |      1 |
|        4 |      8 | ECS000004 | 诺基亚N85原装充电器          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | 诺基亚原装5800耳机           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | 索爱原装M2卡读卡器           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | 胜创KINGMAX内存卡            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | 诺基亚N85原装立体声耳机HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | 飞利浦9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | 诺基亚E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | 索爱C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | 索爱C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | 摩托罗拉A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | 诺基亚5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | 诺基亚5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | 摩托罗拉A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | 恒基伟业G101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | 夏新N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | 夏新T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | 三星SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | 三星BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | 金立 A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | 多普达Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | 诺基亚N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | 小灵通/固话50元充值卡        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | 小灵通/固话20元充值卡        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | 联通100元充值卡              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | 联通50元充值卡               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | 移动100元充值卡              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | 移动20元充值卡               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | 摩托罗拉E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | 诺基亚N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select * from goods where 1+2;
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name                   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|        1 |      4 | ECS000000 | KD876                        |           7 |            1 |      1665.60 |    1388.00 | 1240902890 |       1 |      1 |      1 |
|        4 |      8 | ECS000004 | 诺基亚N85原装充电器          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | 诺基亚原装5800耳机           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | 索爱原装M2卡读卡器           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | 胜创KINGMAX内存卡            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | 诺基亚N85原装立体声耳机HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | 飞利浦9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | 诺基亚E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | 索爱C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | 索爱C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | 摩托罗拉A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | 诺基亚5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | 诺基亚5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | 摩托罗拉A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | 恒基伟业G101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | 夏新N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | 夏新T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | 三星SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | 三星BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | 金立 A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | 多普达Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | 诺基亚N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | 小灵通/固话50元充值卡        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | 小灵通/固话20元充值卡        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | 联通100元充值卡              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | 联通50元充值卡               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | 移动100元充值卡              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | 移动20元充值卡               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | 摩托罗拉E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | 诺基亚N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select * from goods where cat_id=2;;
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       16 |      2 | ECS000016 | 恒基伟业G101 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

ERROR: 
No query specified

mysql> select * from goods where cat_id=2;
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       16 |      2 | ECS000016 | 恒基伟业G101 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select goods_id,goods_name,market_price-shop_price as descount from goods;
+----------+------------------------------+----------+
| goods_id | goods_name                   | descount |
+----------+------------------------------+----------+
|        1 | KD876                        |   277.60 |
|        4 | 诺基亚N85原装充电器          |    11.60 |
|        3 | 诺基亚原装5800耳机           |    13.60 |
|        5 | 索爱原装M2卡读卡器           |     4.00 |
|        6 | 胜创KINGMAX内存卡            |     8.40 |
|        7 | 诺基亚N85原装立体声耳机HS-82 |    20.00 |
|        8 | 飞利浦9@9v                   |    79.79 |
|        9 | 诺基亚E66                    |   459.60 |
|       10 | 索爱C702c                    |   265.60 |
|       11 | 索爱C702c                    | -1300.00 |
|       12 | 摩托罗拉A810                 |   196.60 |
|       13 | 诺基亚5320 XpressMusic       |   262.20 |
|       14 | 诺基亚5800XM                 |   525.00 |
|       15 | 摩托罗拉A810                 |   157.60 |
|       16 | 恒基伟业G101                 |   164.67 |
|       17 | 夏新N7                       |   460.00 |
|       18 | 夏新T5                       |   575.60 |
|       19 | 三星SGH-F258                 |   171.60 |
|       20 | 三星BC01                     |    56.00 |
|       21 | 金立 A30                     |   400.00 |
|       22 | 多普达Touch HD               |  1199.80 |
|       23 | 诺基亚N96                    |   740.00 |
|       24 | P806                         |   400.00 |
|       25 | 小灵通/固话50元充值卡        |     9.59 |
|       26 | 小灵通/固话20元充值卡        |     3.80 |
|       27 | 联通100元充值卡              |     5.00 |
|       28 | 联通50元充值卡               |     5.00 |
|       29 | 移动100元充值卡              |   -90.00 |
|       30 | 移动20元充值卡               |     3.00 |
|       31 | 摩托罗拉E8                   |   267.39 |
|       32 | 诺基亚N85                    |   602.00 |
+----------+------------------------------+----------+
31 rows in set (0.30 sec)

mysql> select goods_id,goods_name,market_price-shop_price as descount from goods where descount>200;
ERROR 1054 (42S22): Unknown column 'descount' in 'where clause'
mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods where descount>200;
ERROR 1054 (42S22): Unknown column 'descount' in 'where clause'
mysql> select goods_id,goods_name,discount from goods where market_price-shop_price as discount>200;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as discount>200' at line 1
mysql> select goods_id,goods_name,discount from goods where (market_price-shop_price as discount)>200;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as discount)>200' at line 1
mysql> select goods_id,goods_name,discount from goods where (market_price-shop_price discount)>200 as dicount;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'discount)>200 as dicount' at line 1
mysql> select goods_id,goods_name,discount from goods where (market_price-shop_price discount)>200;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'discount)>200' at line 1
mysql> select goods_id,goods_name from goods where (market_price-shop_price discount)>200;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'discount)>200' at line 1
mysql> select goods_id,goods_name from goods where (market_price-shop_price)>200;
+----------+------------------------+
| goods_id | goods_name             |
+----------+------------------------+
|        1 | KD876                  |
|        9 | 诺基亚E66              |
|       10 | 索爱C702c              |
|       13 | 诺基亚5320 XpressMusic |
|       14 | 诺基亚5800XM           |
|       17 | 夏新N7                 |
|       18 | 夏新T5                 |
|       21 | 金立 A30               |
|       22 | 多普达Touch HD         |
|       23 | 诺基亚N96              |
|       24 | P806                   |
|       31 | 摩托罗拉E8             |
|       32 | 诺基亚N85              |
+----------+------------------------+
13 rows in set (0.00 sec)

mysql> select goods_id,goods_name from goods where (market_price-shop_price)>200 as discount;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as discount' at line 1
mysql> select @discount=1;
+-------------+
| @discount=1 |
+-------------+
|        NULL |
+-------------+
1 row in set (0.06 sec)

mysql> select @discount as 1;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1' at line 1
ERROR: 
No query specified

mysql> select @discount as 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1' at line 1
mysql> select @discount=1;
+-------------+
| @discount=1 |
+-------------+
|        NULL |
+-------------+
1 row in set (0.00 sec)

mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods where descount>200;
ERROR 1054 (42S22): Unknown column 'descount' in 'where clause'
mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods where (market_price-shop_price)>200;
+----------+------------------------+----------+
| goods_id | goods_name             | descount |
+----------+------------------------+----------+
|        1 | KD876                  |   277.60 |
|        9 | 诺基亚E66              |   459.60 |
|       10 | 索爱C702c              |   265.60 |
|       13 | 诺基亚5320 XpressMusic |   262.20 |
|       14 | 诺基亚5800XM           |   525.00 |
|       17 | 夏新N7                 |   460.00 |
|       18 | 夏新T5                 |   575.60 |
|       21 | 金立 A30               |   400.00 |
|       22 | 多普达Touch HD         |  1199.80 |
|       23 | 诺基亚N96              |   740.00 |
|       24 | P806                   |   400.00 |
|       31 | 摩托罗拉E8             |   267.39 |
|       32 | 诺基亚N85              |   602.00 |
+----------+------------------------+----------+
13 rows in set (0.00 sec)

mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods having decouont>200;
ERROR 1054 (42S22): Unknown column 'decouont' in 'having clause'
mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods having decount>200;
ERROR 1054 (42S22): Unknown column 'decount' in 'having clause'
mysql> select goods_id,goods_name,(market_price-shop_price) as descount from goods having descount>200;
+----------+------------------------+----------+
| goods_id | goods_name             | descount |
+----------+------------------------+----------+
|        1 | KD876                  |   277.60 |
|        9 | 诺基亚E66              |   459.60 |
|       10 | 索爱C702c              |   265.60 |
|       13 | 诺基亚5320 XpressMusic |   262.20 |
|       14 | 诺基亚5800XM           |   525.00 |
|       17 | 夏新N7                 |   460.00 |
|       18 | 夏新T5                 |   575.60 |
|       21 | 金立 A30               |   400.00 |
|       22 | 多普达Touch HD         |  1199.80 |
|       23 | 诺基亚N96              |   740.00 |
|       24 | P806                   |   400.00 |
|       31 | 摩托罗拉E8             |   267.39 |
|       32 | 诺基亚N85              |   602.00 |
+----------+------------------------+----------+
13 rows in set (0.00 sec)

mysql> create table mian(
    -> num tinyint
    -> );
Query OK, 0 rows affected (0.46 sec)

mysql> insert into mian values
    -> (3),(12),(15),(15),(23),(29),(34),(37),(32),(45),(48),(52); 
Query OK, 12 rows affected (0.12 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from mian;
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   15 |
|   23 |
|   29 |
|   34 |
|   37 |
|   32 |
|   45 |
|   48 |
|   52 |
+------+
12 rows in set (0.00 sec)

mysql> update mian set
    -> num=20 where num>=20 and num<=29;
Query OK, 2 rows affected (0.06 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update mian set
    -> num=30 where num>=30 and num<=39;
Query OK, 3 rows affected (0.06 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from mian;
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   15 |
|   20 |
|   20 |
|   30 |
|   30 |
|   30 |
|   45 |
|   48 |
|   52 |
+------+
12 rows in set (0.00 sec)

mysql> drop table mian;
Query OK, 0 rows affected (0.17 sec)

mysql> create table mian(
    -> num tinyint
    -> );
Query OK, 0 rows affected (0.25 sec)

mysql> select * from mian;
Empty set (0.00 sec)

mysql> insert into mian values
    -> (3),(12),(15),(15),(23),(29),(34),(37),(32),(45),(48),(52); 
Query OK, 12 rows affected (0.03 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from mian;
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   15 |
|   23 |
|   29 |
|   34 |
|   37 |
|   32 |
|   45 |
|   48 |
|   52 |
+------+
12 rows in set (0.00 sec)

mysql> update mian set
    -> num=num-num%10 where num>=20 and num<=39;
Query OK, 5 rows affected (0.06 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> select * from mian;
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   15 |
|   20 |
|   20 |
|   30 |
|   30 |
|   30 |
|   45 |
|   48 |
|   52 |
+------+
12 rows in set (0.00 sec)

mysql> select * from goods;
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name                   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|        1 |      4 | ECS000000 | KD876                        |           7 |            1 |      1665.60 |    1388.00 | 1240902890 |       1 |      1 |      1 |
|        4 |      8 | ECS000004 | 诺基亚N85原装充电器          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | 诺基亚原装5800耳机           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | 索爱原装M2卡读卡器           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | 胜创KINGMAX内存卡            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | 诺基亚N85原装立体声耳机HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | 飞利浦9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | 诺基亚E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | 索爱C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | 索爱C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | 摩托罗拉A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | 诺基亚5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | 诺基亚5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | 摩托罗拉A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | 恒基伟业G101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | 夏新N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | 夏新T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | 三星SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | 三星BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | 金立 A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | 多普达Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | 诺基亚N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | 小灵通/固话50元充值卡        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | 小灵通/固话20元充值卡        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | 联通100元充值卡              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | 联通50元充值卡               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | 移动100元充值卡              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | 移动20元充值卡               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | 摩托罗拉E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | 诺基亚N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select goods_name,shop_price from goods order by shop_price desc limit 1;
+----------------+------------+
| goods_name     | shop_price |
+----------------+------------+
| 多普达Touch HD |    5999.00 |
+----------------+------------+
1 row in set (0.00 sec)

mysql> select max(shop_price) from goods ;
+-----------------+
| max(shop_price) |
+-----------------+
|         5999.00 |
+-----------------+
1 row in set (0.00 sec)

mysql> select min(shop_price) from goods ;
+-----------------+
| min(shop_price) |
+-----------------+
|           18.00 |
+-----------------+
1 row in set (0.05 sec)

mysql> select min(goods_id) from goods;
+---------------+
| min(goods_id) |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)

mysql> select count(*) from goods;
+----------+
| count(*) |
+----------+
|       31 |
+----------+
1 row in set (0.00 sec)

mysql> select sum(goods_num) from goods;
ERROR 1054 (42S22): Unknown column 'goods_num' in 'field list'
mysql> select sum(goods_number) from goods;
+-------------------+
| sum(goods_number) |
+-------------------+
|               313 |
+-------------------+
1 row in set (0.00 sec)

mysql> selecct avg(shop_price） from goods;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selecct avg(shop_price） from goods' at line 1
mysql> select avg(shop_price） from goods;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from goods' at line 1
mysql> select avg(shop_price) from goods;
+-----------------+
| avg(shop_price) |
+-----------------+
|     1232.526774 |
+-----------------+
1 row in set (0.00 sec)

mysql> select avg(shop_price)  from goods;
+-----------------+
| avg(shop_price) |
+-----------------+
|     1232.526774 |
+-----------------+
1 row in set (0.00 sec)

mysql> select count(1) from goods;
+----------+
| count(1) |
+----------+
|       31 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from goods;
+----------+
| count(*) |
+----------+
|       31 |
+----------+
1 row in set (0.00 sec)

mysql> select count(goods_name) from goods;
+-------------------+
| count(goods_name) |
+-------------------+
|                31 |
+-------------------+
1 row in set (0.00 sec)

mysql> select sum(goods_num) from goods where cat_id=3;
ERROR 1054 (42S22): Unknown column 'goods_num' in 'field list'
mysql> select sum(goods_number) from goods where cat_id=3;
+-------------------+
| sum(goods_number) |
+-------------------+
|               203 |
+-------------------+
1 row in set (0.00 sec)

mysql> select sum(goods_number) from goods group by cat_id;
+-------------------+
| sum(goods_number) |
+-------------------+
|                 0 |
|               203 |
|                 3 |
|                 8 |
|                61 |
|                23 |
|                 4 |
|                 9 |
|                 2 |
+-------------------+
9 rows in set (0.00 sec)

mysql> select cat_id,sum(goods_number)as sum from goods group by cat_id;
+--------+------+
| cat_id | sum  |
+--------+------+
|      2 |    0 |
|      3 |  203 |
|      4 |    3 |
|      5 |    8 |
|      8 |   61 |
|     11 |   23 |
|     13 |    4 |
|     14 |    9 |
|     15 |    2 |
+--------+------+
9 rows in set (0.00 sec)

mysql> select cat_id,sum(goods_number)as sum from goods group by cat_id;
+--------+------+
| cat_id | sum  |
+--------+------+
|      2 |    0 |
|      3 |  203 |
|      4 |    3 |
|      5 |    8 |
|      8 |   61 |
|     11 |   23 |
|     13 |    4 |
|     14 |    9 |
|     15 |    2 |
+--------+------+
9 rows in set (0.00 sec)

mysql> select goods_id,(mark_price-shop_price) as discount from goods having discount>200;
ERROR 1054 (42S22): Unknown column 'mark_price' in 'field list'
mysql> select goods_id,(market_price-shop_price) as discount from goods having discount>200;
+----------+----------+
| goods_id | discount |
+----------+----------+
|        1 |   277.60 |
|        9 |   459.60 |
|       10 |   265.60 |
|       13 |   262.20 |
|       14 |   525.00 |
|       17 |   460.00 |
|       18 |   575.60 |
|       21 |   400.00 |
|       22 |  1199.80 |
|       23 |   740.00 |
|       24 |   400.00 |
|       31 |   267.39 |
|       32 |   602.00 |
+----------+----------+
13 rows in set (0.00 sec)

mysql> select good_name,(good_number*shop_price) as sum_money from  goods;
ERROR 1054 (42S22): Unknown column 'good_name' in 'field list'
mysql> select goods_name,(goods_number*shop_price) as sum_money from  goods;
+------------------------------+-----------+
| goods_name                   | sum_money |
+------------------------------+-----------+
| KD876                        |   1388.00 |
| 诺基亚N85原装充电器          |    986.00 |
| 诺基亚原装5800耳机           |   1632.00 |
| 索爱原装M2卡读卡器           |    160.00 |
| 胜创KINGMAX内存卡            |    630.00 |
| 诺基亚N85原装立体声耳机HS-82 |   2000.00 |
| 飞利浦9@9v                   |    399.00 |
| 诺基亚E66                    |   9192.00 |
| 索爱C702c                    |   9296.00 |
| 索爱C702c                    |   1300.00 |
| 摩托罗拉A810                 |   7864.00 |
| 诺基亚5320 XpressMusic       |  10488.00 |
| 诺基亚5800XM                 |   2625.00 |
| 摩托罗拉A810                 |   2364.00 |
| 恒基伟业G101                 |      0.00 |
| 夏新N7                       |   2300.00 |
| 夏新T5                       |   2878.00 |
| 三星SGH-F258                 |  10296.00 |
| 三星BC01                     |   3360.00 |
| 金立 A30                     |  80000.00 |
| 多普达Touch HD               |   5999.00 |
| 诺基亚N96                    |  29600.00 |
| P806                         | 200000.00 |
| 小灵通/固话50元充值卡        |     96.00 |
| 小灵通/固话20元充值卡        |     38.00 |
| 联通100元充值卡              |    190.00 |
| 联通50元充值卡               |      0.00 |
| 移动100元充值卡              |      0.00 |
| 移动20元充值卡               |    162.00 |
| 摩托罗拉E8                   |   1337.00 |
| 诺基亚N85                    |  12040.00 |
+------------------------------+-----------+
31 rows in set (0.00 sec)

mysql> select sum(shop_price*goods_number);
ERROR 1054 (42S22): Unknown column 'shop_price' in 'field list'
mysql> select sum(shop_price*goods_number) from goods;
+------------------------------+
| sum(shop_price*goods_number) |
+------------------------------+
|                    398620.00 |
+------------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> select sum(sum_money) from (
    -> select shop_price*goods_number from goods);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select sum(sum_money) from (
    -> select (shop_price*goods_number) as sum_money from goods);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select cat_id,(goods_number*shop_price) as sum_money from goods group by cat_id;
+--------+-----------+
| cat_id | sum_money |
+--------+-----------+
|      2 |      0.00 |
|      3 |    399.00 |
|      4 |   1388.00 |
|      5 |  29600.00 |
|      8 |    986.00 |
|     11 |    160.00 |
|     13 |     96.00 |
|     14 |      0.00 |
|     15 |    190.00 |
+--------+-----------+
9 rows in set (0.00 sec)

mysql> 
mysql> select cat_id,sum(goods_number*shop_price) as sum_money from goods group by cat_id;
+--------+-----------+
| cat_id | sum_money |
+--------+-----------+
|      2 |      0.00 |
|      3 | 356235.00 |
|      4 |   6891.00 |
|      5 |  29600.00 |
|      8 |   4618.00 |
|     11 |    790.00 |
|     13 |    134.00 |
|     14 |    162.00 |
|     15 |    190.00 |
+--------+-----------+
9 rows in set (0.00 sec)

mysql> select cat_id,sum(goods_number*shop_price) as sum_money from goods group by cat_id having sum_money>20000;
+--------+-----------+
| cat_id | sum_money |
+--------+-----------+
|      3 | 356235.00 |
|      5 |  29600.00 |
+--------+-----------+
2 rows in set (0.00 sec)

mysql> #查询出积压金额，且大于20000的商品类
mysql> select goods_name,(market_price-shop_price) as discount from goods having discount>200;
+------------------------+----------+
| goods_name             | discount |
+------------------------+----------+
| KD876                  |   277.60 |
| 诺基亚E66              |   459.60 |
| 索爱C702c              |   265.60 |
| 诺基亚5320 XpressMusic |   262.20 |
| 诺基亚5800XM           |   525.00 |
| 夏新N7                 |   460.00 |
| 夏新T5                 |   575.60 |
| 金立 A30               |   400.00 |
| 多普达Touch HD         |  1199.80 |
| 诺基亚N96              |   740.00 |
| P806                   |   400.00 |
| 摩托罗拉E8             |   267.39 |
| 诺基亚N85              |   602.00 |
+------------------------+----------+
13 rows in set (0.00 sec)

mysql> select goods_name,(market_price-shop_price) as discount from goods having (market_price-shop_price)>200;
ERROR 1054 (42S22): Unknown column 'market_price' in 'having clause'
mysql> select goods_name,(market_price-shop_price) as discount from goods where (market_price-shop_price)>200;
+------------------------+----------+
| goods_name             | discount |
+------------------------+----------+
| KD876                  |   277.60 |
| 诺基亚E66              |   459.60 |
| 索爱C702c              |   265.60 |
| 诺基亚5320 XpressMusic |   262.20 |
| 诺基亚5800XM           |   525.00 |
| 夏新N7                 |   460.00 |
| 夏新T5                 |   575.60 |
| 金立 A30               |   400.00 |
| 多普达Touch HD         |  1199.80 |
| 诺基亚N96              |   740.00 |
| P806                   |   400.00 |
| 摩托罗拉E8             |   267.39 |
| 诺基亚N85              |   602.00 |
+------------------------+----------+
13 rows in set (0.00 sec)

mysql> create table result(
    -> name char(20) not null defult "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'defult "",
subject char(20) not null default "",
score tinyint unsigned not null' at line 2
mysql> create table result(
    -> name char(20) not null default "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> );
Query OK, 0 rows affected (0.26 sec)

mysql> desc result;
+---------+---------------------+------+-----+---------+-------+
| Field   | Type                | Null | Key | Default | Extra |
+---------+---------------------+------+-----+---------+-------+
| name    | char(20)            | NO   |     |         |       |
| subject | char(20)            | NO   |     |         |       |
| score   | tinyint(3) unsigned | NO   |     | 0       |       |
+---------+---------------------+------+-----+---------+-------+
3 rows in set (0.06 sec)

mysql> insert into result 
    -> values
    -> ("张三","数学",90),("张三","语文",80),("张三","地理",40),("李四","语文",55),("李四","政治",45),("王五","政治",30);
Query OK, 6 rows affected, 12 warnings (0.08 sec)
Records: 6  Duplicates: 0  Warnings: 12

mysql> select * from result;
+------+---------+-------+
| name | subject | score |
+------+---------+-------+
| ??   | ??      |    90 |
| ??   | ??      |    80 |
| ??   | ??      |    40 |
| ??   | ??      |    55 |
| ??   | ??      |    45 |
| ??   | ??      |    30 |
+------+---------+-------+
6 rows in set (0.00 sec)

mysql> create table result(
    -> name char(20) not null default "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> );
ERROR 1050 (42S01): Table 'result' already exists
mysql> drop table result;
Query OK, 0 rows affected (0.14 sec)

mysql> create table result(
    -> name char(20) not null default "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> )engine myisam charsert utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'charsert utf8' at line 5
mysql> create table result(
    -> name char(20) not null default "",
    -> subject char(20) not null default "",
    -> score tinyint unsigned not null default 0
    -> )engine myisam charset utf8;
Query OK, 0 rows affected (0.38 sec)

mysql> ("张三","数学",90),("张三","语文",80),("张三","地理",40),("李四","语文",55),("李四","政治",45),("王五","政治",30);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"张三","数学",90),("张三","语文",80),("张三","地理",40),("李四","' at line 1
mysql> insert into result 
    -> values
    -> ("张三","数学",90),("张三","语文",80),("张三","地理",40),("李四","语文",55),("李四","政治",45),("王五","政治",30);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from result;
+------+---------+-------+
| name | subject | score |
+------+---------+-------+
| 张三 | 数学    |    90 |
| 张三 | 语文    |    80 |
| 张三 | 地理    |    40 |
| 李四 | 语文    |    55 |
| 李四 | 政治    |    45 |
| 王五 | 政治    |    30 |
+------+---------+-------+
6 rows in set (0.00 sec)

mysql> select name,avg(score) group by name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group by name' at line 1
mysql> select name,avg(score) form result group by name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'result group by name' at line 1
mysql> select name,avg(score) from result group by name;
+------+------------+
| name | avg(score) |
+------+------------+
| 张三 |    70.0000 |
| 李四 |    50.0000 |
| 王五 |    30.0000 |
+------+------------+
3 rows in set (0.05 sec)

mysql> select name,avg(score) from result group by name having score<60;
ERROR 1054 (42S22): Unknown column 'score' in 'having clause'
mysql> select name,avg(score),score from result group by name;
+------+------------+-------+
| name | avg(score) | score |
+------+------------+-------+
| 张三 |    70.0000 |    90 |
| 李四 |    50.0000 |    55 |
| 王五 |    30.0000 |    30 |
+------+------------+-------+
3 rows in set (0.00 sec)

mysql> select name,avg(score),score from result group by name;
+------+------------+-------+
| name | avg(score) | score |
+------+------------+-------+
| 张三 |    70.0000 |    90 |
| 李四 |    50.0000 |    55 |
| 王五 |    30.0000 |    30 |
+------+------------+-------+
3 rows in set (0.00 sec)

mysql> select name,subject,score<60 from result;
+------+---------+----------+
| name | subject | score<60 |
+------+---------+----------+
| 张三 | 数学    |        0 |
| 张三 | 语文    |        0 |
| 张三 | 地理    |        1 |
| 李四 | 语文    |        1 |
| 李四 | 政治    |        1 |
| 王五 | 政治    |        1 |
+------+---------+----------+
6 rows in set (0.00 sec)

mysql> select name,avg(score),sum(score<60) as cont from result group by name where cont>=2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where cont>=2' at line 1
mysql> select name,avg(score),sum(score<60) as cont from result group by name having cont>=2;
+------+------------+------+
| name | avg(score) | cont |
+------+------------+------+
| 李四 |    50.0000 |    2 |
+------+------------+------+
1 row in set (0.00 sec)

mysql> select name,count(1) where score<60 group by name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where score<60 group by name' at line 1
mysql> select name,count(1) from result where score<60 group by name;
+------+----------+
| name | count(1) |
+------+----------+
| 张三 |        1 |
| 李四 |        2 |
| 王五 |        1 |
+------+----------+
3 rows in set (0.00 sec)

mysql> select name from result where score<60 group by name;
+------+
| name |
+------+
| 张三 |
| 李四 |
| 王五 |
+------+
3 rows in set (0.00 sec)

mysql> select name,score from result where score<60;
+------+-------+
| name | score |
+------+-------+
| 张三 |    40 |
| 李四 |    55 |
| 李四 |    45 |
| 王五 |    30 |
+------+-------+
4 rows in set (0.00 sec)

mysql> select name,score,count(1) from result where score<60;
+------+-------+----------+
| name | score | count(1) |
+------+-------+----------+
| 张三 |    40 |        4 |
+------+-------+----------+
1 row in set (0.00 sec)

mysql> select name,score,count(1) from result where score<60 group by name;
+------+-------+----------+
| name | score | count(1) |
+------+-------+----------+
| 张三 |    40 |        1 |
| 李四 |    55 |        2 |
| 王五 |    30 |        1 |
+------+-------+----------+
3 rows in set (0.00 sec)

mysql> select name,score,count(1) as g from result where score<60 group by name having g>=2;
+------+-------+---+
| name | score | g |
+------+-------+---+
| 李四 |    55 | 2 |
+------+-------+---+
1 row in set (0.00 sec)

mysql> select name,avg(score) from (
    -> \c
mysql> select name avg(score) from tmp(
    -> select name where score<60 and count(1)=2 group by name) as tmp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(score) from tmp(
select name where score<60 and count(1)=2 group by name) as tm' at line 1
mysql> select name avg(score) from (
    -> select name where score<60 and count(1)=2 group by name) as tmp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(score) from (
select name where score<60 and count(1)=2 group by name) as tmp' at line 1
mysql> select name from (
    -> select name from result where score<60 and count(1)=2 group by name) as tmp;
ERROR 1111 (HY000): Invalid use of group function
mysql> select name from (
    -> select name,count(i) as g from result where score<60 group by name having g>=2) as tmp;
ERROR 1054 (42S22): Unknown column 'i' in 'field list'
mysql> select name from (
    -> select name,count(1) as g from result where score<60 group by name having g>=2) as tmp;
+------+
| name |
+------+
| 李四 |
+------+
1 row in set (0.05 sec)

mysql> select add_time from goods;
+------------+
| add_time   |
+------------+
| 1240902890 |
| 1241422402 |
| 1241422082 |
| 1241422518 |
| 1241422573 |
| 1241422785 |
| 1241425512 |
| 1241511871 |
| 1241965622 |
| 1241966951 |
| 1245297652 |
| 1241967762 |
| 1241968492 |
| 1241968703 |
| 1241968949 |
| 1241969394 |
| 1241969533 |
| 1241970139 |
| 1241970417 |
| 1241970634 |
| 1241971076 |
| 1241971488 |
| 1241971981 |
| 1241972709 |
| 1241972789 |
| 1241972894 |
| 1241972976 |
| 1241973022 |
| 1241973114 |
| 1242110412 |
| 1242110760 |
+------------+
31 rows in set (0.00 sec)

mysql> select add_time from goods order by add_time desc;
+------------+
| add_time   |
+------------+
| 1245297652 |
| 1242110760 |
| 1242110412 |
| 1241973114 |
| 1241973022 |
| 1241972976 |
| 1241972894 |
| 1241972789 |
| 1241972709 |
| 1241971981 |
| 1241971488 |
| 1241971076 |
| 1241970634 |
| 1241970417 |
| 1241970139 |
| 1241969533 |
| 1241969394 |
| 1241968949 |
| 1241968703 |
| 1241968492 |
| 1241967762 |
| 1241966951 |
| 1241965622 |
| 1241511871 |
| 1241425512 |
| 1241422785 |
| 1241422573 |
| 1241422518 |
| 1241422402 |
| 1241422082 |
| 1240902890 |
+------------+
31 rows in set (0.00 sec)

mysql> select add_time from goods order by add_time asc;
+------------+
| add_time   |
+------------+
| 1240902890 |
| 1241422082 |
| 1241422402 |
| 1241422518 |
| 1241422573 |
| 1241422785 |
| 1241425512 |
| 1241511871 |
| 1241965622 |
| 1241966951 |
| 1241967762 |
| 1241968492 |
| 1241968703 |
| 1241968949 |
| 1241969394 |
| 1241969533 |
| 1241970139 |
| 1241970417 |
| 1241970634 |
| 1241971076 |
| 1241971488 |
| 1241971981 |
| 1241972709 |
| 1241972789 |
| 1241972894 |
| 1241972976 |
| 1241973022 |
| 1241973114 |
| 1242110412 |
| 1242110760 |
| 1245297652 |
+------------+
31 rows in set (0.00 sec)

mysql> select goods_name,add_time from goods order by add_time asc;
+------------------------------+------------+
| goods_name                   | add_time   |
+------------------------------+------------+
| KD876                        | 1240902890 |
| 诺基亚原装5800耳机           | 1241422082 |
| 诺基亚N85原装充电器          | 1241422402 |
| 索爱原装M2卡读卡器           | 1241422518 |
| 胜创KINGMAX内存卡            | 1241422573 |
| 诺基亚N85原装立体声耳机HS-82 | 1241422785 |
| 飞利浦9@9v                   | 1241425512 |
| 诺基亚E66                    | 1241511871 |
| 索爱C702c                    | 1241965622 |
| 索爱C702c                    | 1241966951 |
| 诺基亚5320 XpressMusic       | 1241967762 |
| 诺基亚5800XM                 | 1241968492 |
| 摩托罗拉A810                 | 1241968703 |
| 恒基伟业G101                 | 1241968949 |
| 夏新N7                       | 1241969394 |
| 夏新T5                       | 1241969533 |
| 三星SGH-F258                 | 1241970139 |
| 三星BC01                     | 1241970417 |
| 金立 A30                     | 1241970634 |
| 多普达Touch HD               | 1241971076 |
| 诺基亚N96                    | 1241971488 |
| P806                         | 1241971981 |
| 小灵通/固话50元充值卡        | 1241972709 |
| 小灵通/固话20元充值卡        | 1241972789 |
| 联通100元充值卡              | 1241972894 |
| 联通50元充值卡               | 1241972976 |
| 移动100元充值卡              | 1241973022 |
| 移动20元充值卡               | 1241973114 |
| 摩托罗拉E8                   | 1242110412 |
| 诺基亚N85                    | 1242110760 |
| 摩托罗拉A810                 | 1245297652 |
+------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id,goods_name,add_time from goods order by add_time asc;
+----------+------------------------------+------------+
| goods_id | goods_name                   | add_time   |
+----------+------------------------------+------------+
|        1 | KD876                        | 1240902890 |
|        3 | 诺基亚原装5800耳机           | 1241422082 |
|        4 | 诺基亚N85原装充电器          | 1241422402 |
|        5 | 索爱原装M2卡读卡器           | 1241422518 |
|        6 | 胜创KINGMAX内存卡            | 1241422573 |
|        7 | 诺基亚N85原装立体声耳机HS-82 | 1241422785 |
|        8 | 飞利浦9@9v                   | 1241425512 |
|        9 | 诺基亚E66                    | 1241511871 |
|       10 | 索爱C702c                    | 1241965622 |
|       11 | 索爱C702c                    | 1241966951 |
|       13 | 诺基亚5320 XpressMusic       | 1241967762 |
|       14 | 诺基亚5800XM                 | 1241968492 |
|       15 | 摩托罗拉A810                 | 1241968703 |
|       16 | 恒基伟业G101                 | 1241968949 |
|       17 | 夏新N7                       | 1241969394 |
|       18 | 夏新T5                       | 1241969533 |
|       19 | 三星SGH-F258                 | 1241970139 |
|       20 | 三星BC01                     | 1241970417 |
|       21 | 金立 A30                     | 1241970634 |
|       22 | 多普达Touch HD               | 1241971076 |
|       23 | 诺基亚N96                    | 1241971488 |
|       24 | P806                         | 1241971981 |
|       25 | 小灵通/固话50元充值卡        | 1241972709 |
|       26 | 小灵通/固话20元充值卡        | 1241972789 |
|       27 | 联通100元充值卡              | 1241972894 |
|       28 | 联通50元充值卡               | 1241972976 |
|       29 | 移动100元充值卡              | 1241973022 |
|       30 | 移动20元充值卡               | 1241973114 |
|       31 | 摩托罗拉E8                   | 1242110412 |
|       32 | 诺基亚N85                    | 1242110760 |
|       12 | 摩托罗拉A810                 | 1245297652 |
+----------+------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id,goods_name,add_time,shop_price from goods order by add_time asc,shop_price desc;
+----------+------------------------------+------------+------------+
| goods_id | goods_name                   | add_time   | shop_price |
+----------+------------------------------+------------+------------+
|        1 | KD876                        | 1240902890 |    1388.00 |
|        3 | 诺基亚原装5800耳机           | 1241422082 |      68.00 |
|        4 | 诺基亚N85原装充电器          | 1241422402 |      58.00 |
|        5 | 索爱原装M2卡读卡器           | 1241422518 |      20.00 |
|        6 | 胜创KINGMAX内存卡            | 1241422573 |      42.00 |
|        7 | 诺基亚N85原装立体声耳机HS-82 | 1241422785 |     100.00 |
|        8 | 飞利浦9@9v                   | 1241425512 |     399.00 |
|        9 | 诺基亚E66                    | 1241511871 |    2298.00 |
|       10 | 索爱C702c                    | 1241965622 |    1328.00 |
|       11 | 索爱C702c                    | 1241966951 |    1300.00 |
|       13 | 诺基亚5320 XpressMusic       | 1241967762 |    1311.00 |
|       14 | 诺基亚5800XM                 | 1241968492 |    2625.00 |
|       15 | 摩托罗拉A810                 | 1241968703 |     788.00 |
|       16 | 恒基伟业G101                 | 1241968949 |     823.33 |
|       17 | 夏新N7                       | 1241969394 |    2300.00 |
|       18 | 夏新T5                       | 1241969533 |    2878.00 |
|       19 | 三星SGH-F258                 | 1241970139 |     858.00 |
|       20 | 三星BC01                     | 1241970417 |     280.00 |
|       21 | 金立 A30                     | 1241970634 |    2000.00 |
|       22 | 多普达Touch HD               | 1241971076 |    5999.00 |
|       23 | 诺基亚N96                    | 1241971488 |    3700.00 |
|       24 | P806                         | 1241971981 |    2000.00 |
|       25 | 小灵通/固话50元充值卡        | 1241972709 |      48.00 |
|       26 | 小灵通/固话20元充值卡        | 1241972789 |      19.00 |
|       27 | 联通100元充值卡              | 1241972894 |      95.00 |
|       28 | 联通50元充值卡               | 1241972976 |      45.00 |
|       29 | 移动100元充值卡              | 1241973022 |      90.00 |
|       30 | 移动20元充值卡               | 1241973114 |      18.00 |
|       31 | 摩托罗拉E8                   | 1242110412 |    1337.00 |
|       32 | 诺基亚N85                    | 1242110760 |    3010.00 |
|       12 | 摩托罗拉A810                 | 1245297652 |     983.00 |
+----------+------------------------------+------------+------------+
31 rows in set (0.00 sec)

