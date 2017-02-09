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

mysql> insert into test3 ("�Ź���","1961-03-12");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"�Ź���","1961-03-12")' at line 1
mysql> insert into test3 values ("�Ź���","1961-03-12");
Query OK, 1 row affected (0.00 sec)

mysql> select * from test3;
+--------+------------+
| star   | birth      |
+--------+------------+
| �Ź��� | 1961-03-12 |
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
| �Ź��� | 1961-03-12 | 00:00:00 |
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
    -> ("����","2009-10-12 15:34:45");
Query OK, 1 row affected (0.00 sec)

mysql> select * from test4;
+-------+---------------------+
| sname | logintime           |
+-------+---------------------+
| ����  | 2009-10-12 15:34:45 |
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
    -> weight tinyint not null default ��c��c\c
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
|        1 |      4 | ECS000000 | KD876                        | +                |           7 |        8 |               |            1 |        0.110 |      1665.60 |    1388.00 |          0.00 |                  0 |                0 |           1 | LG 3g 876 ֧�� ˫ģ 2008��04�� ��ɫ GSM,850,900,1800,1900                                                   |                                                                                                    | <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ܶ����Ѷ��Ѿ�����������3G����Ŀ���ͨ�������������ȹ��ܡ�LG KD876�ֻ�<span style="font-size: x-large;"><span style="color: rgb(255, 0, 0);"><strong>֧��TD-SCDMA/GSM˫ģ����</strong></span></span>�����ڲ��Գ���GSM�����TD����֮����л��͹���</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876�ֻ����������ɫ���ϲ��ʣ�<strong><span style="font-size: x-large;"><span style="color: rgb(255, 0, 0);">�������ת������Ǳ���������</span></span></strong>������������300����������ͷҲ���׷�������TD-SCDMA�ֻ���������ߵġ�LG KD876�ֻ���Ļ�·�����������̣��ü�������/�������ͨ��/�һ��������ؼ�����άҡ����ɣ�ҡ�������Ⱥܸߣ���λ׼ȷ��KD876���ڼ����ɱ�׼12���绰�����������ܼ���һ����������ͷ��ɡ��������ܼ��ֱ�Ϊ��Ƶͨ����MP3���Ͳ˵��������а������ָж��Ƚ�һ�㣬�������У������ڰ������й��ڽ��ܣ����ٷ�����ʱ�������󰴣��û���ʹ��ʱһ��Ҫ���ע�⡣LG KD876�ֻ������ܱߵĽӿ���Ʒǳ���࣬�ֻ��ĺ����Ҫ������Ļ��ת��ĳ��ȣ��������������ƵĻ�������<span style="font-size: x-large;"><strong><span style="color: rgb(255, 0, 0);">��ȿ�������10mm����</span></strong></span>��</p> | images/200905/thumb_img/1_thumb_G_1240902890710.jpg  | images/200905/goods_img/1_G_1240902890755.jpg  | images/200905/source_img/1_G_1240902890895.gif  |       1 |                |          1 |             1 |           0 |       13 | 1240902890 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589545 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|        4 |      8 | ECS000004 | ŵ����N85ԭװ�����          | +                |           0 |        1 |               |           17 |        0.000 |        69.60 |      58.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/4_thumb_G_1241422402467.jpg  | images/200905/goods_img/4_G_1241422402722.jpg  | images/200905/source_img/4_G_1241422402919.jpg  |       1 |                |          1 |             0 |           0 |        0 | 1241422402 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1242110662 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        3 |      8 | ECS000002 | ŵ����ԭװ5800����           | +                |           3 |        1 |               |           24 |        0.000 |        81.60 |      68.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/3_thumb_G_1241422082679.jpg  | images/200905/goods_img/3_G_1241422082168.jpg  | images/200905/source_img/3_G_1241422082367.jpg  |       1 |                |          1 |             1 |           0 |        0 | 1241422082 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972255 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        5 |     11 | ECS000005 | ����ԭװM2��������           | +                |           3 |        7 |               |            8 |        0.000 |        24.00 |      20.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/5_thumb_G_1241422518886.jpg  | images/200905/goods_img/5_G_1241422518773.jpg  | images/200905/source_img/5_G_1241422518470.jpg  |       1 |                |          1 |             1 |           0 |        0 | 1241422518 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1241972241 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|        6 |     11 | ECS000006 | ʤ��KINGMAX�ڴ濨            | +                |           0 |        0 |               |           15 |        0.000 |        50.40 |      42.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                      |                                                |                                                 |       1 |                |          1 |             0 |           0 |        0 | 1241422573 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972238 |          6 |             |            -1 |            -1 |         NULL |     NULL |
|        7 |      8 | ECS000007 | ŵ����N85ԭװ����������HS-82 | +                |           0 |        1 |               |           20 |        0.000 |       120.00 |     100.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/7_thumb_G_1241422785492.jpg  | images/200905/goods_img/7_G_1241422785856.jpg  | images/200905/source_img/7_G_1241422785657.jpg  |       1 |                |          1 |             1 |           0 |        1 | 1241422785 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1241972232 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|        8 |      3 | ECS000008 | ������9@9v                   | +                |           9 |        4 |               |            1 |        0.075 |       478.79 |     399.00 |        385.00 |         1241366400 |       1244044800 |           1 | ˫ģ 2008�괺 ��ɫ ֱ�� �е͵�                                                                              |                                                                                                    | <p align="left">��Ϊһ���Լ۱ȼ��ߵ����ż�<font size="3" color="#ff0000"><strong>�����ֻ�</strong></font>��������<a href="mailto:9@9v">Xenium&nbsp; 9@9v</a>��Χ��СΪ105&times;44&times;15.8mm������������Ϊ<strong><font size="3" color="#ff0000">75g</font></strong>��װ����һ��͹��1.75Ӣ��128&times;160����65000ɫCSTN��ʾ�����������������ɫ���ܼ�������Ļ���ּ�����ָ���������ƽ�Ϊ<font size="3"><strong><font color="#ff0000">��</font><font color="#ff0000">��</font></strong></font>���в��������������ѽ�ɫ��&ldquo;����&rdquo;���Գ�Ũ����������Ϣ��</p>
<p align="left">&nbsp;</p>
<p align="left">�˿��ֻ�����<strong><font size="3" color="#ff0000">������</font></strong>��ƣ����侫�µ���д�ʣ���֧����д���ĺ�Ӣ�������汾����ǿ������ϵͳ����ʶ���ʲ��ּ���ȷ�����ƶ��кʹ�æʱ�������ֵ�ʶ���ʡ���дָ��ܻ�֧���ض�ͼ����˲����ã����ص���д���±����ܣ������ڴ�������������Ƹ��Ի���ͼ��������<strong><font size="3" color="#ff0000">��������</font></strong>��������Ӧ�ø������⡣</p>
<p align="left">&nbsp;</p>
<p align="left">&nbsp;��Ϊ���ż�Ϊ������֧��<strong><font size="3" color="#ff0000">˫������</font></strong>���ֻ�������ͬʱ��������SIM����ͨ���˵������л���ֻ�迪�������Զ��л�ģʽ��<a href="mailto:9@9V">9@9V</a>�ڸ�ģʽ���ܹ��ж�����������Զ��л��ʺϵ��ֻ��š�</p>
<p align="left">&nbsp;</p>
<p align="left">&nbsp;</p> | images/200905/thumb_img/8_thumb_G_1241425513488.jpg  | images/200905/goods_img/8_G_1241425513055.jpg  | images/200905/source_img/8_G_1241425513518.jpg  |       1 |                |          1 |             1 |           0 |        3 | 1241425512 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589533 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|        9 |      3 | ECS000009 | ŵ����E66                    | +                |          20 |        1 |               |            4 |        0.121 |      2757.60 |    2298.00 |          0.00 |                  0 |                0 |           1 | SMS EMS MMS ����ϢȺ�� ���� �Ķ��� SMS,EMS,MMS,����ϢȺ�������ϳ���Ϣ�Ķ��� ��ɫ ��ɫ ����                  |                                                                                                    | <p>�ڻ�����ʷ��棬ŵ����E66�������ý������ʣ��ٹ�Ľ�����������ˣ�����ĵ�״Ч������ȴ�ֲ�ʧ�仯��ʱ�и������ڲ������ڹ�ͳ�����������������֪��E66����ߴ�Ϊ<span style="color: rgb(255, 0, 0);"><span style="font-size: larger;"><strong>107.5&times;49.5&times;13.6���ף�����Ϊ121��</strong></span></span>�����ǵ����;�Ȼ��E71��Ҫ��һЩ��</p>
<p>&nbsp;</p>
<div>ŵ����E66����������<span style="color: rgb(255, 0, 0);"><span style="font-size: larger;"><strong>һ��2.4Ӣ��1600��ɫQVGA�ֱ��ʣ�240&times;320���أ�Һ����ʾ��</strong></span></span>����Ļ�Ϸ�ӵ�й��߸�ӦԪ�����ܹ�����Ӧ�� Χ�����������Ļ���ȣ���Ļ�·��Ƿ����ܼ������򿪻��ǣ����Կ�����ͳ�����ּ��̣������Ĵ�С���ָС�����Լ��������У��ָзǳ����ʡ�</div>
<div>&nbsp;</div>
<div>ŵ����ΪE66�䱸��һ��320�������Զ��Խ�����ͷ������LED ����ƣ�֧�ֶ������ճߴ�ѡ��</div>
<p>&nbsp;</p>                                                                                                                                                                            | images/200905/thumb_img/9_thumb_G_1241511871555.jpg  | images/200905/goods_img/9_G_1241511871574.jpg  | images/200905/source_img/9_G_1241511871550.jpg  |       1 |                |          1 |             1 |           0 |       22 | 1241511871 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589743 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       10 |      3 | ECS000010 | ����C702c                    | +                |          11 |        7 |               |            7 |        0.000 |      1593.60 |    1328.00 |       1250.00 |         1243785600 |       1277827200 |           1 | 2008��05�� GSM,850,900,1800,1900 ֱ��                                                                       |                                                                                                    | <p>C702����˵��һ��������ϸ��ŵĲ����������Tϵ�����ڵ�ֱ�����ͣ���������Ļ�ͼ��̵���Ϸֲ��϶��̳���ǰ���ľ��衣C702�Ļ���ߴ�Ϊ106&times;48&times;15.5���ף�����Ϊ105�ˡ��������ᰮ����ΪC702������<font size="3" color="#ff0000"><strong>�������ԣ��������������ͷ�ˮ��</strong></font>������µ�C702���������ᰮ���ž���A200ƽ̨�����沼����W908c��K858cһ�£����͵����������䱸�������������ȷ������ͨ��/�һ�����</p>
<p>���ᰮ����C702�䱸һ��<strong><font size="3" color="#ff0000">2.2Ӣ��26��ɫTFTҺ����ʾ��</font></strong>���ֱ���Ϊ240&times;320����(QVGA)����ʾЧ������Ŀǰ����ˮ׼��C702����˵�����ᰮ��������<strong><font size="3" color="#ff0000">����GPSģ��</font></strong>�� �ֻ���Ʒ֮һ��C702�����ǡ���λһ���ǳɣ�ʮ�־�׼������Լ��10��֮�ڡ������϶�λ����Խ���Ч��������������4&mdash;6�ţ�����˵�����������ǵ��� Ҫ�ˡ�C702���ṩ��&ldquo;Ӱ��λ&rdquo;���ܣ�������õ�AGPSȫ��λ����ϵͳ��ֻ������Geo-Tagging����Ӱ��λ���ܣ���ɽ�����ص��¼�� ��Ƭ�ڣ������û���ʱ��ѯ��</p>
<p>&nbsp;</p>
<p>��Ϊһ��Cyber-shotϵ��Ӱ���ֻ������ᰮ����C702�����չ��ܷ���ͬ���в��׵ı��֡������ֻ����õ�<strong><font size="3" color="#ff0000">320����������ͷ</font></strong>Ҳ ͬ�������չ�����Ҳ����ı��֡�����֧���Զ��۽���˫LED���⹦�ܣ����һ�ӵ��2������佹�������ۡ�Photo fix�Ż�������ģʽ�ȹ��ܡ����ᰮ����C702�����䱸��������ȦΪF3.2��4.2���׾�ͷ֮�⣬�û�Ҳ��ͬ���е��콢C902һ�������˶������� ���Զ��۽����ܵ�֧�֡�</p>
<p>&nbsp;</p> | images/200905/thumb_img/10_thumb_G_1242973436403.jpg | images/200905/goods_img/10_G_1242973436141.jpg | images/200905/source_img/10_G_1242973436172.jpg |       1 |                |          1 |             1 |           0 |       13 | 1241965622 |        100 |         0 |       0 |      0 |      1 |          1 |             0 |  1245290333 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       11 |      3 | ECS000011 | ����C702c                    | +                |           0 |        7 |               |            1 |        0.000 |         0.00 |    1300.00 |          0.00 |                  0 |                0 |           1 | ֱ��                                                                                                        |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                      |                                                |                                                 |       1 |                |          0 |             1 |           0 |        0 | 1241966951 |        100 |         1 |       0 |      0 |      0 |          0 |             0 |  1241966960 |          7 |             |            -1 |            -1 |         NULL |     NULL |
|       12 |      3 | ECS000012 | Ħ������A810                 | +                |          13 |        2 |               |            8 |        0.000 |      1179.60 |     983.00 |        960.00 |         1241107200 |       1255104000 |           1 | SMS EMS MMS pda ���� ���� ���� SMS,EMS,MMS                                                                  |                                                                                                    | <p>ȫ��ʹ�õĲ��ʳ�ȥ��ظǲ��ֲ����˽������⣬������ʹ����ABS����������Ϊ���ģ�����ֻ�����Χ��105&times;51&times;14���ף�����100�˵��������������������еĸо����Ƿǳ�����ġ�A810�ֻ���Ϊһ��<strong><font size="3" color="#ff0000">PDA�ֻ�</font></strong>����Ƶ�ʱ��ȡ���˼������ã�һ�����ּ���Ҫ�����ֻ����ṩ��������̽��в��������ֻ������ϲ���һ��<strong><font size="3" color="#ff0000">3.5mm�ı�׼�������</font></strong>��������ƿ������û�ʹ���Լ�ϰ�߻���ϲ���Ķ���ȥ�������֡�</p>
<p>&nbsp;</p>
<p>���Ħ������A810�ֻ�������һ��<font size="3" color="#ff0000"><strong>26��ɫ��2.2Ӣ��TFTȫ������Ļ</strong></font>����ֱ��ʴﵽ��������QVGAˮƽ��240&times;320���أ���Ħ������A810�������ڲ�����Ϊ2.6.10��<strong><font size="3" color="#ff0000">LINUX����ϵͳ</font></strong>���˵�����Ȼ���ô�ͳ��9�������ʾ��ʽ��һ���ֻ�����Ƭʽ�绰��ֻ��֧������绰���ʼ������桢��˾��һЩ������Ϣ����A810�ֻ��ĵ绰��������Щ��֧�ֹ�˾��ַ����ż��Ϣ����Ů��������˾���ơ����ֵȵȣ�����һ���ֻ���˵���绰������ν��ǿ��A810��<strong><font size="3" color="#ff0000">��дʶ�������൱�ľ���</font></strong>�������ʡ�����͵���ʵ�ʶ���ʶ��൱�ĸߣ�ͬʱ��Ϊ�����������˲�ͬ����дϰ��ѡ�񣬲�֧����д�ٶȵĵ��ڡ�</p>
<p>���A810�ֻ�<strong><font size="3" color="#ff0000">���õ����ֲ��Ź���</font></strong>����֧��MP3��WAV��AMR��AAC�ȸ�ʽ�����ֲ��ţ�<font size="3" color="#ff0000"><strong>֧�ֺ�̨����</strong></font>����Ƶ���棬���A810֧��MP4��3GP��H.263��ʽ�Ĳ��ţ���Ƶ������ͬ����Լ���������㣬���Ħ������A810��������6����Ϸ��ÿһ��кܸߵ������ԣ����Ҷ���֧�ִ����������ģ�ͬʱ����ֻ���������<strong><font size="3" color="#ff0000">FM������</font></strong>��֧���Զ����������ṩ��20��Ƶ�����û��洢����������������֧�ֺ�̨���š�</p>
<p>&nbsp;</p> | images/200905/thumb_img/12_thumb_G_1241965978410.jpg | images/200905/goods_img/12_G_1241965978209.jpg | images/200905/source_img/12_G_1241965978878.jpg |       1 |                |          1 |             1 |           0 |        9 | 1245297652 |        100 |         0 |       0 |      1 |      0 |          1 |             0 |  1245297670 |          3 |             |            -1 |            -1 |         NULL |     NULL |
|       13 |      3 | ECS000013 | ŵ����5320 XpressMusic       | +                |          13 |        1 |               |            8 |        0.000 |      1573.20 |    1311.00 |          0.00 |                  0 |                0 |           1 | ���� ���� ���� ��ɫ ��ɫ ���� ֱ�� �е� 2008��07�� ��ɫ GSM,850,900,1800,1900                               |                                                                                                    | <p>ŵ����5320XpressMusic�����ֻ�����XpressMusicϵ�г����ĺں졢������ɫ�����������ʷ�����ѡ�õ��Ǿ���<strong><font size="3" color="#ff0000">�׹⴦��</font></strong>�Ĺ������ϣ���Χ/����Ϊ��Ϊ108&times;46&times;15mm/<strong><font size="3" color="#ff0000">90g</font></strong>���ָ����ʡ�</p>
<p>&nbsp;</p>
<p>ŵ����5320���õ���һ��������Ϊ2.0Ӣ���<font size="3" color="#ff0000"><strong>1600��ɫ</strong></font>��Ļ���ֱ����ǳ�����240&times;320���أ�QVGA������Ȼ��Ļ�����ر�󣬵�Ч���ǳ���ϸ��ɫ�ʻ�ԭ����</p>
<p>&nbsp;</p>
<p>�ֻ����棬ŵ����Ϊ5320XM�䱸һ��<strong><font size="3" color="#ff0000">200W����</font></strong>������ͷ�����Ҵ���<strong><font size="3" color="#ff0000">����LED�Ĳ����</font></strong>������ʵ�����ա������ܣ�����ͨ�����š��ʼ���ʽ���͸����ѡ�</p>
<p>&nbsp;</p>                                                                                                                                                                                                                                     | images/200905/thumb_img/13_thumb_G_1241968002527.jpg | images/200905/goods_img/13_G_1241968002233.jpg | images/200905/source_img/13_G_1241968002732.jpg |       1 |                |          1 |             1 |           0 |       13 | 1241967762 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1269589198 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       14 |      4 | ECS000014 | ŵ����5800XM                 | +                |           6 |        1 |               |            1 |        0.000 |      3150.00 |    2625.00 |          0.00 |                  0 |                0 |           1 | GSM 64���� 2009��2�� 320������ͷ GPS ֱ�� �������� ֧�� 2008��10�� ��ɫ                                     |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/14_thumb_G_1241968492116.jpg | images/200905/goods_img/14_G_1241968492932.jpg | images/200905/source_img/14_G_1241968492305.jpg |       1 |                |          1 |             1 |           0 |       26 | 1241968492 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1269589186 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       15 |      3 | ECS000015 | Ħ������A810                 | +                |           8 |        2 |               |            3 |        0.000 |       945.60 |     788.00 |          0.00 |                  0 |                0 |           1 | 600 ֱ�� �������� ���� ��Ƶ���� ���� ��ɫ ��ɫ                                                              |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/15_thumb_G_1242973362970.jpg | images/200905/goods_img/15_G_1242973362318.jpg | images/200905/source_img/15_G_1242973362751.jpg |       1 |                |          1 |             1 |           0 |        5 | 1241968703 |        100 |         1 |       0 |      1 |      1 |          0 |             0 |  1245297631 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       16 |      2 | ECS000016 | ���ΰҵG101                 | +                |           3 |       11 |               |            0 |        0.000 |       988.00 |     823.33 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/16_thumb_G_1241968949103.jpg | images/200905/goods_img/16_G_1241968949002.jpg | images/200905/source_img/16_G_1241968949402.jpg |       1 |                |          0 |             1 |           0 |        8 | 1241968949 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1245290562 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|       17 |      3 | ECS000017 | ����N7                       | +                |           2 |        5 |               |            1 |        0.000 |      2760.00 |    2300.00 |          0.00 |                  0 |                0 |           1 | 2008��01�� GSM,900,1800,1900,2100 ֱ�� 262144�� 240��400 ���� SMS,EMS,MMS,������Ϣ����,����ϢȺ�� ��ɫ CDMA |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/17_thumb_G_1241969394587.jpg | images/200905/goods_img/17_G_1241969394677.jpg | images/200905/source_img/17_G_1241969394844.jpg |       1 |                |          1 |             1 |           0 |       23 | 1241969394 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1269589169 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       18 |      4 | ECS000018 | ����T5                       | +                |           0 |        5 |               |            1 |        0.000 |      3453.60 |    2878.00 |          0.00 |                  0 |                0 |           1 | 2008��04�� 3G(GSM,900,1800,1900,TD-SCDMA ) ֱ�� 262144�� 320��240 ���� �� ��ɫ                              |                                                                                                    | <p>&nbsp;  TD-SCDMA/GSM����ģʽ�����л����й�3G�ֻ�������֧�ִ�½����3G���磬����ʵ�ֿ��ӵ绰����Ƶ���ԡ���Ƶ���鹦�ܣ�2.6Ӣ��Q������д������˫���룬�����ƶ�֤ȯ��֧���ֻ����䡢�ֻ���ͼ������U��</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                      |                                                |                                                 |       1 |                |          1 |             1 |           0 |       28 | 1241969533 |        100 |         1 |       0 |      0 |      0 |          0 |             0 |  1241969533 |          2 |             |            -1 |            -1 |         NULL |     NULL |
|       19 |      3 | ECS000019 | ����SGH-F258                 | +                |           7 |        6 |               |           12 |        0.000 |      1029.60 |     858.00 |          0.00 |                  0 |                0 |           1 | ���� GSM 258 ʱ�� ���� ��ɫ ��ɫ ��ɫ                                                                       | ����������������SGH-F258�Ƚ�ʱ�пɰ�����Χ�ߴ�Ϊ94��46��17.5mm������Ϊ96�ˣ�������;�����������
 | <p>����������������SGH-F258�Ƚ�<font size="3" color="#ff0000"><strong>ʱ��</strong></font>�ɰ�����Χ�ߴ�Ϊ94&times;46&times;17.5mm������Ϊ96�ˣ�������;����������С�</p>
<p>&nbsp;</p>
<p>����F258��ǰ�������Ӧ��<strong><font size="3" color="#ff0000">����Ч��</font></strong>��2.0Ӣ����ʾ��Ļ����խС���������빦�ܼ��ڻ��ǻ���֮ǰ��ǰ����ȫ�����Ƽ���û�йҶϺͽ��������������������<font size="3"><strong><font color="#ff0000">���ֲ�</font><font color="#ff0000">��</font></strong></font>���ܣ���ȷ��ʾ��F258�����ֻ��Ķ�λ��</p>
<p>&nbsp;</p>
<p>F258�����ּ����������˼��߽����ʸе�ƽ��ʽ��ƣ�ÿ�Ű���������㹻�󣬰����밴��֮��ļ�����ԣ����������ָ����ʡ�</p>                                                                                                                                                                                                                                                                                                                                                                    | images/200905/thumb_img/19_thumb_G_1241970175208.jpg | images/200905/goods_img/19_G_1241970175091.jpg | images/200905/source_img/19_G_1241970175549.jpg |       1 |                |          1 |             1 |           0 |        8 | 1241970139 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1269589154 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       20 |      3 | ECS000020 | ����BC01                     | +                |          14 |        6 |               |           12 |        0.000 |       336.00 |     280.00 |        238.00 |         1241884800 |       1251648000 |           1 | GSM ֱ�� 40���� �������� 2008��07�� ��ɫ GSM,900,1800,1900,2100                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/20_thumb_G_1242106490058.jpg | images/200905/goods_img/20_G_1242106490663.jpg | images/200905/source_img/20_G_1242106490922.jpg |       1 |                |          1 |             1 |           0 |        2 | 1241970417 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589110 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       21 |      3 | ECS000021 | ���� A30                     | +                |           4 |       10 |               |           40 |        0.000 |      2400.00 |    2000.00 |          0.00 |                  0 |                0 |           1 | 2008��03�� GSM,900,1800,1900,2100 ֱ�� 1600�� 240��400 ���� 2007��12�� 200������ͷ ��ɫ                     |                                                                                                    | <p>&nbsp;</p>
<p align="left"><span style="font-size: medium;"><font size="3">��׼����: ��׼﮵������,���������,����������һ��,������,˵������256TF</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">ͨѶ����&nbsp; ���뷨 ���Ź��� ����ͨѶ¼ ͨ����¼</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">���뷨: �������뷨</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">���Ź���: ֧�ֶ���300���Ͳ���100��</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">����ͨѶ¼: 1000����Ƭʽ�绰�洢 �������ǽ����&nbsp; �����ͷ������������ʶ��</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">ͨ����¼��֧�ֵ绰¼��,�ָ�/����,˫����Ƶ,����</font></span></p>
<p>&nbsp;</p>
<p><font size="3">�߼�����</font></p>
<p align="left"><span style="font-size: medium;"><font size="3">��ý������: 200�����أ����֧��10240*960��11������佹,����Ч������,���Ŀ�ȫ���鿴��������ص�ͼƬ.֧������MP4��Ƭ���㣬¼��ʱ������ڴ� ��С����������¼��,TV���ӿɸ����Ѽ���һ�����֧����������ͷ���� ֧��MPEG4��3GP(H.263)����Ƶ��ʽ ֧��MP3����Ƶ��ʽ���ţ� ֧�ָ�ʲ���</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">������Ϸ:����ƴͼ</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">��չ�洢����:֧��TF��չ,֧��U�̹���,��������1M,�������256TF��</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">�߼�����:ֱ��/����PDA��д/�������� �������� WAP����&nbsp; ¼�� ���� FM������ ������ Java��չ TV������� ������������ ��ѵ��� �������ǽ&nbsp;&nbsp;&nbsp;</font></span></p>
<p align="left"><span style="font-size: medium;"><font size="3">���ӹ���: ���� ������ ���� ���±� �ճ̱� ��� ��λ����</font></span></p>
<p><span style="font-size: medium;"><font size="3">���� �������ܾ�Ϊ����˾Ա���Ի�����д,��Ʒ���Ͻ����ο�,�����յ�ʵ��Ϊ׼</font></span></p> | images/200905/thumb_img/21_thumb_G_1242109298150.jpg | images/200905/goods_img/21_G_1242109298873.jpg | images/200905/source_img/21_G_1242109298831.jpg |       1 |                |          1 |             1 |           0 |       20 | 1241970634 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1269589102 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       22 |      3 | ECS000022 | ���մ�Touch HD               | +                |          15 |        3 |               |            1 |        0.000 |      7198.80 |    5999.00 |          0.00 |                  0 |                0 |           1 | 500������ͷ ���� ��д GPS �칫Ӧ�� �������� 2008��12�� ��ɫ GSM,850,900,1800,1900 ֱ��                      |                                                                                                    | <p><img src="http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg" alt="" /></p>
<p>&nbsp;</p>
<p><img src="http://www.ouku.com/upimg/ouku/Image/002(1).jpg" alt="" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | images/200905/thumb_img/22_thumb_G_1241971076803.jpg | images/200905/goods_img/22_G_1241971076358.jpg | images/200905/source_img/22_G_1241971076130.jpg |       1 |                |          1 |             1 |           0 |       59 | 1241971076 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1269589090 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       23 |      5 | ECS000023 | ŵ����N96                    | +                |          17 |        1 |               |            8 |        0.000 |      4440.00 |    3700.00 |          0.00 |                  0 |                0 |           1 | 500������ͷ microSD �������� ���� ������� ������Ϸ ���� �ߵ� 2008��09�� 320��240 ���� ��ɫ                 |                                                                                                    | <p>ŵ����N96������<strong><font size="3" color="#ff0000">˫�򻬸�</font></strong>��ƣ���������ʻҺ�ɫ�����ȡ�������������ʲ����˸�ǿ�ȵ����ϲ��ʣ��ֻ�����������׹�������Ʒ��N96��ά���103*55*20mm������Ϊ125g����Ļ���棬ŵ����N96�䱸һ��<strong><font size="3" color="#ff0000">2.8Ӣ��</font></strong>����Ļ��֧��<strong><font size="3" color="#ff0000">1670��ɫ</font></strong>��ʾ���ֱ��ʴﵽQVGA��320&times;240��ˮ׼��</p>
<p><img alt="" src="file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg" /></p>
<p>&nbsp;</p>
<p>&nbsp;<img src="http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg" alt="" /></p>
<p>ŵ����N96������ר�ŵ�<strong><font size="3" color="#ff0000">���ֲ��ż�</font></strong>�ͱ�׼��3.5������Ƶ��ڣ�֧�ֶ��ʽ���ֲ��š�������<strong><font size="3" color="#ff0000">��ý�岥����</font></strong>��֧��FM��Ƶ�����������ֹ��ܡ�N96�ֻ�֧��<strong><font size="3" color="#ff0000">N-Gage��Ϸƽ̨</font></strong>�����ð���<font size="3" color="#ff0000"><strong>��PinBall��������</strong></font>���ڵ��Ŀ�N-Gage��Ϸ�������ֻ��������õ���Ϸ�������Դ�N-Gage����վ���ػ��߹������µ���Ϸ�����ҿ�������̳����������һ�����ۡ�</p>
<p><img src="http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg" alt="" /></p>
<p>&nbsp;</p> | images/200905/thumb_img/23_thumb_G_1241971556399.jpg | images/200905/goods_img/23_G_1241971556855.jpg | images/200905/source_img/23_G_1241971556256.jpg |       1 |                |          1 |             1 |           0 |       37 | 1241971488 |        100 |         0 |       1 |      1 |      0 |          0 |             0 |  1269589078 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       24 |      3 | ECS000024 | P806                         | +                |          35 |        9 |               |          100 |        0.000 |      2400.00 |    2000.00 |       1850.00 |         1243785600 |       1277827200 |           1 | ���г���� ͼ�β˵� Wap ���� ����ӿ� �ƶ� MSN ֧�� 2008��06�� ��ɫ                                         |                                                                                                    | <div>
<div>
<div><font size="4">������</font></div>
<p><font size="4"><span>����ʱ�䣺</span><span>2008��06��</span></font></p>
<p><font size="4"><span>����Ƶ�ʣ�</span><span>GSM/GPRS��900/1800MHz</span></font></p>
<p><font size="4"><span>�ء�������</span><span>δ֪</span></font></p>
<p><font size="4"><span>�ߴ�/�����</span><span>δ֪</span></font></p>
<p><font size="4"><span>��ѡ��ɫ��</span><span>��ɫ</span></font></p>
<p><font size="4"><span>��Ļ������</span><span>26��ɫTFT��ɫ��Ļ��</span></font></p>
<p><font size="4"><span>WAP������</span><span>֧�ַɼ�</span></font></p>
<p><font size="4"><span>��������:<em><strong><font size="5" color="#ff00ff">����(1760����) һ�� ������ ���� ��д�� 512M�ڴ濨</font></strong></em></span></font></p>
<p>&nbsp;</p>
</div>
</div>
<div><font size="4">��������</font></div>
<p><font size="4"><span>��ʱ�ӡ�</span><span>�������񶯡�</span><span>��¼����</span><span>����ѡ������</span></font></p>
<p><font size="4"><span>������������</span><span>��MP3������</span><span>����������ʶ��</span><span>������ͼƬʶ��</span></font></p>
<p><font size="4"><span>���龰ģʽ��</span><span>������ͼƬ��</span><span>��ͼ�β˵���</span><span>����������</span></font></p>
<p><span><font size="4">����д���롻</font></span></p>
<div><font size="4">ͨ�Ź���</font></div>
<p><font size="4"><span>��˫��˫����</span><span>���������ߡ�</span><span>�����뷨��</span><span>�����Ķ��š�</span></font></p>
<p><font size="4"><span>������Ⱥ����</span><span>����ý����š�</span><span>������ͨѶ¼��</span><span>��ͨ����¼��</span></font></p>
<p><font size="4"><span>������ͨ����</span><span>������ģʽ��</span></font></p>
<div><font size="4">��ý������ :֧��3GP��MP4�ļ�����</font></div>
<p><font size="4"><span>����Ƶ���š�</span><span>��MP3��������</span></font></p>
<p><font size="4"><span>��ý�忨��չ��</span><span>֧��microSD����չ&nbsp;</span></font></p>
<p><font size="4"><span>����ͷ��</span><span>����</span></font></p>
<p><font size="4"><span>����ͷ���أ�</span><span>30������</span></font></p>
<p><font size="4"><span>���������ͣ�</span><span>CMOS</span></font></p>
<p><font size="4"><span>�佹ģʽ��</span><span>����佹</span></font></p>
<p><font size="4"><span>��Ƭ�ֱ��ʣ�</span><span>������Ƭ�ֱ���ѡ��</span></font></p>
<p><font size="4"><span>����ģʽ��</span><span>��������ģʽѡ��</span></font></p>
<p><font size="4"><span>��Ƭ������</span><span>������Ƭ����ѡ��</span></font></p>
<p><font size="4"><span>��Ƶ���㣺</span><span>������Ƶ����</span></font></p>
<div><font size="4">���ݴ���</font></div>
<p><font size="4"><span>��WAP�������</span><span>�������߽ӿڡ�</span></font></p>
<div><font size="4">��������</font></div>
<p><font size="4"><span>�����ӡ�</span><span>��������</span><span>����������</span></font></p> | images/200905/thumb_img/24_thumb_G_1241971981429.jpg | images/200905/goods_img/24_G_1241971981284.jpg | images/200905/source_img/24_G_1241971981107.jpg |       1 |                |          1 |             1 |           0 |       20 | 1241971981 |        100 |         0 |       1 |      1 |      1 |          1 |             0 |  1269589064 |          9 |             |            -1 |            -1 |         NULL |     NULL |
|       25 |     13 | ECS000025 | С��ͨ/�̻�50Ԫ��ֵ��        | +                |           0 |        0 |               |            2 |        0.000 |        57.59 |      48.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/25_thumb_G_1241972709885.jpg | images/200905/goods_img/25_G_1241972709544.jpg | images/200905/source_img/25_G_1241972709750.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972709 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047546 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       26 |     13 | ECS000026 | С��ͨ/�̻�20Ԫ��ֵ��        | +                |           0 |        0 |               |            2 |        0.000 |        22.80 |      19.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/26_thumb_G_1241972789393.jpg | images/200905/goods_img/26_G_1241972789293.jpg | images/200905/source_img/26_G_1241972789353.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972789 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1245047540 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       27 |     15 | ECS000027 | ��ͨ100Ԫ��ֵ��              | +                |           0 |        0 |               |            2 |        0.000 |       100.00 |      95.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/27_thumb_G_1241972894068.jpg | images/200905/goods_img/27_G_1241972894061.jpg | images/200905/source_img/27_G_1241972894069.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972894 |        100 |         0 |       1 |      1 |      1 |          0 |             0 |  1245047557 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       28 |     15 | ECS000028 | ��ͨ50Ԫ��ֵ��               | +                |           0 |        0 |               |            0 |        0.000 |        50.00 |      45.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/28_thumb_G_1241972976986.jpg | images/200905/goods_img/28_G_1241972976313.jpg | images/200905/source_img/28_G_1241972976695.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241972976 |        100 |         0 |       0 |      0 |      1 |          0 |             0 |  1245047542 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       29 |     14 | ECS000029 | �ƶ�100Ԫ��ֵ��              | +                |           0 |        0 |               |            0 |        0.000 |         0.00 |      90.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/29_thumb_G_1241973022239.jpg | images/200905/goods_img/29_G_1241973022206.jpg | images/200905/source_img/29_G_1241973022514.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241973022 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047543 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       30 |     14 | ECS000030 | �ƶ�20Ԫ��ֵ��               | +                |           1 |        0 |               |            9 |        0.000 |        21.00 |      18.00 |          0.00 |                  0 |                0 |           1 |                                                                                                             |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/30_thumb_G_1241973114800.jpg | images/200905/goods_img/30_G_1241973114234.jpg | images/200905/source_img/30_G_1241973114587.jpg |       0 | virtual_card   |          1 |             1 |           0 |        0 | 1241973114 |        100 |         0 |       1 |      0 |      1 |          0 |             0 |  1245047549 |          0 |             |            -1 |            -1 |         NULL |     NULL |
|       31 |      3 | ECS000031 | Ħ������E8                   | +                |           5 |        2 |               |            1 |        0.000 |      1604.39 |    1337.00 |          0.00 |                  0 |                0 |           1 | ֱ��                                                                                                        |                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | images/200905/thumb_img/31_thumb_G_1242110412996.jpg | images/200905/goods_img/31_G_1242110412332.jpg | images/200905/source_img/31_G_1242110412519.jpg |       1 |                |          0 |             1 |           0 |       13 | 1242110412 |        100 |         0 |       0 |      0 |      0 |          0 |             0 |  1242140652 |          7 |             |            -1 |            -1 |         NULL |     NULL |
|       32 |      3 | ECS000032 | ŵ����N85                    | +                |           9 |        1 |               |            4 |        0.000 |      3612.00 |    3010.00 |       2750.00 |         1243785600 |       1277827200 |           1 | 2008��10�� GSM,850,900,1800,1900 ��ɫ                                                                       |                                                                                                    | <p>ŵ����N85����</p>
<div>&nbsp;</div>
<div>
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
    <tbody>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>��������</b></p>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�ֻ��ǳ�</td>
            <td width="450" bgcolor="#ffffff">N85</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��������</td>
            <td width="450" bgcolor="#ffffff">2008��10��</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�ֻ�����</td>
            <td width="450" bgcolor="#ffffff">3G�ֻ��������ֻ��������ֻ�</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�ֻ���ʽ</td>
            <td width="450" bgcolor="#ffffff">GSM</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">֧��Ƶ��</td>
            <td width="450" bgcolor="#ffffff">GSM850/900/1800/1900MHz</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">���ݴ���</td>
            <td width="450" bgcolor="#ffffff">GPRS��EDGE</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ļ����</td>
            <td width="450" bgcolor="#ffffff">AMOLED</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ļɫ��</td>
            <td width="450" bgcolor="#ffffff">1600��ɫ</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�����ߴ�</td>
            <td width="450" bgcolor="#ffffff">2.6Ӣ��</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��������</td>
            <td width="450" bgcolor="#ffffff">QVGA 320&times;240����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��������</td>
            <td width="450" bgcolor="#ffffff">��ѡMP3��WAV��AAC�����Midi�����ȸ�ʽ</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����ϵͳ</td>
            <td width="450" bgcolor="#ffffff">Symbian OS v9.3����ϵͳ��S60 v3.2ƽ̨�����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�����ڴ�</td>
            <td width="450" bgcolor="#ffffff">74MB �ڲ���̬�洢�ռ�<br />
            78MB ����NAND����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�洢��</td>
            <td width="450" bgcolor="#ffffff">֧��MicroSD(T-Flash)����չ�����8GB</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��ع��</td>
            <td width="450" bgcolor="#ffffff">1200����ʱ﮵��</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����</td>
            <td width="450" bgcolor="#ffffff">ŵ���� N85<br />
            ŵ���ǵ�أ�BL-5K��<br />
            ŵ�������г������AC-10��<br />
            ŵ������Ƶ�����ߣ�CA-75U��<br />
            ŵ���������ߣ�CA-101��<br />
            ŵ�������ֶ�����HS-45��AD-54��<br />
            ŵ���� 8 GB microSD ����MU-43��<br />
            ���û��ֲᡷ<br />
            ���������š�</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����ͨ��ʱ��</td>
            <td width="450" bgcolor="#ffffff">6.9 Сʱ</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">���۴���ʱ��</td>
            <td width="450" bgcolor="#ffffff">363 Сʱ</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>��Ʒ����</b></p>
            </td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">������</td>
            <td width="450" bgcolor="#ffffff">˫�򻬸�</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ʒ�ߴ�</td>
            <td width="450" bgcolor="#ffffff">103&times;50&times;16mm<br />
            �����76 ��������</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�ֻ�����</td>
            <td width="450" bgcolor="#ffffff">128��</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ʒ����</td>
            <td width="450" bgcolor="#ffffff">����</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>���չ���</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��ʱ��</td>
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
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����ͷ</td>
            <td width="450" bgcolor="#ffffff">����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����ͷ����</td>
            <td width="450" bgcolor="#ffffff">500������</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">���Ĺ���</td>
            <td width="450" bgcolor="#ffffff">֧��</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">LED�����</td>
            <td width="450" bgcolor="#ffffff">˫LED �����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����佹</td>
            <td width="450" bgcolor="#ffffff">20 ������佹</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">����ģʽ</td>
            <td width="450" bgcolor="#ffffff">��ֹ�����ġ��Զ���ʱ��������</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ƭ��Ч</td>
            <td width="450" bgcolor="#ffffff">���������ɡ��ڰס���Ƭ������</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��������</td>
            <td width="450" bgcolor="#ffffff">֧�����2592&times;1944�ֱ�����Ƭ����<br />
            ֧��JPEG��Exif��ʽ<br />
            ��ƽ��ģʽ���Զ������⡢���졢�׳�ơ�ӫ���<br />
            �й��ģʽ���ߡ��С��͡��Զ�</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ƶ����</td>
            <td width="450" bgcolor="#ffffff">���֧��640 x 480 ���أ�VGA����30 ֡/��</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>���ֹ���</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">������</td>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">¼������</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">������</td>
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
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ƶ����</td>
            <td width="450" bgcolor="#ffffff">����RealPlayer������, ֧��MPEG4��H.264/AVC��H.263/3GP��RealVideo����Ƶ��ʽȫ������</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">���ֲ���</td>
            <td width="450" bgcolor="#ffffff">���ò�����, ֧��mp3��.wma��.aac��eAAC��eAAC+��ʽ</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">��Ϸ</td>
            <td width="450" bgcolor="#ffffff">����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">Java����</td>
            <td width="450" bgcolor="#ffffff">֧��Java MIDP 2.0 CLDC 1.1</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">Flash����</td>
            <td width="450" bgcolor="#ffffff">��3.0��Flash lite������</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>���ݹ���</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��������</td>
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
            <td width="100" valign="center" bgcolor="#ffffff" align="left">�����߽ӿ�</td>
            <td width="450" bgcolor="#ffffff">USB������ 3.5mm�������������</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>��������</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����(SMS)</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����(MMS)</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����ͨ��</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">�龰ģʽ</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">���ӹ���</td>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��������</td>
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
            <td width="100" valign="center" bgcolor="#ffffff" align="left">���뷽ʽ</td>
            <td width="450" bgcolor="#ffffff">����</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">ͨ����¼</td>
            <td width="450" bgcolor="#ffffff">δ������+�ѽ�����+�Ѳ��绰��¼</td>
        </tr>
        <tr>
            <td width="100" valign="center" bgcolor="#ffffff" align="left">ͨѶ¼</td>
            <td width="450" bgcolor="#ffffff">S60��׼����ƬʽͨѶ¼</td>
        </tr>
        <tr>
            <td bgcolor="#f1f7fc" colspan="2">
            <p><b>���繦��</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">�����ʼ�</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">WWW�����</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">WAP�����</td>
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
            <p><b>������</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����ģʽ</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��������</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����¼</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">�ճ̱�</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����ʱ��</td>
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
            <p><b>��������</b></p>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">GPS����</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">���Ӵʵ�</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����ͼƬ</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">������</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��������ʶ��</td>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">����ͼƬʶ��</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">�������ǽ</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��������</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">ͼ�β˵�</td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td width="100" style="padding: 5px 0px 5px 10px;">
                        <table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#c5d7ed">
                            <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">���</td>
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
                                    <td width="100%" bgcolor="#f1f7fc" align="middle" style="padding: 2px; font-weight: bold;">��λ����</td>
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

mysql> #��������
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
|       32 |      3 | ECS000032 | ŵ����N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select * from goods where goods_id=32;
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       32 |      3 | ECS000032 | ŵ����N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> 
mysql> 
mysql> select * from goods where goods_id=32;
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       32 |      3 | ECS000032 | ŵ����N85  |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select goods_name from goods where cat_id!=3;
+------------------------------+
| goods_name                   |
+------------------------------+
| KD876                        |
| ŵ����N85ԭװ�����          |
| ŵ����ԭװ5800����           |
| ����ԭװM2��������           |
| ʤ��KINGMAX�ڴ濨            |
| ŵ����N85ԭװ����������HS-82 |
| ŵ����5800XM                 |
| ���ΰҵG101                 |
| ����T5                       |
| ŵ����N96                    |
| С��ͨ/�̻�50Ԫ��ֵ��        |
| С��ͨ/�̻�20Ԫ��ֵ��        |
| ��ͨ100Ԫ��ֵ��              |
| ��ͨ50Ԫ��ֵ��               |
| �ƶ�100Ԫ��ֵ��              |
| �ƶ�20Ԫ��ֵ��               |
+------------------------------+
16 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id!=3 and ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select goods_name,cat_id from goods where cat_id!=3;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ����ԭװM2��������           |     11 |
| ʤ��KINGMAX�ڴ濨            |     11 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ŵ����5800XM                 |      4 |
| ���ΰҵG101                 |      2 |
| ����T5                       |      4 |
| ŵ����N96                    |      5 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     13 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     13 |
| ��ͨ100Ԫ��ֵ��              |     15 |
| ��ͨ50Ԫ��ֵ��               |     15 |
| �ƶ�100Ԫ��ֵ��              |     14 |
| �ƶ�20Ԫ��ֵ��               |     14 |
+------------------------------+--------+
16 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id<>3;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ����ԭװM2��������           |     11 |
| ʤ��KINGMAX�ڴ濨            |     11 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ŵ����5800XM                 |      4 |
| ���ΰҵG101                 |      2 |
| ����T5                       |      4 |
| ŵ����N96                    |      5 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     13 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     13 |
| ��ͨ100Ԫ��ֵ��              |     15 |
| ��ͨ50Ԫ��ֵ��               |     15 |
| �ƶ�100Ԫ��ֵ��              |     14 |
| �ƶ�20Ԫ��ֵ��               |     14 |
+------------------------------+--------+
16 rows in set (0.00 sec)

mysql> select sname,shop_price from goods where shop_price>3000;
ERROR 1054 (42S22): Unknown column 'sname' in 'field list'
mysql> select goods_name,shop_price from goods where shop_price>3000;
+----------------+------------+
| goods_name     | shop_price |
+----------------+------------+
| ���մ�Touch HD |    5999.00 |
| ŵ����N96      |    3700.00 |
| ŵ����N85      |    3010.00 |
+----------------+------------+
3 rows in set (0.00 sec)

mysql> select goods_name,shop_price from goods where shop_price<=100;
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| ŵ����N85ԭװ�����          |      58.00 |
| ŵ����ԭװ5800����           |      68.00 |
| ����ԭװM2��������           |      20.00 |
| ʤ��KINGMAX�ڴ濨            |      42.00 |
| ŵ����N85ԭװ����������HS-82 |     100.00 |
| С��ͨ/�̻�50Ԫ��ֵ��        |      48.00 |
| С��ͨ/�̻�20Ԫ��ֵ��        |      19.00 |
| ��ͨ100Ԫ��ֵ��              |      95.00 |
| ��ͨ50Ԫ��ֵ��               |      45.00 |
| �ƶ�100Ԫ��ֵ��              |      90.00 |
| �ƶ�20Ԫ��ֵ��               |      18.00 |
+------------------------------+------------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id in(4,11);
+--------------------+--------+
| goods_name         | cat_id |
+--------------------+--------+
| KD876              |      4 |
| ����ԭװM2�������� |     11 |
| ʤ��KINGMAX�ڴ濨  |     11 |
| ŵ����5800XM       |      4 |
| ����T5             |      4 |
+--------------------+--------+
5 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=4 or cat_id=11;
+--------------------+--------+
| goods_name         | cat_id |
+--------------------+--------+
| KD876              |      4 |
| ����ԭװM2�������� |     11 |
| ʤ��KINGMAX�ڴ濨  |     11 |
| ŵ����5800XM       |      4 |
| ����T5             |      4 |
+--------------------+--------+
5 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id between 4 and 11;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ����ԭװM2��������           |     11 |
| ʤ��KINGMAX�ڴ濨            |     11 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ŵ����5800XM                 |      4 |
| ����T5                       |      4 |
| ŵ����N96                    |      5 |
+------------------------------+--------+
9 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where market_price>=100 and market_price<=500;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| ŵ����N85ԭװ����������HS-82 |      8 |
| ������9@9v                   |      3 |
| ����BC01                     |      3 |
| ��ͨ100Ԫ��ֵ��              |     15 |
+------------------------------+--------+
4 rows in set (0.00 sec)

mysql> select goods_name,market_price from goods where market_price>=100 and market_price<=500;
+------------------------------+--------------+
| goods_name                   | market_price |
+------------------------------+--------------+
| ŵ����N85ԭװ����������HS-82 |       120.00 |
| ������9@9v                   |       478.79 |
| ����BC01                     |       336.00 |
| ��ͨ100Ԫ��ֵ��              |       100.00 |
+------------------------------+--------------+
4 rows in set (0.00 sec)

mysql> 
mysql> select goods_name,cat_id from goods where cat_id!=4 or cat_id!=11
    -> ;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| KD876                        |      4 |
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ����ԭװM2��������           |     11 |
| ʤ��KINGMAX�ڴ濨            |     11 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ������9@9v                   |      3 |
| ŵ����E66                    |      3 |
| ����C702c                    |      3 |
| ����C702c                    |      3 |
| Ħ������A810                 |      3 |
| ŵ����5320 XpressMusic       |      3 |
| ŵ����5800XM                 |      4 |
| Ħ������A810                 |      3 |
| ���ΰҵG101                 |      2 |
| ����N7                       |      3 |
| ����T5                       |      4 |
| ����SGH-F258                 |      3 |
| ����BC01                     |      3 |
| ���� A30                     |      3 |
| ���մ�Touch HD               |      3 |
| ŵ����N96                    |      5 |
| P806                         |      3 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     13 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     13 |
| ��ͨ100Ԫ��ֵ��              |     15 |
| ��ͨ50Ԫ��ֵ��               |     15 |
| �ƶ�100Ԫ��ֵ��              |     14 |
| �ƶ�20Ԫ��ֵ��               |     14 |
| Ħ������E8                   |      3 |
| ŵ����N85                    |      3 |
+------------------------------+--------+
31 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id!=4 and cat_id!=11;
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ������9@9v                   |      3 |
| ŵ����E66                    |      3 |
| ����C702c                    |      3 |
| ����C702c                    |      3 |
| Ħ������A810                 |      3 |
| ŵ����5320 XpressMusic       |      3 |
| Ħ������A810                 |      3 |
| ���ΰҵG101                 |      2 |
| ����N7                       |      3 |
| ����SGH-F258                 |      3 |
| ����BC01                     |      3 |
| ���� A30                     |      3 |
| ���մ�Touch HD               |      3 |
| ŵ����N96                    |      5 |
| P806                         |      3 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     13 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     13 |
| ��ͨ100Ԫ��ֵ��              |     15 |
| ��ͨ50Ԫ��ֵ��               |     15 |
| �ƶ�100Ԫ��ֵ��              |     14 |
| �ƶ�20Ԫ��ֵ��               |     14 |
| Ħ������E8                   |      3 |
| ŵ����N85                    |      3 |
+------------------------------+--------+
26 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id not in(4,11);
+------------------------------+--------+
| goods_name                   | cat_id |
+------------------------------+--------+
| ŵ����N85ԭװ�����          |      8 |
| ŵ����ԭװ5800����           |      8 |
| ŵ����N85ԭװ����������HS-82 |      8 |
| ������9@9v                   |      3 |
| ŵ����E66                    |      3 |
| ����C702c                    |      3 |
| ����C702c                    |      3 |
| Ħ������A810                 |      3 |
| ŵ����5320 XpressMusic       |      3 |
| Ħ������A810                 |      3 |
| ���ΰҵG101                 |      2 |
| ����N7                       |      3 |
| ����SGH-F258                 |      3 |
| ����BC01                     |      3 |
| ���� A30                     |      3 |
| ���մ�Touch HD               |      3 |
| ŵ����N96                    |      5 |
| P806                         |      3 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     13 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     13 |
| ��ͨ100Ԫ��ֵ��              |     15 |
| ��ͨ50Ԫ��ֵ��               |     15 |
| �ƶ�100Ԫ��ֵ��              |     14 |
| �ƶ�20Ԫ��ֵ��               |     14 |
| Ħ������E8                   |      3 |
| ŵ����N85                    |      3 |
+------------------------------+--------+
26 rows in set (0.00 sec)

mysql> select goods_name,cat_id shop_price from goods where (shop_price>=100 and shop_price<=300) or (shop_price>=2000 and shop_price<=5000);
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| ŵ����N85ԭװ����������HS-82 |          8 |
| ŵ����E66                    |          3 |
| ŵ����5800XM                 |          4 |
| ����N7                       |          3 |
| ����T5                       |          4 |
| ����BC01                     |          3 |
| ���� A30                     |          3 |
| ŵ����N96                    |          5 |
| P806                         |          3 |
| ŵ����N85                    |          3 |
+------------------------------+------------+
10 rows in set (0.00 sec)

mysql> select goods_name,cat_id shop_price from goods where (shop_price>=100 and shop_price<=300);
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| ŵ����N85ԭװ����������HS-82 |          8 |
| ����BC01                     |          3 |
+------------------------------+------------+
2 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price from goods where (shop_price>=100 and shop_price<=300) or (shop_price>=2000 and shop_price<=5000);
+------------------------------+--------+------------+
| goods_name                   | cat_id | shop_price |
+------------------------------+--------+------------+
| ŵ����N85ԭװ����������HS-82 |      8 |     100.00 |
| ŵ����E66                    |      3 |    2298.00 |
| ŵ����5800XM                 |      4 |    2625.00 |
| ����N7                       |      3 |    2300.00 |
| ����T5                       |      4 |    2878.00 |
| ����BC01                     |      3 |     280.00 |
| ���� A30                     |      3 |    2000.00 |
| ŵ����N96                    |      5 |    3700.00 |
| P806                         |      3 |    2000.00 |
| ŵ����N85                    |      3 |    3010.00 |
+------------------------------+--------+------------+
10 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price from goods where shop_price>=100 and shop_price<=300 or shop_price>=2000 and shop_price<=500
    -> 0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '0' at line 2
mysql> select goods_name,cat_id,shop_price from goods where shop_price>=100 and shop_price<=300 or shop_price>=2000 and shop_price<=5000;
+------------------------------+--------+------------+
| goods_name                   | cat_id | shop_price |
+------------------------------+--------+------------+
| ŵ����N85ԭװ����������HS-82 |      8 |     100.00 |
| ŵ����E66                    |      3 |    2298.00 |
| ŵ����5800XM                 |      4 |    2625.00 |
| ����N7                       |      3 |    2300.00 |
| ����T5                       |      4 |    2878.00 |
| ����BC01                     |      3 |     280.00 |
| ���� A30                     |      3 |    2000.00 |
| ŵ����N96                    |      5 |    3700.00 |
| P806                         |      3 |    2000.00 |
| ŵ����N85                    |      3 |    3010.00 |
+------------------------------+--------+------------+
10 rows in set (0.00 sec)

mysql> 
mysql> select goods_name from goods where cat_id=3 and shop_price>1000 and shop_price<3000 and click_count>5;
+------------------------+
| goods_name             |
+------------------------+
| ŵ����E66              |
| ����C702c              |
| ŵ����5320 XpressMusic |
| P806                   |
+------------------------+
4 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and shop_price>1000 and shop_price<3000 and click_count>5;
+------------------------+--------+------------+-------------+
| goods_name             | cat_id | shop_price | click_count |
+------------------------+--------+------------+-------------+
| ŵ����E66              |      3 |    2298.00 |          20 |
| ����C702c              |      3 |    1328.00 |          11 |
| ŵ����5320 XpressMusic |      3 |    1311.00 |          13 |
| P806                   |      3 |    2000.00 |          35 |
+------------------------+--------+------------+-------------+
4 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=3;
+------------------------+--------+
| goods_name             | cat_id |
+------------------------+--------+
| ������9@9v             |      3 |
| ŵ����E66              |      3 |
| ����C702c              |      3 |
| ����C702c              |      3 |
| Ħ������A810           |      3 |
| ŵ����5320 XpressMusic |      3 |
| Ħ������A810           |      3 |
| ����N7                 |      3 |
| ����SGH-F258           |      3 |
| ����BC01               |      3 |
| ���� A30               |      3 |
| ���մ�Touch HD         |      3 |
| P806                   |      3 |
| Ħ������E8             |      3 |
| ŵ����N85              |      3 |
+------------------------+--------+
15 rows in set (0.00 sec)

mysql> select goods_name,cat_id from goods where cat_id=3 and click_count>5;
+------------------------+--------+
| goods_name             | cat_id |
+------------------------+--------+
| ������9@9v             |      3 |
| ŵ����E66              |      3 |
| ����C702c              |      3 |
| Ħ������A810           |      3 |
| ŵ����5320 XpressMusic |      3 |
| Ħ������A810           |      3 |
| ����SGH-F258           |      3 |
| ����BC01               |      3 |
| ���մ�Touch HD         |      3 |
| P806                   |      3 |
| ŵ����N85              |      3 |
+------------------------+--------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id,click_count from goods where cat_id=3 and click_count>5;
+------------------------+--------+-------------+
| goods_name             | cat_id | click_count |
+------------------------+--------+-------------+
| ������9@9v             |      3 |           9 |
| ŵ����E66              |      3 |          20 |
| ����C702c              |      3 |          11 |
| Ħ������A810           |      3 |          13 |
| ŵ����5320 XpressMusic |      3 |          13 |
| Ħ������A810           |      3 |           8 |
| ����SGH-F258           |      3 |           7 |
| ����BC01               |      3 |          14 |
| ���մ�Touch HD         |      3 |          15 |
| P806                   |      3 |          35 |
| ŵ����N85              |      3 |           9 |
+------------------------+--------+-------------+
11 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and click_count>5 and shop_price>1000;
+------------------------+--------+------------+-------------+
| goods_name             | cat_id | shop_price | click_count |
+------------------------+--------+------------+-------------+
| ŵ����E66              |      3 |    2298.00 |          20 |
| ����C702c              |      3 |    1328.00 |          11 |
| ŵ����5320 XpressMusic |      3 |    1311.00 |          13 |
| ���մ�Touch HD         |      3 |    5999.00 |          15 |
| P806                   |      3 |    2000.00 |          35 |
| ŵ����N85              |      3 |    3010.00 |           9 |
+------------------------+--------+------------+-------------+
6 rows in set (0.00 sec)

mysql> select goods_name,cat_id,shop_price,click_count from goods where cat_id=3 and click_count>5 and (shop_price<1000 or shop_price>3000);
+----------------+--------+------------+-------------+
| goods_name     | cat_id | shop_price | click_count |
+----------------+--------+------------+-------------+
| ������9@9v     |      3 |     399.00 |           9 |
| Ħ������A810   |      3 |     983.00 |          13 |
| Ħ������A810   |      3 |     788.00 |           8 |
| ����SGH-F258   |      3 |     858.00 |           7 |
| ����BC01       |      3 |     280.00 |          14 |
| ���մ�Touch HD |      3 |    5999.00 |          15 |
| ŵ����N85      |      3 |    3010.00 |           9 |
+----------------+--------+------------+-------------+
7 rows in set (0.00 sec)

mysql> select goods_name,cat_id where cat_id=1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where cat_id=1' at line 1
mysql> select goods_name,cat_id from goods where cat_id=1;
Empty set (0.00 sec)

mysql> select * from goods where cat_id=1;
Empty set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "ŵ����%";
+------------------------------+------------+
| goods_name                   | shop_price |
+------------------------------+------------+
| ŵ����N85ԭװ�����          |      58.00 |
| ŵ����ԭװ5800����           |      68.00 |
| ŵ����N85ԭװ����������HS-82 |     100.00 |
| ŵ����E66                    |    2298.00 |
| ŵ����5320 XpressMusic       |    1311.00 |
| ŵ����5800XM                 |    2625.00 |
| ŵ����N96                    |    3700.00 |
| ŵ����N85                    |    3010.00 |
+------------------------------+------------+
8 rows in set (0.01 sec)

mysql> select goods_name,shop_price from goods where goods_name like "ŵ����E66%";
+------------+------------+
| goods_name | shop_price |
+------------+------------+
| ŵ����E66  |    2298.00 |
+------------+------------+
1 row in set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "ŵ����__";
Empty set (0.00 sec)

mysql> select goods_name,shop_price from goods where goods_name like "ŵ����___";
+------------+------------+
| goods_name | shop_price |
+------------+------------+
| ŵ����E66  |    2298.00 |
| ŵ����N96  |    3700.00 |
| ŵ����N85  |    3010.00 |
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
|        4 |      8 | ECS000004 | ŵ����N85ԭװ�����          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | ŵ����ԭװ5800����           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | ����ԭװM2��������           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | ʤ��KINGMAX�ڴ濨            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | ŵ����N85ԭװ����������HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | ������9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | ŵ����E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | ����C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | ����C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | Ħ������A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | ŵ����5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | ŵ����5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | Ħ������A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | ���ΰҵG101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | ����N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | ����T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | ����SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | ����BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | ���� A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | ���մ�Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | ŵ����N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | С��ͨ/�̻�50Ԫ��ֵ��        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | С��ͨ/�̻�20Ԫ��ֵ��        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | ��ͨ100Ԫ��ֵ��              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | ��ͨ50Ԫ��ֵ��               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | �ƶ�100Ԫ��ֵ��              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | �ƶ�20Ԫ��ֵ��               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | Ħ������E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | ŵ����N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select * from goods where 1+2;
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name                   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|        1 |      4 | ECS000000 | KD876                        |           7 |            1 |      1665.60 |    1388.00 | 1240902890 |       1 |      1 |      1 |
|        4 |      8 | ECS000004 | ŵ����N85ԭװ�����          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | ŵ����ԭװ5800����           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | ����ԭװM2��������           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | ʤ��KINGMAX�ڴ濨            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | ŵ����N85ԭװ����������HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | ������9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | ŵ����E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | ����C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | ����C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | Ħ������A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | ŵ����5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | ŵ����5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | Ħ������A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | ���ΰҵG101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | ����N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | ����T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | ����SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | ����BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | ���� A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | ���մ�Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | ŵ����N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | С��ͨ/�̻�50Ԫ��ֵ��        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | С��ͨ/�̻�20Ԫ��ֵ��        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | ��ͨ100Ԫ��ֵ��              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | ��ͨ50Ԫ��ֵ��               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | �ƶ�100Ԫ��ֵ��              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | �ƶ�20Ԫ��ֵ��               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | Ħ������E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | ŵ����N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select * from goods where cat_id=2;;
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       16 |      2 | ECS000016 | ���ΰҵG101 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

ERROR: 
No query specified

mysql> select * from goods where cat_id=2;
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
| goods_id | cat_id | goods_sn  | goods_name   | click_count | goods_number | market_price | shop_price | add_time   | is_best | is_new | is_hot |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
|       16 |      2 | ECS000016 | ���ΰҵG101 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
+----------+--------+-----------+--------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
1 row in set (0.00 sec)

mysql> select goods_id,goods_name,market_price-shop_price as descount from goods;
+----------+------------------------------+----------+
| goods_id | goods_name                   | descount |
+----------+------------------------------+----------+
|        1 | KD876                        |   277.60 |
|        4 | ŵ����N85ԭװ�����          |    11.60 |
|        3 | ŵ����ԭװ5800����           |    13.60 |
|        5 | ����ԭװM2��������           |     4.00 |
|        6 | ʤ��KINGMAX�ڴ濨            |     8.40 |
|        7 | ŵ����N85ԭװ����������HS-82 |    20.00 |
|        8 | ������9@9v                   |    79.79 |
|        9 | ŵ����E66                    |   459.60 |
|       10 | ����C702c                    |   265.60 |
|       11 | ����C702c                    | -1300.00 |
|       12 | Ħ������A810                 |   196.60 |
|       13 | ŵ����5320 XpressMusic       |   262.20 |
|       14 | ŵ����5800XM                 |   525.00 |
|       15 | Ħ������A810                 |   157.60 |
|       16 | ���ΰҵG101                 |   164.67 |
|       17 | ����N7                       |   460.00 |
|       18 | ����T5                       |   575.60 |
|       19 | ����SGH-F258                 |   171.60 |
|       20 | ����BC01                     |    56.00 |
|       21 | ���� A30                     |   400.00 |
|       22 | ���մ�Touch HD               |  1199.80 |
|       23 | ŵ����N96                    |   740.00 |
|       24 | P806                         |   400.00 |
|       25 | С��ͨ/�̻�50Ԫ��ֵ��        |     9.59 |
|       26 | С��ͨ/�̻�20Ԫ��ֵ��        |     3.80 |
|       27 | ��ͨ100Ԫ��ֵ��              |     5.00 |
|       28 | ��ͨ50Ԫ��ֵ��               |     5.00 |
|       29 | �ƶ�100Ԫ��ֵ��              |   -90.00 |
|       30 | �ƶ�20Ԫ��ֵ��               |     3.00 |
|       31 | Ħ������E8                   |   267.39 |
|       32 | ŵ����N85                    |   602.00 |
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
|        9 | ŵ����E66              |
|       10 | ����C702c              |
|       13 | ŵ����5320 XpressMusic |
|       14 | ŵ����5800XM           |
|       17 | ����N7                 |
|       18 | ����T5                 |
|       21 | ���� A30               |
|       22 | ���մ�Touch HD         |
|       23 | ŵ����N96              |
|       24 | P806                   |
|       31 | Ħ������E8             |
|       32 | ŵ����N85              |
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
|        9 | ŵ����E66              |   459.60 |
|       10 | ����C702c              |   265.60 |
|       13 | ŵ����5320 XpressMusic |   262.20 |
|       14 | ŵ����5800XM           |   525.00 |
|       17 | ����N7                 |   460.00 |
|       18 | ����T5                 |   575.60 |
|       21 | ���� A30               |   400.00 |
|       22 | ���մ�Touch HD         |  1199.80 |
|       23 | ŵ����N96              |   740.00 |
|       24 | P806                   |   400.00 |
|       31 | Ħ������E8             |   267.39 |
|       32 | ŵ����N85              |   602.00 |
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
|        9 | ŵ����E66              |   459.60 |
|       10 | ����C702c              |   265.60 |
|       13 | ŵ����5320 XpressMusic |   262.20 |
|       14 | ŵ����5800XM           |   525.00 |
|       17 | ����N7                 |   460.00 |
|       18 | ����T5                 |   575.60 |
|       21 | ���� A30               |   400.00 |
|       22 | ���մ�Touch HD         |  1199.80 |
|       23 | ŵ����N96              |   740.00 |
|       24 | P806                   |   400.00 |
|       31 | Ħ������E8             |   267.39 |
|       32 | ŵ����N85              |   602.00 |
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
|        4 |      8 | ECS000004 | ŵ����N85ԭװ�����          |           0 |           17 |        69.60 |      58.00 | 1241422402 |       0 |      0 |      0 |
|        3 |      8 | ECS000002 | ŵ����ԭװ5800����           |           3 |           24 |        81.60 |      68.00 | 1241422082 |       0 |      0 |      0 |
|        5 |     11 | ECS000005 | ����ԭװM2��������           |           3 |            8 |        24.00 |      20.00 | 1241422518 |       1 |      1 |      0 |
|        6 |     11 | ECS000006 | ʤ��KINGMAX�ڴ濨            |           0 |           15 |        50.40 |      42.00 | 1241422573 |       0 |      0 |      0 |
|        7 |      8 | ECS000007 | ŵ����N85ԭװ����������HS-82 |           0 |           20 |       120.00 |     100.00 | 1241422785 |       0 |      0 |      0 |
|        8 |      3 | ECS000008 | ������9@9v                   |           9 |            1 |       478.79 |     399.00 | 1241425512 |       1 |      1 |      1 |
|        9 |      3 | ECS000009 | ŵ����E66                    |          20 |            4 |      2757.60 |    2298.00 | 1241511871 |       1 |      1 |      1 |
|       10 |      3 | ECS000010 | ����C702c                    |          11 |            7 |      1593.60 |    1328.00 | 1241965622 |       0 |      0 |      1 |
|       11 |      3 | ECS000011 | ����C702c                    |           0 |            1 |         0.00 |    1300.00 | 1241966951 |       0 |      0 |      0 |
|       12 |      3 | ECS000012 | Ħ������A810                 |          13 |            8 |      1179.60 |     983.00 | 1245297652 |       0 |      1 |      0 |
|       13 |      3 | ECS000013 | ŵ����5320 XpressMusic       |          13 |            8 |      1573.20 |    1311.00 | 1241967762 |       0 |      0 |      1 |
|       14 |      4 | ECS000014 | ŵ����5800XM                 |           6 |            1 |      3150.00 |    2625.00 | 1241968492 |       0 |      0 |      1 |
|       15 |      3 | ECS000015 | Ħ������A810                 |           8 |            3 |       945.60 |     788.00 | 1241968703 |       0 |      1 |      1 |
|       16 |      2 | ECS000016 | ���ΰҵG101                 |           3 |            0 |       988.00 |     823.33 | 1241968949 |       0 |      0 |      0 |
|       17 |      3 | ECS000017 | ����N7                       |           2 |            1 |      2760.00 |    2300.00 | 1241969394 |       1 |      0 |      1 |
|       18 |      4 | ECS000018 | ����T5                       |           0 |            1 |      3453.60 |    2878.00 | 1241969533 |       0 |      0 |      0 |
|       19 |      3 | ECS000019 | ����SGH-F258                 |           7 |           12 |      1029.60 |     858.00 | 1241970139 |       1 |      1 |      1 |
|       20 |      3 | ECS000020 | ����BC01                     |          14 |           12 |       336.00 |     280.00 | 1241970417 |       1 |      1 |      1 |
|       21 |      3 | ECS000021 | ���� A30                     |           4 |           40 |      2400.00 |    2000.00 | 1241970634 |       0 |      0 |      0 |
|       22 |      3 | ECS000022 | ���մ�Touch HD               |          15 |            1 |      7198.80 |    5999.00 | 1241971076 |       1 |      1 |      0 |
|       23 |      5 | ECS000023 | ŵ����N96                    |          17 |            8 |      4440.00 |    3700.00 | 1241971488 |       1 |      1 |      0 |
|       24 |      3 | ECS000024 | P806                         |          35 |          100 |      2400.00 |    2000.00 | 1241971981 |       1 |      1 |      1 |
|       25 |     13 | ECS000025 | С��ͨ/�̻�50Ԫ��ֵ��        |           0 |            2 |        57.59 |      48.00 | 1241972709 |       1 |      0 |      1 |
|       26 |     13 | ECS000026 | С��ͨ/�̻�20Ԫ��ֵ��        |           0 |            2 |        22.80 |      19.00 | 1241972789 |       0 |      0 |      1 |
|       27 |     15 | ECS000027 | ��ͨ100Ԫ��ֵ��              |           0 |            2 |       100.00 |      95.00 | 1241972894 |       1 |      1 |      1 |
|       28 |     15 | ECS000028 | ��ͨ50Ԫ��ֵ��               |           0 |            0 |        50.00 |      45.00 | 1241972976 |       0 |      0 |      1 |
|       29 |     14 | ECS000029 | �ƶ�100Ԫ��ֵ��              |           0 |            0 |         0.00 |      90.00 | 1241973022 |       1 |      0 |      1 |
|       30 |     14 | ECS000030 | �ƶ�20Ԫ��ֵ��               |           1 |            9 |        21.00 |      18.00 | 1241973114 |       1 |      0 |      1 |
|       31 |      3 | ECS000031 | Ħ������E8                   |           5 |            1 |      1604.39 |    1337.00 | 1242110412 |       0 |      0 |      0 |
|       32 |      3 | ECS000032 | ŵ����N85                    |           9 |            4 |      3612.00 |    3010.00 | 1242110760 |       0 |      1 |      1 |
+----------+--------+-----------+------------------------------+-------------+--------------+--------------+------------+------------+---------+--------+--------+
31 rows in set (0.00 sec)

mysql> select goods_name,shop_price from goods order by shop_price desc limit 1;
+----------------+------------+
| goods_name     | shop_price |
+----------------+------------+
| ���մ�Touch HD |    5999.00 |
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

mysql> selecct avg(shop_price�� from goods;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selecct avg(shop_price�� from goods' at line 1
mysql> select avg(shop_price�� from goods;
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
| ŵ����N85ԭװ�����          |    986.00 |
| ŵ����ԭװ5800����           |   1632.00 |
| ����ԭװM2��������           |    160.00 |
| ʤ��KINGMAX�ڴ濨            |    630.00 |
| ŵ����N85ԭװ����������HS-82 |   2000.00 |
| ������9@9v                   |    399.00 |
| ŵ����E66                    |   9192.00 |
| ����C702c                    |   9296.00 |
| ����C702c                    |   1300.00 |
| Ħ������A810                 |   7864.00 |
| ŵ����5320 XpressMusic       |  10488.00 |
| ŵ����5800XM                 |   2625.00 |
| Ħ������A810                 |   2364.00 |
| ���ΰҵG101                 |      0.00 |
| ����N7                       |   2300.00 |
| ����T5                       |   2878.00 |
| ����SGH-F258                 |  10296.00 |
| ����BC01                     |   3360.00 |
| ���� A30                     |  80000.00 |
| ���մ�Touch HD               |   5999.00 |
| ŵ����N96                    |  29600.00 |
| P806                         | 200000.00 |
| С��ͨ/�̻�50Ԫ��ֵ��        |     96.00 |
| С��ͨ/�̻�20Ԫ��ֵ��        |     38.00 |
| ��ͨ100Ԫ��ֵ��              |    190.00 |
| ��ͨ50Ԫ��ֵ��               |      0.00 |
| �ƶ�100Ԫ��ֵ��              |      0.00 |
| �ƶ�20Ԫ��ֵ��               |    162.00 |
| Ħ������E8                   |   1337.00 |
| ŵ����N85                    |  12040.00 |
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

mysql> #��ѯ����ѹ���Ҵ���20000����Ʒ��
mysql> select goods_name,(market_price-shop_price) as discount from goods having discount>200;
+------------------------+----------+
| goods_name             | discount |
+------------------------+----------+
| KD876                  |   277.60 |
| ŵ����E66              |   459.60 |
| ����C702c              |   265.60 |
| ŵ����5320 XpressMusic |   262.20 |
| ŵ����5800XM           |   525.00 |
| ����N7                 |   460.00 |
| ����T5                 |   575.60 |
| ���� A30               |   400.00 |
| ���մ�Touch HD         |  1199.80 |
| ŵ����N96              |   740.00 |
| P806                   |   400.00 |
| Ħ������E8             |   267.39 |
| ŵ����N85              |   602.00 |
+------------------------+----------+
13 rows in set (0.00 sec)

mysql> select goods_name,(market_price-shop_price) as discount from goods having (market_price-shop_price)>200;
ERROR 1054 (42S22): Unknown column 'market_price' in 'having clause'
mysql> select goods_name,(market_price-shop_price) as discount from goods where (market_price-shop_price)>200;
+------------------------+----------+
| goods_name             | discount |
+------------------------+----------+
| KD876                  |   277.60 |
| ŵ����E66              |   459.60 |
| ����C702c              |   265.60 |
| ŵ����5320 XpressMusic |   262.20 |
| ŵ����5800XM           |   525.00 |
| ����N7                 |   460.00 |
| ����T5                 |   575.60 |
| ���� A30               |   400.00 |
| ���մ�Touch HD         |  1199.80 |
| ŵ����N96              |   740.00 |
| P806                   |   400.00 |
| Ħ������E8             |   267.39 |
| ŵ����N85              |   602.00 |
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
    -> ("����","��ѧ",90),("����","����",80),("����","����",40),("����","����",55),("����","����",45),("����","����",30);
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

mysql> ("����","��ѧ",90),("����","����",80),("����","����",40),("����","����",55),("����","����",45),("����","����",30);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"����","��ѧ",90),("����","����",80),("����","����",40),("����","' at line 1
mysql> insert into result 
    -> values
    -> ("����","��ѧ",90),("����","����",80),("����","����",40),("����","����",55),("����","����",45),("����","����",30);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from result;
+------+---------+-------+
| name | subject | score |
+------+---------+-------+
| ���� | ��ѧ    |    90 |
| ���� | ����    |    80 |
| ���� | ����    |    40 |
| ���� | ����    |    55 |
| ���� | ����    |    45 |
| ���� | ����    |    30 |
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
| ���� |    70.0000 |
| ���� |    50.0000 |
| ���� |    30.0000 |
+------+------------+
3 rows in set (0.05 sec)

mysql> select name,avg(score) from result group by name having score<60;
ERROR 1054 (42S22): Unknown column 'score' in 'having clause'
mysql> select name,avg(score),score from result group by name;
+------+------------+-------+
| name | avg(score) | score |
+------+------------+-------+
| ���� |    70.0000 |    90 |
| ���� |    50.0000 |    55 |
| ���� |    30.0000 |    30 |
+------+------------+-------+
3 rows in set (0.00 sec)

mysql> select name,avg(score),score from result group by name;
+------+------------+-------+
| name | avg(score) | score |
+------+------------+-------+
| ���� |    70.0000 |    90 |
| ���� |    50.0000 |    55 |
| ���� |    30.0000 |    30 |
+------+------------+-------+
3 rows in set (0.00 sec)

mysql> select name,subject,score<60 from result;
+------+---------+----------+
| name | subject | score<60 |
+------+---------+----------+
| ���� | ��ѧ    |        0 |
| ���� | ����    |        0 |
| ���� | ����    |        1 |
| ���� | ����    |        1 |
| ���� | ����    |        1 |
| ���� | ����    |        1 |
+------+---------+----------+
6 rows in set (0.00 sec)

mysql> select name,avg(score),sum(score<60) as cont from result group by name where cont>=2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where cont>=2' at line 1
mysql> select name,avg(score),sum(score<60) as cont from result group by name having cont>=2;
+------+------------+------+
| name | avg(score) | cont |
+------+------------+------+
| ���� |    50.0000 |    2 |
+------+------------+------+
1 row in set (0.00 sec)

mysql> select name,count(1) where score<60 group by name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where score<60 group by name' at line 1
mysql> select name,count(1) from result where score<60 group by name;
+------+----------+
| name | count(1) |
+------+----------+
| ���� |        1 |
| ���� |        2 |
| ���� |        1 |
+------+----------+
3 rows in set (0.00 sec)

mysql> select name from result where score<60 group by name;
+------+
| name |
+------+
| ���� |
| ���� |
| ���� |
+------+
3 rows in set (0.00 sec)

mysql> select name,score from result where score<60;
+------+-------+
| name | score |
+------+-------+
| ���� |    40 |
| ���� |    55 |
| ���� |    45 |
| ���� |    30 |
+------+-------+
4 rows in set (0.00 sec)

mysql> select name,score,count(1) from result where score<60;
+------+-------+----------+
| name | score | count(1) |
+------+-------+----------+
| ���� |    40 |        4 |
+------+-------+----------+
1 row in set (0.00 sec)

mysql> select name,score,count(1) from result where score<60 group by name;
+------+-------+----------+
| name | score | count(1) |
+------+-------+----------+
| ���� |    40 |        1 |
| ���� |    55 |        2 |
| ���� |    30 |        1 |
+------+-------+----------+
3 rows in set (0.00 sec)

mysql> select name,score,count(1) as g from result where score<60 group by name having g>=2;
+------+-------+---+
| name | score | g |
+------+-------+---+
| ���� |    55 | 2 |
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
| ���� |
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
| ŵ����ԭװ5800����           | 1241422082 |
| ŵ����N85ԭװ�����          | 1241422402 |
| ����ԭװM2��������           | 1241422518 |
| ʤ��KINGMAX�ڴ濨            | 1241422573 |
| ŵ����N85ԭװ����������HS-82 | 1241422785 |
| ������9@9v                   | 1241425512 |
| ŵ����E66                    | 1241511871 |
| ����C702c                    | 1241965622 |
| ����C702c                    | 1241966951 |
| ŵ����5320 XpressMusic       | 1241967762 |
| ŵ����5800XM                 | 1241968492 |
| Ħ������A810                 | 1241968703 |
| ���ΰҵG101                 | 1241968949 |
| ����N7                       | 1241969394 |
| ����T5                       | 1241969533 |
| ����SGH-F258                 | 1241970139 |
| ����BC01                     | 1241970417 |
| ���� A30                     | 1241970634 |
| ���մ�Touch HD               | 1241971076 |
| ŵ����N96                    | 1241971488 |
| P806                         | 1241971981 |
| С��ͨ/�̻�50Ԫ��ֵ��        | 1241972709 |
| С��ͨ/�̻�20Ԫ��ֵ��        | 1241972789 |
| ��ͨ100Ԫ��ֵ��              | 1241972894 |
| ��ͨ50Ԫ��ֵ��               | 1241972976 |
| �ƶ�100Ԫ��ֵ��              | 1241973022 |
| �ƶ�20Ԫ��ֵ��               | 1241973114 |
| Ħ������E8                   | 1242110412 |
| ŵ����N85                    | 1242110760 |
| Ħ������A810                 | 1245297652 |
+------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id,goods_name,add_time from goods order by add_time asc;
+----------+------------------------------+------------+
| goods_id | goods_name                   | add_time   |
+----------+------------------------------+------------+
|        1 | KD876                        | 1240902890 |
|        3 | ŵ����ԭװ5800����           | 1241422082 |
|        4 | ŵ����N85ԭװ�����          | 1241422402 |
|        5 | ����ԭװM2��������           | 1241422518 |
|        6 | ʤ��KINGMAX�ڴ濨            | 1241422573 |
|        7 | ŵ����N85ԭװ����������HS-82 | 1241422785 |
|        8 | ������9@9v                   | 1241425512 |
|        9 | ŵ����E66                    | 1241511871 |
|       10 | ����C702c                    | 1241965622 |
|       11 | ����C702c                    | 1241966951 |
|       13 | ŵ����5320 XpressMusic       | 1241967762 |
|       14 | ŵ����5800XM                 | 1241968492 |
|       15 | Ħ������A810                 | 1241968703 |
|       16 | ���ΰҵG101                 | 1241968949 |
|       17 | ����N7                       | 1241969394 |
|       18 | ����T5                       | 1241969533 |
|       19 | ����SGH-F258                 | 1241970139 |
|       20 | ����BC01                     | 1241970417 |
|       21 | ���� A30                     | 1241970634 |
|       22 | ���մ�Touch HD               | 1241971076 |
|       23 | ŵ����N96                    | 1241971488 |
|       24 | P806                         | 1241971981 |
|       25 | С��ͨ/�̻�50Ԫ��ֵ��        | 1241972709 |
|       26 | С��ͨ/�̻�20Ԫ��ֵ��        | 1241972789 |
|       27 | ��ͨ100Ԫ��ֵ��              | 1241972894 |
|       28 | ��ͨ50Ԫ��ֵ��               | 1241972976 |
|       29 | �ƶ�100Ԫ��ֵ��              | 1241973022 |
|       30 | �ƶ�20Ԫ��ֵ��               | 1241973114 |
|       31 | Ħ������E8                   | 1242110412 |
|       32 | ŵ����N85                    | 1242110760 |
|       12 | Ħ������A810                 | 1245297652 |
+----------+------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id,goods_name,add_time,shop_price from goods order by add_time asc,shop_price desc;
+----------+------------------------------+------------+------------+
| goods_id | goods_name                   | add_time   | shop_price |
+----------+------------------------------+------------+------------+
|        1 | KD876                        | 1240902890 |    1388.00 |
|        3 | ŵ����ԭװ5800����           | 1241422082 |      68.00 |
|        4 | ŵ����N85ԭװ�����          | 1241422402 |      58.00 |
|        5 | ����ԭװM2��������           | 1241422518 |      20.00 |
|        6 | ʤ��KINGMAX�ڴ濨            | 1241422573 |      42.00 |
|        7 | ŵ����N85ԭװ����������HS-82 | 1241422785 |     100.00 |
|        8 | ������9@9v                   | 1241425512 |     399.00 |
|        9 | ŵ����E66                    | 1241511871 |    2298.00 |
|       10 | ����C702c                    | 1241965622 |    1328.00 |
|       11 | ����C702c                    | 1241966951 |    1300.00 |
|       13 | ŵ����5320 XpressMusic       | 1241967762 |    1311.00 |
|       14 | ŵ����5800XM                 | 1241968492 |    2625.00 |
|       15 | Ħ������A810                 | 1241968703 |     788.00 |
|       16 | ���ΰҵG101                 | 1241968949 |     823.33 |
|       17 | ����N7                       | 1241969394 |    2300.00 |
|       18 | ����T5                       | 1241969533 |    2878.00 |
|       19 | ����SGH-F258                 | 1241970139 |     858.00 |
|       20 | ����BC01                     | 1241970417 |     280.00 |
|       21 | ���� A30                     | 1241970634 |    2000.00 |
|       22 | ���մ�Touch HD               | 1241971076 |    5999.00 |
|       23 | ŵ����N96                    | 1241971488 |    3700.00 |
|       24 | P806                         | 1241971981 |    2000.00 |
|       25 | С��ͨ/�̻�50Ԫ��ֵ��        | 1241972709 |      48.00 |
|       26 | С��ͨ/�̻�20Ԫ��ֵ��        | 1241972789 |      19.00 |
|       27 | ��ͨ100Ԫ��ֵ��              | 1241972894 |      95.00 |
|       28 | ��ͨ50Ԫ��ֵ��               | 1241972976 |      45.00 |
|       29 | �ƶ�100Ԫ��ֵ��              | 1241973022 |      90.00 |
|       30 | �ƶ�20Ԫ��ֵ��               | 1241973114 |      18.00 |
|       31 | Ħ������E8                   | 1242110412 |    1337.00 |
|       32 | ŵ����N85                    | 1242110760 |    3010.00 |
|       12 | Ħ������A810                 | 1245297652 |     983.00 |
+----------+------------------------------+------------+------------+
31 rows in set (0.00 sec)

