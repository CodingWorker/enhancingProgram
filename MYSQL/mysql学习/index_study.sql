mysql> create database index_study charset utf8;
Query OK, 1 row affected (0.10 sec)

mysql> Create table index1(
    -> Id int,
    -> Name varchar(20),
    -> Sex boolean,
    -> Index(id)
    -> );
Query OK, 0 rows affected (0.70 sec)

mysql> Explain select * from index1 where id=1 \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: index1
         type: ref
possible_keys: Id
          key: Id
      key_len: 5
          ref: const
         rows: 1
        Extra: NULL
1 row in set (0.01 sec)

mysql> Create table index2(
    -> Id int unique,
    -> Name varchar(20),
    -> Unique index index2_id(id asc)
    -> );
Query OK, 0 rows affected, 1 warning (0.40 sec)

mysql> Explain select * from index2 where id=1 \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: NULL
         type: NULL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: NULL
        Extra: Impossible WHERE noticed after reading const tables
1 row in set (0.00 sec)

mysql> Explain select * from index2 where id=1 \G\c
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: NULL
         type: NULL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: NULL
        Extra: Impossible WHERE noticed after reading const tables
1 row in set (0.00 sec)

mysql> Create table index3(
    -> Id int,
    -> Info varchar(20),
    -> Fulltext index index3_info(info)
    -> )engine=myisam;
Query OK, 0 rows affected (0.10 sec)

mysql> Create table index4(
    -> Id int,
    -> Subject varchar(30),
    -> Index index4_st(subject(10))
    -> );
Query OK, 0 rows affected (0.27 sec)

mysql> Create table index5(
    -> Id int,
    -> Name varchar(20),
    -> Sex char(4),
    -> Index index5_ns(name,sex)
    -> );
Query OK, 0 rows affected (0.28 sec)

mysql> Create table index6(
    -> Id int,
    -> Space geometry not null,
    -> Spatial index index6_sp(space)
    -> )engine=myisam;
Query OK, 0 rows affected (0.16 sec)

mysql> exit
