PHP操作数据库要用到mysql扩展
mysql和PDO在5版本后推荐使用

基于面向对象的使用；支持预处理和事务；速度快

配置mysqli扩展：配置PHP配置文件，开启php_mysqli.dll扩展
配置extension_dir='ext目录所在位置'
重启服务器
验证mysqli是否已经开启：
1、phpinfo
2、右下角左键单击选择查看扩展
3、检测扩展是否已经加载
    extension_loaded('mysqli');返回布尔值
4、检测mysqli扩展中的函数是存在
    function_exists('mysqli_connect');返回布尔值
5、得到当前已经开启的扩展
    get_loaded_extensions();返回所有加载的扩展的数组

通过mysqli类库操作数据库的步骤：
1、建立到mysql的链接
2、打开指定的数据库
3、设置默认客户端的字符集（统一设置为urf-8）
4、执行sql语句
5、释放结果集
6、关闭链接


1、建立到mysql的链接
方法一：
    //建立到mysql数据库的链接
$mysqli=new mysqli('localhost','root','');
//打开指定的数据库
$mysqli->select_db('test');

方法二：
$mysqli=new mysqli();
$mysqli->connect('localhost','root','');
$mysqli->select_db('test');

方法三：建立链接的同时打开指定的数据库
$mysqli=new mysqli('localhost','root','','test');
这时可能出错
//通过mysqli->connect_erron和error分别得到错误编号和信息
if($mysqli->connect_errno){
    die('链接错误'.$mysqli->connect_error);
}else{
    echo '链接成功';
}

2、设置字符集
$mysqli->set_charset('utf-8');

3、执行命令查询
mysqli执行sql查询时返回值类型有两种：
1、select\desc\describe\show\explain执行成功返回的是mysqli_result
对象，执行失败返回false
对于其他语句的执行，成功返回true失败返回false
不包括预处理语句

关闭链接:
$mysqli->close();
如果没有得到结果集直接关闭链接


完整步骤：
$mysqli=@new mysqli('localhost','root','','test');
if($mysqli->connect_errno){
   die('链接失败'.$myqli->connect_error); 
}else{
    echo "链接成功";
}
$mysqli->set_charset('utf-8');
$sql=<<<eof
select * from shop;

eof;
$mysqli->query($sql);
$mysqli->close();

执行sql语句时的情况

$mysqli=new mysqli('localhost','root','','test');
if($mysqli->connect_errno){
    die('链接错误'.$mysqli->error);
}
$mysqli->set_charset('utf-8');
$sql="insert into user(username,password) values('king','king')";
$res=$mysqli->query($sql);//query只能执行一条sql语句
if($res){
    echo "执行成功";
    //得到上一插入操作产生的auto_increment的值
    echo "恭喜您注册成功,您是网站的第".$mysqli->insert_id."位用户";
    //得到有几条数据受影响
    echo "有".$mysqli->affected_rows."条记录受影响";
}else{
    echo "执行失败";
    //可以得到上一次操作产生的错误号和信息
    echo $mysqli->errno."|".$mysqli->error;
}

更新记录
//将表中的年龄加10
//update user set age=age+10;
//删除记录
// delect from user where uid=7

$mysqli->query("insert into user(username,password11) values('a','a')");
echo $mysqli->affected_rows;//当执行语句有问题时affected_rows返回-1

affected_rows的值有三种：
1、受影响的记录条数
2、-1，代表sql语句错误
3、0代表没有受影响记录条数

查询情况：

$sql="select uid,username,password from user";
$result=$mysqli->query($sql);//返回的是结果集对象，错误时返回false
if($result && $result->num_rows>0){
    echo $result->num_rows;
    // $rows=$result->fetch_all();//获取结果集中的所有记录，默认返回二维数组，为索引形式
    // $rows=$result->fetch_all(MYSQLI_NUM);//以索引方式返回,默认方式
    // $rows=$result->fetch_all(MYSQLI_ASSOC);//以关联方式返回
    // $rows=$result->fetch_all(MYSQLI_BOTH);//以两种方式返回
    // $rows=$result->fetch_row();//仅得到一条记录，返回的是一维索引数组
    $row=$result->fetch_assoc();//取得结果集中的一条记录返回关联数组，每一次指针向下移动一位
    $row=$result->fetch_array();//取得结果集中的一条记录返回索引和关联数组，每一次指针向下移动一位，通过设置参数可以得到相应的部分，如MYSQLI_ASSOC得到关联部分
    $result->data_seek(2);//移动结果集中到2位


    print_r($row);
}else{
    echo "查询错误";
}
//释放结果集
$result->close();
//或者
$result->free_result();
//或者
$result->free();

//关闭链接
$mysqli->close();


案例:实现用户列表

#预处理

<?php
header("content-type:text/html;charset=utf-8");
$mysqli=new mysqli('localhost','root','','test');
if($mysqli->connect_errno){
    die("CONNECT ERROR:".$mysqli->connect_error);
}
$mysqli->set_charset('utf-8');
//准备预处理语句
$sql="insert into user(username,password) values(?,?);";
$stmt=$mysqli->prepare($sql);
//print_r($stmt);
$username="wow";
$password="wow";
//绑定参数
//绑定数据，要添加类型：s表示字符串，i表示整型，d表示浮点型
$stmt->bind_param('ss',$username,$password);
//执行语句

if($stmt->execute()){//执行成功返回真，否则返回假
    echo $stmt->insert_id;

}else{
    echo $stmt->error();
}

#预处理可以预防sql注入











