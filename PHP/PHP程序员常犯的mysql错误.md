#PHP 程序员最常犯的11个MySQL错误

1. 使用MyISAM而不是InnoDB

>Mysql默认使用的是MyISAM，但是多数情况下这是一个糟糕的选择，除非创建的是一个非常简单或是实验性的数据库
>MyISAM不支持外键约束和事务处理，而且当一条数组正在插入或更新时，整个数据表都被锁定。

使用InnoDB能解决这些问题

2. 还在使用PHP的mysql函数
>强烈推荐使用Mysqli扩展，主要基于以下优点：

	可选的面向对象
	prepared表达式，有利于阻止SQL注入的攻击，还能提高性能
	支持更多的表达式和事务处理

另外，使用PDO可以支持多种数据库系统

3. 没有处理用户输入
>永远不要相信用户的输入，用服务器端的PHP验证每个字符串，不要寄希望与js

4. 没有使用UTF-8
>将MySQL字符集设置为UTF-8

5. 相对于SQL,偏爱PHP
>mysql的自有函数要看情况使用
>执行一个查询比在结果集中迭代更有效率
>在分析数据的时候尽量利用一些数据库系统的知识

6. 没有优化SQL语句查询
>99%的PHP性能问题都是由数据库引起的
>多使用mysql的explain、 query profiler函数（见最后介绍）检验查询语句的效率


7. 不能使用正确的数据类型

8. 在查询中使用*
>永远不要使用*来返回一个数据表的所有列

9. 不要使用索引或者过度使用索引
>不要为每个列都设置索引，因为执行了插入和更新操作后所有的索引都要重新生成，这将非常的影响性能
>一般性的原则是:select语句中的任何一个where子句表示的字段都应该使用索引

10. 忘记备份
>虽然比较少见，但是数据库还是有可能遭遇崩溃的危险的，如硬盘损坏、服务器崩溃

11. 不考虑使用其他的数据库
>其他数据库：PostgreSQL和Firebird，这两者也都是开源的
>微软提供了sql server Express，甲骨文提供了10g Express，这两者都是企业级数据库的免费版本。
>对于一个较小的web应用或者嵌入式应用，SQLite也不失为一个可行的替代方案。


MySQL 5.0.37版本加入了MySQL Query Profiler工具。
http://dev.mysql.com/tech-resources/articles/using-new-query-profiler.html

简单的实例
mysql> set profiling=1;
Query OK, 0 rows affected (0.04 sec)

mysql> show profiles;
Empty set (0.00 sec)


mysql> SELECT COUNT(nickname), gender FROM users GROUP BY gender;
+-----------------+--------+
| COUNT(nickname) | gender |
+-----------------+--------+
|       106773 |    0 |
|       106462 |    1 |
+-----------------+--------+
2 rows in set (0.88 sec)


mysql> show profiles;
+----------+------------+-----------------------------------------------------------+
| Query_ID | Duration | Query                                                     |
+----------+------------+-----------------------------------------------------------+
|        1 | 0.88324700 | SELECT COUNT(nickname), gender FROM users GROUP BY gender |
+----------+------------+-----------------------------------------------------------+
1 row in set (0.03 sec)


mysql> show profile for query 1;
+----------------------+-----------+
| Status             | Duration   |
+----------------------+-----------+
| (initialization)     | 0.0000699 |
| Opening tables    | 0.000039   |
| System lock       | 0.000008   |
| Table lock           | 0.000014   |
| init                 | 0.000043   |
| optimizing           | 0.000396   |
| statistics           | 0.000024   |
| preparing          | 0.000079   |
| Creating tmp table | 0.000118   |
| executing          | 0.000008   |
| Copying to tmp table | 0.871251   |
| Sorting result    | 0.000063   |
| Sending data       | 0.009601   |
| end                | 0.000017   |
| removing tmp table | 0.000028   |
| end                | 0.000009   |
| query end          | 0.000006   |
| freeing items        | 0.000015   |
| closing tables    | 0.001449   |
| logging slow query | 0.000009   |
+----------------------+-----------+
20 rows in set (0.02 sec)

mysql>show profile cpu for query 1;
+----------------------+-----------+-----------+------------+
| Status             | Duration   | CPU_user   | CPU_system |
+----------------------+-----------+-----------+------------+
| (initialization)     | 0.0000699 | 0       | 0       |
| Opening tables    | 0.000039   | 0       | 0       |
| System lock       | 0.000008   | 0       | 0       |
| Table lock           | 0.000014   | 0       | 0       |
| init                 | 0.000043   | 0       | 0.001    |
| optimizing           | 0.000396   | 0       | 0       |
| statistics           | 0.000024   | 0       | 0       |
| preparing          | 0.000079   | 0       | 0       |
| Creating tmp table | 0.000118   | 0       | 0       |
| executing          | 0.000008   | 0       | 0       |
| Copying to tmp table | 0.871251   | 0.59391 | 0.253961 |
| Sorting result    | 0.000063   | 0       | 0       |
| Sending data       | 0.009601   | 0.001     | 0.003    |
| end                | 0.000017   | 0       | 0       |
| removing tmp table | 0.000028   | 0       | 0       |
| end                | 0.000009   | 0       | 0       |
| query end          | 0.000006   | 0       | 0       |
| freeing items        | 0.000015   | 0       | 0       |
| closing tables    | 0.001449   | 0.0009990 | 0.001    |
| logging slow query | 0.000009   | 0       | 0       |
+----------------------+-----------+-----------+------------+
20 rows in set (0.00 sec)

mysql> set profiling=0;
Query OK, 0 rows affected (0.00 sec)

