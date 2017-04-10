#07 索引详解2

##唯一索引

###创建
- 直接在创建表的时候，指定某列或某几列为唯一索引

		create table cc(
		//列代码，
		unique index index_unique_email(email)
		);

- 当创建表后再创建索引

		create uinque index uiq_index_email on cc(email);#这样建立必须要指定索引名称

    或者

		alter table 表名 add unique index 索引名 （列名)

###索引的删除

	drop index 索引名 on 表名

或者

	alter table 表名 drop index 索引名

###特点
- 一张表可以有多个唯一索引
- 唯一索引不能重复，但是如果你没有指定not null,唯一索引你能列可以为null
- 唯一索引的使用：当某一列没有重复数据才能使用
- 唯一索引的效率仅次于主键索引，可以优先使用


#普通索引

###创建

- 在创建表的时候直接创建
		
		create table dd(
		//列类型声明
		index 索引名 (name)
		);

- 当创建表后再创建索引
		
		create index 索引名 on 表名 (列名)

	或者
		
		alter table 表名 add index  索引名 (name);

###特点
- 一张表中可以有多个普通索引
- 一个普通索引也可以指向多列
- 普通索引列里的数据可以重复
- 效率相对而言较低

##全文索引--fulltext
主要是针对文章、汉字、英文等字段量相对较大的列的检索，可以快速检索到文章中的某个关键字

表的引擎必须是myisam

###创建
- 直接在建表的时候创建
	
		create table ee(
		//列类型声明
		fulltext (title,article)
		);

###特点
- 默认的全文索引只对myisam存储引擎
- 默认的全文索引只支持英文
- 停止词：对于特别普通和简单的词不会建立索引，而且只支持英文
- 全文索引是以一定的匹配度来索引的

**mysql全文索引不支持中文解决方案**

- 安装mysql中文全文索引插件 mysqlcft
- 可以使用一个专门的中文检索引擎 sphinx 中文版 coreseek


##索引的修改
可以先删除再添加

##索引的原理
二分法、二叉树

注意：
- 较频繁的作为查询条件的字段应该建立索引
- 唯一性太差的字段不适合单独创建索引，即使频繁作为查询条件
- 更新非常频繁的字段不适合创建索引 如 性别/状态
- 不是出现在where子句中的字段不应该建立索引

#SQL优化-正确使用索引

查询要使用索引最重要的条件是**查询条件**中需要使用索引。

**下列几种情况下有可能使用到索引：**

1. 对于创建的多列索引，只要查询条件使用了**最左边的列**，索引一般就会被使用。
2. 对于使用like的查询，查询如果是  ‘%aaa’ 或'_aaa'不会使用到索引,‘aaa%’ 或者'aa%aa'会使用到索引。
   **like查询效果非常的低**

**下列的表将不使用索引：**

1. 如果条件中有or而某些查询条件列没建立索引，即使其中有条件带索引也不会使用。

	如果想要在含有or的查询语句中利用索引，则or之间的每个条件列都必须用到索引，如果没有索引，则应该考虑增加索引(与环境相关 讲解)

		select * from 表名 where 条件1=‘’ or 条件2=‘tt’

2. 对于多列索引，不是使用的第一部分，则不会使用索引。
3. like查询是以%或者_开头
4. 如果列类型是字符串，那一定要在条件中将数据使用引号引用起来。否则不使用索引。
5. 如果mysql估计使用全表扫描要比使用索引快，则不使用索引。


		mysql> explain select goods_id from goods\G
		*************************** 1. row ***************************
		           id: 1
		  select_type: SIMPLE
		        table: goods
		         type: index
		possible_keys: NULL
		          key: PRIMARY
		      key_len: 3
		          ref: NULL
		         rows: 31
		        Extra: Using index
		1 row in set (0.09 sec)

**优化group by 语句**

默认情况，MySQL对所有的group by col1,col2进行排序。这与在查询中指定order by col1, col2类似。如果查询中包括group by但用户想要避免排序结果的消耗，则可以使用order by null禁止排序

**有些情况下，可以使用连接来替代子查询**

因为使用join，MySQL不需要在内存中创建临时表。
		
##索引使用情况查询

- show status like ‘Handler_read%’;

  	大家可以注意：

- handler_read_key:这个值越高越好，越高表示使用索引查询到的次数。
- handler_read_rnd_next:这个值越高，说明查询低效。


#常用SQL优化

**大批量插入数据**

- 对于MyISAM：

		alter table table_name disable keys;
		loading data;
		alter table table_name enable keys;

- 对于Innodb：

		1，将要导入的数据按照主键排序
		2，set unique_checks=0,关闭唯一性校验。
		3，set autocommit=0,关闭自动提交。

###选择合适的存储引擎

**MyISAM:**默认的MySQL存储引擎。如果应用是以读操作和插入操作为主，只有很少的更新和删除操作，并且对事务的完整性、并发性要求不是很高。其优势是访问的速度快。
**MyISAM 在插入数据时，默认放在最后,删除数据后，空间不回收。(不支持事务和外键)**


**InnoDB:**提供了具有提交、回滚和崩溃恢复能力的**事务安全**。但是对比MyISAM，写的处理效率差一些并且会占用更多的磁盘空间。**支持外键，如果安全性要求高，则使用innodb（账户/积分）**

**memory存储引擎:**创建并插入数据较快，当服务器重启后数据会丢失，但表的结构保存，因为是存储在内存中所以速度快

###选择合适的数据类型

在精度要求高的应用中，建议使用定点数**decimal**来存储数值，以保证结果的准确性。
	
	对于使用浮点数和定点数的案例说明
	create table temp1( t1 float(10,2), t2 decimal(10,2));
	insert into temp1 values(1000000.32,1000000,32); 发现 t1 成了 1000000.31 所以有问题.

对于存储引擎是MyISAM的数据库,如果经常做删除和修改记录的操作，要定时执行`optimize table table_name;`功能对表进行碎片整理。

	对于optimize table 表名 演示
	create table temp2( id int) engine=MyISAM;
	insert into temp2 values(1); insert into temp2 values(2); insert into temp2 values(3);
	insert into temp2 select * from temp2;--复制
	delete from temp2 where id=1; 发现该表对应的数据文件没有变小
	定期执行 optimize table temp2 发现表大小变化，碎片整理完毕


	mysql> delete from temp2 where id=1;
	Query OK, 65544 rows affected (0.32 sec)
	
	mysql> optimize table temp2;
	+------------+----------+----------+----------+
	| Table      | Op       | Msg_type | Msg_text |
	+------------+----------+----------+----------+
	| test.temp2 | optimize | status   | OK       |
	+------------+----------+----------+----------+

日期类型要根据实际需要选择能够满足应用的最小存储的早期类型

	create table bbs(id int ,con varchar(1024) , pub_time int);
	date(‘Ymd’,时间-3*24*60*60); 2038年-1-19

**解决时间范围问题，可以参考PHP里的datetime类，可已经很大的时间与数字之间转换**

对于InnoDB它的数据会存在data/ibdata1目录下，在data/数据库/只有一个 *.frm表结构文件.


#表的水平划分

id%6 分为6个表  qq_0 qq_1 qq_2 qq_3 qq_4 qq_5

	<?php
	$id=$_POST['id'];
	$pwd=$_POST['pwd];
	$table_name='qq_'.$id%6;

	?>


###扩展
如果登陆的是名字等不能取模的字符串，要怎么分表

使用md5对字符串进行处理的到16进制的字符串，可以转换为数字从而可以取模利用分表技术









**创建两个相似结构的表：create table qq_1 like qq_0**



#垂直分表

有些表记录数并不多，可能也就2、3万条，但是**字段却很长**，表占用空间很大，检索表时需要执行大量I/O，严重降低了性能。这个时候需要把大的字段拆分到另一个表，**并且该表与原表是一对一的关系。可以通过ID关联** (JOIN)



#分区技术

当某个表海量而且查询条件是按照日期来检索的

关键字 partition by range()()


	create table range( 
	　　money int(11) unsigned not null, 
	　　date datetime 
	　　)partition by range(year(date))( 
	　　partition p2007 values less than (2008), 
	　　partition p2008 values less than (2009), 
	　　partition p2009 values less than (2010) 
	　　partition p2010 values less than maxvalue 
	)；



###文件、图片等大文件用文件系统存储 

数据库只存储路径。图片和文件存放在文件系统，甚至单独放在一台服务器(图床). 


##数据库参数配置 

最重要的参数就是内存，我们主要用的innodb引擎，所以下面两个参数调的很大 
　　innodb_additional_mem_pool_size = 64M
　　innodb_buffer_pool_size =1G
对于myisam，需要调整key_buffer_size
	当然调整参数还是要看状态，用show status语句可以看到当前状态，以决定改调整哪些参数


如果你的机器内存超过4G，那么毋庸置疑应当采用64位操作系统和64位mysql 

读写分离
	如果数据库压力很大，一台机器支撑不了，那么可以用mysql复制实现多台机器同步，将数据库的压力分散。 


###合理的硬件资源和操作系统   


Master
　　Slave1
　　Slave2
　　Slave3
	主库master用来写入，slave1—slave3都用来做select，每个数据库
分担的压力小了很多。
　 要实现这种方式，需要程序特别设计，写都操作master，读都操作
slave，给程序开发带来了额外负担。当然目前已经有中间件来实现这个
代理，对程 序来读写哪些数据库是透明的。官方有个mysql-proxy，但是
还是alpha版本的。新浪有个amobe for mysql，也可达到这个目的，结构
如下　


###合理的硬件资源和操作系统   













