#PHP的 mysqli    

API

	应用程序接口 Application Programming Interface，定义了类，方法，函数，变量等等一切你的应用程序中为了完成特定任务而需要调用的内容。

驱动：

	设计用来执行某种服务的软件代码，这些软件代码库实现用于和mysql数据库服务交互的底层协议

扩展

	类似于API,扩展一个典型的作用就是暴露一个API给PHP程序员,术语API和扩展描述的不是同一类事物，因为扩展可能并不需要暴露一个API接口给程序员。 

PHP中提供的mysql的API:

	1、PHP的Mysql扩展
	2、PHP的mysqli扩展
	3、PHP数据库对象(PDO)

	mysqli的持久化链接
	mysqli类的属性和方法

#MySQLi类

###属性 
面向对象接口               描述

- $mysqli->affected_rows    获取前一个Mysql操作的受影响行数 

		echo $mysqli->affected_rows;

- $mysqli->client_info      返回字符串类型的Mysql客户端版本信息 
- $mysqli->client_version   返回整型的Mysql客户端版本信息 
- $mysqli->connect_errno    返回最后一次连接调用的错误代码 
- $mysqli->connect_error    返回一个字符串描述的最后一次连接调用的错误 
- $mysqli->errno            返回最近的*函数调用*产生的错误代码 
- $mysqli->error            返回字符串描述的最近一次**函数调用**产生的错误代码 
- $mysqli->field_count      返回最近一次查询获取到的列的数目
- $mysqli->host_info        返回一个能够代表使用的连接类型的字符串 

		$mysqli=new mysqli("localhost","root","","blog");
		echo $mysqli->host_info;// localhost via TCP/IP

- $mysqli->protocol_version   返回使用的Mysql协议的版本信息

		$mysqli=new mysqli("localhost","root","","blog");
		echo $mysqli->protocol_version;//10

- $mysqli->server_info    返回Mysql服务端版本的信息 

		echo $mysqli->server_info;// 5.6.17

- $mysqli->server_version  返回整型的Mysql服务端版本信息 

		echo $mysqli->server_version;// 50617

- $mysqli->info             最近一次执行的查询的检索信息 
- $mysqli->insert_id        返回最后一次查询自动生成并使用的id 

		如果上一次执行sql语句没有产生 AUTO_INCREMENT 的值，则 mysql_insert_id() 返回 0

- $mysqli->sqlstate         返回前一个Mysql操作的SQLSTATE错误 
- $mysqli->warning_count    返回给定链接最后一次查询的警告数量

		$mysqli=new mysqli();
		@$mysqli->connect("localhost","root","ss");
		if($mysqli->connect_errno){
		    die("链接错误".$mysqli->connect_error);
		}
		$mysqli->set_charset("utf8");
		$mysqli->select_db("gyshop");
		$sql="select goods_id,goods_name,cat_id from goods;";
		$result=$mysqli->query($sql);
		echo $mysqli->affected_rows."<br/>";
		echo $mysqli->field_count."<br/>";
		echo $mysqli->client_version."<br/>";
		echo $mysqli->client_info."<br/>";
		echo $mysqli->connect_errno."<br/>";
		echo $mysqli->connect_error."<br/>";
		echo $mysqli->errno."<br/>";
		echo $mysqli->error."<br/>";
		echo $mysqli->host_info."<br/>";
		echo $mysqli->protocol_version."<br/>";
		echo $mysqli->server_info."<br/>";
		echo $mysqli->server_version."<br/>";
		echo $mysqli->info."<br/>";
		echo $mysqli->insert_id."<br/>";
		echo $mysqli->sqlstate."<br/>";
		echo $mysqli->warning_count."<br/>";


		$result->close();
		$mysqli->close();

###////////////////////////(方法)///////////////////////////  
- mysqli->autocommit()    打开或关闭数据库的自动提交功能 
- mysqli->change_user()     更改指定数据库连接的用户 
- mysqli->character_set_name()    返回数据库当前连接使用的字符集 

		echo $mysqli->character_set_name() ;// latin1

- $mysqli->set_charset("utf8");
		
		echo $mysqli->character_set_name();//utf8

- mysqli->close()         关闭先前打开的数据库连接 
- mysqli->commit()        提交当前事务 
- mysqli::__construct()   打开一个到Mysql服务端的新的连接［注意：静态方法］ 
- mysqli->debug()         将调试信息转储到日志中 
- mysqli->get_charset()      返回对象的字符集 

		var_dump($mysqli->get_charset());
		输出： 
		object(stdClass)[3]
		  public 'charset' => string 'utf8' (length=4)
		  public 'collation' => string 'utf8_general_ci' (length=15)
		  public 'dir' => string '' (length=0)
		  public 'min_length' => int 1
		  public 'max_length' => int 3
		  public 'number' => int 33
		  public 'state' => int 1
		  public 'comment' => string 'UTF-8 Unicode' (length=13)

- mysqli->get_connection_stats()  返回客户端连接的统计信息。 仅可用于 mysqlnd。

		var_dump($mysqli->get_connection_stats());
		array (size=160)
		  'bytes_sent' => string '191' (length=3)
		  'bytes_received' => string '1196' (length=4)
		  'packets_sent' => string '10' (length=2)
		  'packets_received' => string '42' (length=2)
		  'protocol_overhead_in' => string '168' (length=3)
		  'protocol_overhead_out' => string '40' (length=2)
		  'bytes_received_ok_packet' => string '0' (length=1)
		  'bytes_received_eof_packet' => string '0' (length=1)
  ...


- mysqli->get_client_info()   返回字符串描述的Mysql客户端版本
- mysqli->get_client_stats()  返回每个客户端进程的统计信息。 仅可用于 mysqlnd。 
- mysqli->get_cache_stats()    返回客户端的zval缓存统计信息。 仅可用于 mysqlnd。 
- mysqli->get_server_info()     初始化mysqli并且返回一个由mysqli_real_connect使用的资源类型。［不是在对象上，是它返回的$mysqli对象］ 
- mysqli->kill()    请求服务器杀死一个Mysql线程 
- mysqli->more_results()    检查一个多语句查询是否还有其他查询结果集 

		var_dump($mysqli->more_results());

- mysqli->multi_query()    在数据库上执行一个多语句查询 
- mysqli->next_result()    从multi_query中准备下一个结果集 
- mysqli->options()     设置选项 
- mysqli->ping()    ping一个服务器连接，或者如果那个连接断了尝试重连 
- mysqli->prepare()    准备一个用于执行的SQL语句 
- mysqli->query()    在数据库上执行一个查询 
- mysqli->real_connect()     打开一个到Mysql服务端的连接 
- mysqli->real_escape_string()  转义字符串中用于SQL语句中的特殊字符，这个转换会考虑连接的当前字符集。 
- mysqli->real_query()    执行一个SQL查询 
- mysqli->rollback()     回滚当前事务 
- mysqli->select_db()    为数据库查询选择默认数据库 

- $mysqli->select_db("blog");

		mysqli->set_charset()    设置默认的客户端字符集 

- $mysqli->set_charset("utf8");

- mysqli->set_local_infile_default()    清除用户为load data local infile命令定义的处理程序 
- mysqli->set_local_infile_handler()   设置LOAD DATA LOCAL INFILE命令执行的回调函数 
- mysqli->ssl_set()    使用SSL建立安装连接 
- mysqli->stat()    获取当前系统状态 

		var_dump($mysqli->stat());
		输出： 
		string 'Uptime: 87621  Threads: 2  Questions: 248  Slow queries: 0  Opens: 83  Flush tables: 1  Open tables: 72  Queries per second avg: 0.002' (length=134)

- mysqli->stmt_init()   初始化一个语句并且返回一个mysqli_stmt_prepare使用的对象 
- mysqli->store_result()     传输最后一个查询的结果集 
- mysqli->thread_id    返回当前连接的线程ID ，不是方法

		var_dump($mysqli->thread_id);
		输出： 
		int 50

- mysqli->thread_safe()     返回是否设定了线程安全 
- mysqli->use_result()     初始化一个结果集的取回 

#MySQL_STMT

面向对象接口    描述
//////////////////////(属性)  ////////////////////////////////////////
$mysqli_stmt->affected_rows   返回最后一条倍执行的语句改变，删除或插入的总行数 
$mysqli_stmt->errno   返回最近一次语句调用的错误代码 
$mysqli_stmt->error   返回最后一条语句错误的字符串描述 
$mysqli_stmt->field_count   返回给定语句得到的字段数量 
$mysqli_stmt->insert_id   获取前一个INSERT操作生成的ID 
$mysqli_stmt->num_rows   返回语句结果集中的行数 
$mysqli_stmt->param_count     返回给定语句中参数数量 
$mysqli_stmt->sqlstate    返回前一个语句操作的SQLSTATE错误代码

//////////////////////////(方法)  ////////////////////////
mysqli_stmt->attr_get()    用于获取语句属性的当前值 
mysqli_stmt->attr_set()     用于修改prepared语句的行为 
mysqli_stmt->bind_param()      将一个变量作为参数绑定到prepared语句上 
mysqli_stmt->bind_result()   将一个变量绑定到一个prepared语句上用于结果存储 
mysqli_stmt->close()     关闭一个prepared语句 
mysqli_stmt->data_seek()      查看语句结果集中的任意行 
mysqli_stmt->execute()       执行一个prepared查询 
mysqli_stmt->fetch()       从一个prepared语句中抓取结果到限定变量中 
mysqli_stmt->free_result()     释放给定语句处理存储的结果集所占内存 
$mysqli_stmt->get_result()   没有文档 仅可用于 mysqlnd。 
mysqli_stmt->get_warnings()     没有文档 
$mysqli_stmt->more_results()   没有文档 仅可用于 mysqlnd。 
$mysqli_stmt->next_result()   没有文档 仅可用于 mysqlnd。 
mysqli_stmt->num_rows()    查阅属性$mysqli_stmt->num_rows  
mysqli_stmt->prepare()    准备一个SQL语句用于执行 
mysqli_stmt->reset()     重置一个prepared语句 
mysqli_stmt->result_metadata()    从一个prepared语句返回结果集元数据 
mysqli_stmt->send_long_data()    发送数据块 
mysqli_stmt->store_result()    从一个prepared语句中传输一个结果集 


###MySQLi_RESULT类

面向对象接口------------------描述

///////////////////////(属性)  ///////////////////////////////
- $mysqli_result->current_field   获取结果集当前字段指针的开始位置

		$result=$mysqli->query($sql);
		var_dump($result->current_field);
		输出： 
		int 0

- $mysqli_result->field_count   获取结果中字段数量 

		$result=$mysqli->query($sql);
		var_dump($result->field_count);
		输出：3 
		
		$result=$mysqli->query($sql);
		var_dump($mysqli->field_count);
		输出： 3

- $mysqli_result->lengths   返回结果集中当前行的列长度 
- $mysqli_result->num_rows   获取结果中行的数量

		$result=$mysqli->query($sql);
		var_dump($result->num_rows);
		输出： int 31
		
		var_dump($mysqli->affected_rows);
		输出： int 31

####方法
 
- mysqli_result->data_seek()    将结果中的结果指针调整到任意行 

		$result=$mysqli->query($sql);
		$result->data_seek(10);

- mysqli_result->fetch_all()    抓取所有的结果行并且以关联数据，数值索引数组，或者两者皆有的方式返回结果集。仅可用于 mysqlnd。

		语法：mixed  mysqli_result::fetch_all  ([ int $resulttype  = MYSQLI_NUM  ] )
		第一个参数可能值：MYSQLI_ASSOC , MYSQLI_NUM , or MYSQLI_BOTH 
		$result=$mysqli->query($sql);
		$result->data_seek(10);//结果集指针偏移10
		print_r($result->fetch_all());//默认以索引数组取出
		
		print_r($result->fetch_all(MYSQL_ASSOC));//以关联数组取出
		
		print_r(array_column($content,"goods_name"));//返回键名goods的所有列
		```
		mysqli_result->fetch_array()  以一个关联数组，数值索引数组，或者两者皆有的方式抓取当前结果集指针所在行结果 
		```
		语法：mixed  mysqli_result::fetch_array  ([ int $resulttype  = MYSQLI_BOTH  ] )
		参数可能值：MYSQLI_ASSOC , MYSQLI_NUM , or MYSQLI_BOTH .
		
		$result->data_seek(10);
		print_r($result->fetch_array(MYSQL_ASSOC));
		输出： 
		Array
		(
		    [goods_id] => 12
		    [goods_name] => 摩托罗拉A810
		    [cat_id] => 3
		)
		```
		mysqli_result->fetch_assoc()   以一个关联数组方式抓取结果集当前指针所在行结果 
		```
		该函数不接受任何参数
		
		print_r($result->fetch_assoc());
		输出： 
		Array
		(
		    [goods_id] => 12
		    [goods_name] => 摩托罗拉A810
		    [cat_id] => 3
		)

- mysqli_result->fetch_field_direct()   抓取一个单字段的元数据 

		语法：object mysqli_result::fetch_field_direct  ( int $fieldnr  )
		参数：$fieldnr，字段的number， 从0开始，最大为列数减1，就是将查询字段标号为0-n 
		
		$sql="select goods_id,goods_name,cat_id from goods;";
		$result=$mysqli->query($sql);
		$result->data_seek(10);
		print_r($result->fetch_field_direct(1));
		输出： 
		stdClass Object
		(
		    [name] => goods_name
		    [orgname] => goods_name   //原始名，在使用as别名时与name不同
		    [table] => goods
		    [orgtable] => goods
		    [def] =>      //列默认值
		    [db] => gyshop
		    [catalog] => def 
		    [max_length] => 38
		    [length] => 360
		    [charsetnr] => 33    //此列字符集代码
		    [flags] => 1
		    [type] => 253
		    [decimals] => 0     //列中使用的decimal个数
		)

- mysqli_result->fetch_field()   返回结果集中当前字段信息 

		该函数不接受任何参数，与上面的函数返回结果类似，只是上一个函数指定输出那个字段
		$result=$mysqli->query($sql);
		print_r($result->fetch_field());
		输出： 
		stdClass Object
		(
		    [name] => goods_id
		    [orgname] => goods_id
		    [table] => goods
		    [orgtable] => goods
		    [def] => 
		    [db] => gyshop
		    [catalog] => def
		    [max_length] => 2
		    [length] => 8
		    [charsetnr] => 63
		    [flags] => 49699
		    [type] => 9
		    [decimals] => 0
		)

- mysqli_result->fetch_fields()    返回一个代表结果集字段的对象数组 

		该函数不接受任何参数,返回所有字段的信息 
		$result=$mysqli->query($sql);
		print_r($result->fetch_fields());

- mysqli_result->fetch_object()    以一个对象的方式返回一个结果集中的当前结果集指针所在行 

		语法：object mysqli_result::fetch_object  ([ string $class_name  [, array $params  ]] )
		stdClass Object
		(
		    [goods_id] => 1
		    [goods_name] => KD876
		    [cat_id] => 4
		)

- mysqli_result->fetch_row()    以一个枚举数组方式返回当前指针所在行结果 

		该函数不接受任何参数 
		
		$result=$mysqli->query($sql);
		$result->data_seek(10);
		print_r($result->fetch_row());
		输出：
		Array
		(
		    [0] => 12
		    [1] => 摩托罗拉A810
		    [2] => 3
		)

- mysqli_result->field_seek()   设置结果指针到特定的字段开始位置 

		语法：bool mysqli_result::field_seek  ( int $fieldnr  )
		该函数是用来配合取字段信息的
		
		$result=$mysqli->query($sql);
		$result->field_seek(1);
		print_r($result->fetch_field());
		输出： 
		stdClass Object
		(
		    [name] => goods_name
		    [orgname] => goods_name
		    [table] => goods
		    [orgtable] => goods
		    [def] => 
		    [db] => gyshop
		    [catalog] => def
		    [max_length] => 38
		    [length] => 360
		    [charsetnr] => 33
		    [flags] => 1
		    [type] => 253
		    [decimals] => 0
		)

mysqli_result->free()     释放与一个结果集相关的内存

		void  mysqli_result::free  ( void )
		void  mysqli_result::close  ( void )
		void  mysqli_result::free_result  ( void )
		这三个参数是等价的，不接受任何参数



#MySQL_Driver类

面向对象接口     描述

///////////////////(属性)  //////////////////////////
N/A 
//////////////////////////(方法)///////////////////  
mysqli_driver->embedded_server_end()   
mysqli_driver->embedded_server_start()  
