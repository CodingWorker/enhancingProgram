//////////基础的php面试题-基础题部分 .php//////////////////
比较基础的php面试题及答案-基础题部分 
PHP 

基础题:
1.表单中 get与post提交方法的区别?
答:1、get是发送请求HTTP协议通过url参数传递进行接收,而post是实体数据,
   2、get仅能提交少量的数据受到url长度的限制（不同浏览器不同，一般IE4100~其他7000左右），而post可以通过表单提交大量信息.
   3、get可以加入书签，post不能加入书签
   参考：http://www.cnblogs.com/igeneral/p/3641574.html



2.session与cookie的区别?
答:session:储存用户访问的全局唯一变量,存储在服务器上的php指定的目录中的（session_dir）的位置进行的存放
cookie:用来存储连续訪問一个頁面时所使用，是存储在客户端，对于Cookie来说是存储在用户WIN的Temp目录中的。
两者都可通过时间来设置时间长短

我答：两个都可以用做会话处理，而且在某种程度上session依赖于cookie;
      1、cookie存储在客户端，session存储在服务器端；
      2、cookie存储的长度(4100个字节)及个数(每个域名50个)由限制，而session一般来讲没有大小限制；


3.数据库中的事务是什么?
答:事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，

事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。


简述题:
strtotime(’-1 days’));
time()-24*3600;


3、能够使HTML和PHP分离开使用的模板(1分)
答:Smarty
smarty是一个模版引擎，说白了就是PHP的一个集成类。主要的功能是用于将模板和程序分离，也就是我们经常听到和看到的mvc架构模式。而smarty就支持这种mvc架构模式，同时也支持模板的缓存功能。
其实就是分类数组的那套东西，用来显示

5、使用哪些工具进行版本控制?(1分)
答:cvs,svn,vss;

6、如何实现字符串翻转?(3分)
答:echo strrev($a);

7、优化MYSQL数据库的方法。(4分，多写多得)
答:
1、选取最适用的字段属性,尽可能减少定义字段长度,尽量把字段设置NOT NULL,例如’省份,性别’,最好设置为ENUM
2、使用连接（JOIN）来代替子查询:
a.删除没有任何订单客户:DELETE FROM customerinfo WHERE customerid NOT in(SELECT customerid FROM orderinfo)
b.提取所有没有订单客户:SELECT FROM customerinfo WHERE customerid NOT in(SELECT customerid FROM orderinfo)
c.提高b的速度优化:SELECT FROM customerinfo LEFT JOIN orderid customerinfo.customerid=orderinfo.customerid
WHERE orderinfo.customerid IS NULL
3、使用联合(UNION)来代替手动创建的临时表
a.创建临时表:SELECT name FROM `nametest` UNION SELECT username FROM `nametest2`
4、事务处理:
a.保证数据完整性,例如添加和修改同时,两者成立则都执行,一者失败都失败
mysql_query(”BEGIN”);
mysql_query(”INSERT INTO customerinfo (name) VALUES (’$name1′)”;
mysql_query(”SELECT * FROM `orderinfo` where customerid=”.$id”);
mysql_query(”COMMIT”);
5、锁定表,优化事务处理:
a.我们用一个 SELECT 语句取出初始数据，通过一些计算，用 UPDATE 语句将新值更新到表中。
包含有 WRITE 关键字的 LOCK TABLE 语句可以保证在 UNLOCK TABLES 命令被执行之前，
不会有其它的访问来对 inventory 进行插入、更新或者删除的操作
mysql_query(”LOCK TABLE customerinfo READ, orderinfo WRITE”);
mysql_query(”SELECT customerid FROM `customerinfo` where id=”.$id);
mysql_query(”UPDATE `orderinfo` SET ordertitle=’$title’ where customerid=”.$id);
mysql_query(”UNLOCK TABLES”);
6、使用外键,优化锁定表
a.把customerinfo里的customerid映射到orderinfo里的customerid,
任何一条没有合法的customerid的记录不会写到orderinfo里
CREATE TABLE customerinfo
(
customerid INT NOT NULL,
PRIMARY KEY(customerid)
)TYPE = INNODB;
CREATE TABLE orderinfo
(
orderid INT NOT NULL,
customerid INT NOT NULL,
PRIMARY KEY(customerid,orderid),
FOREIGN KEY (customerid) REFERENCES customerinfo
(customerid) ON DELETE CASCADE
)TYPE = INNODB;
注意:’ON DELETE CASCADE’,该参数保证当customerinfo表中的一条记录删除的话同时也会删除order
表中的该用户的所有记录,注意使用外键要定义事务安全类型为INNODB;
7、建立索引:
a.格式:
(普通索引)->
创建:CREATE INDEX <索引名> ON tablename (索引字段)
修改:ALTER TABLE tablename ADD INDEX [索引名] (索引字段)
创表指定索引:CREATE TABLE tablename([...],INDEX[索引名](索引字段))
(唯一索引)->
创建:CREATE UNIQUE <索引名> ON tablename (索引字段)
修改:ALTER TABLE tablename ADD UNIQUE [索引名] (索引字段)
创表指定索引:CREATE TABLE tablename([...],UNIQUE[索引名](索引字段))
(主键)->
它是唯一索引,一般在创建表是建立,格式为:
CREATA TABLE tablename ([...],PRIMARY KEY[索引字段])
8、优化查询语句
a.最好在相同字段进行比较操作,在建立好的索引字段上尽量减少函数操作
例子1:
SELECT * FROM order WHERE YEAR(orderDate)<2008;(慢)
SELECT * FROM order WHERE orderDate<”2008-01-01″;(快)
例子2:
SELECT * FROM order WHERE addtime/7<24;(慢)
SELECT * FROM order WHERE addtime<24*7;(快)
例子3:
SELECT * FROM order WHERE title like “%good%”;
SELECT * FROM order WHERE title>=”good” and name<”good”;



9、MYSQL取得当前时间的函数是?，格式化日期的函数是(2分)
答:now(),date()


10、实现中文字串截取无乱码的方法。(3分)
答:function GBsubstr($string, $start, $length) {
if(strlen($string)>$length){
$str=null;
$len=$start+$length;
for($i=$start;$i<$len;$i++){
if(ord(substr($string,$i,1))>0xa0){
$str.=substr($string,$i,2);
$i++;
}else{
$str.=substr($string,$i,1);
}
}
return $str.’…’;
}else{
return $string;
}
}

11、您是否用过版本控制软件? 如果有您用的版本控制软件的名字是?(1分)
github

12、您是否用过模板引擎? 如果有您用的模板引擎的名字是?(1分)
答:也可以说用过吧，我之前用过框架写项目，分配数据的原理与smarty相似，也可能是框架中加载了smarty

13、请简单阐述您最得意的开发之作(4分)
答:博客实现

14、对于大流量的网站,您采用什么样的方法来解决访问量问题?(4分)
答:1、确认服务器硬件是否足够支持当前的流量
   2、数据库读写分离
   3、优化数据表,
   4、程序功能规则,
   5、禁止外部的盗链,
   6、控制大文件的下载,
   7、使用不同主机分流主要流量


16、语句include和require的区别是什么?为避免多次包含同一文件，可用(?)语句代替它们? (2分)
答:require->require是无条件包含也就是如果一个流程里加入require,无论条件成立与否都会先执行require
include->include有返回值，而require没有(可能因为如此require的速度比include快)
注意:包含文件不存在或者语法错误的时候require是致命的,include不是

include_once require_once


17、如何修改SESSION的生存时间(1分).
答:方法1:将php.ini中的session.gc_maxlifetime设置为9999重启apache
方法2:$savePath = “./session_save_dir/”;
$lifeTime = 小时 * 秒;
session_save_path($savePath);
session_set_cookie_params($lifeTime);
session_start();
方法3:setcookie() and session_set_cookie_params($lifeTime);


18、有一个网页地址, 比如PHP开发资源网主页: http://www.phpres.com/index.html,如何得到它的内容?($1分)
答:方法1(对于PHP5及更高版本):
$readcontents = fopen(”http://www.phpres.com/index.html”, “rb”);
$contents = stream_get_contents($readcontents);
fclose($readcontents);
echo $contents;
方法2:
echo file_get_contents(”http://www.phpres.com/index.html”);


19、在HTTP 1.0中，状态码401的含义是(?);如果返回“找不到文件”的提示，则可用 header 函数，其语句为(?);(2分)
答:状态401代表未被授权,header(”Location:www.xxx.php”);




14、谈谈对mvc的认识(1分)
答:由模型(model),视图(view),控制器(controller)完成的应用程序
由模型发出要实现的功能到控制器,控制器接收组织功能传递给视图;

我答的：三层分离机制，m-module代表模型层
       v-view代表视图层
       c-controller代表控制器层

       控制器层链接m和v，将数据分配给视图，控制视图的显示
       这样的设计使得三个方面分离不受干扰，有利于提高效率


15、写出发贴数最多的十个人名字的SQL，利用下表：members(id,username,posts,pass,email)(2分)
答:SELECT username,posts FROM members ORDER BY posts DESC limit 0,10;


16. 请说明php中传值与传引用的区别。什么时候传值什么时候传引用?(2分)
答:按值传递：函数范围内对值的任何改变在函数外部都会被忽略
按引用传递：函数范围内对值的任何改变在函数外部也能反映出这些修改
优缺点：按值传递时，php必须复制值。特别是对于大型的字符串和对象来说，这将会是一个代价很大的操作。
按引用传递则不需要复制值，对于性能提高很有好处。


17. 在PHP中error_reporting这个函数有什么作用? (1分)
答:设置错误级别与错误信息回报


18. 请写一个函数验证电子邮件的格式是否正确 (2分)
答:function checkEmail($email)
{
$pregEmail = “/([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?/i”;
return preg_match($pregEmail,$email);
}

19. 简述如何得到当前执行脚本路径，包括所得到参数。(2分)
答:$script_name = basename(__file__); print_r($script_name);


22、JS的转向函数是?怎么引入一个外部JS文件?(2分)
答:window.location.href,<script type=”text/javascript” src=”js/js_function.js”></script>







27、mysql_fetch_row() 和mysql_fetch_array之间有什么区别? (1分)
答:mysql_fetch_row是从结果集取出1行数组,作为枚举
mysql_fetch_array是从结果集取出一行数组作为关联数组,或数字数组,两者兼得

28、GD库是做什么用的? (1分)
答:gd库提供了一系列用来处理图片的API，使用GD库可以处理图片，或者生成图片。
在网站上GD库通常用来生成缩略图或者用来对图片加水印或者对网站数据生成报表。





33、使用php写一段简单查询，查出所有姓名为“张三”的内容并打印出来 (2分)
表名User
Name Tel Content Date
张三 13333663366 大专毕业 2006-10-11
张三 13612312331 本科毕业 2006-10-15
张四 021-55665566 中专毕业 2006-10-15
请根据上面的题目完成代码：
$mysql_db=mysql_connect(”local”,”root”,”pass”);
@mysql_select_db(”DB”,$mysql_db);
$result = mysql_query(”SELECT * FROM `user` WHERE name=’张三’”);
while($rs = mysql_fetch_array($result)){
echo $rs["tel"].$rs["content"].$rs["date"];
}









40、取得查询结果集总数的函数是?(1分)
答:mysql_num_rows($result);






47、完成以下:
(一)创建新闻发布系统，表名为message有如下字段 (3分)
id 文章id
title 文章标题
content 文章内容
category_id 文章分类id
hits 点击量
答:CREATE TABLE ‘message’(
‘id’ int(10) NOT NULL auto_increment,
‘title’ varchar(200) default NULL,
‘content’ text,
‘category_id’ int(10) NOT NULL,
‘hits’ int(20),
PRIMARY KEY(’id’);
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

(二)同样上述新闻发布系统：表comment记录用户回复内容，字段如下 (4分)
comment_id 回复id
id 文章id，关联message表中的id
comment_content 回复内容
现通过查询数据库需要得到以下格式的文章标题列表,并按照回复数量排序，回复最高的排在最前面
文章id 文章标题 点击量 回复数量
用一个SQL语句完成上述查询，如果文章没有回复则回复数量显示为0
答:SELECT message.id id,message.title title,IF(message.`hits` IS NULL,0,message.`hits`) hits,
IF(comment.`id` is NULL,0,count(*)) number FROM message LEFT JOIN
comment ON message.id=comment.id GROUP BY message.`id`;

(三)上述内容管理系统，表category保存分类信息，字段如下 (3分)
category_id int(4) not null auto_increment;
categroy_name varchar(40) not null;
用户输入文章时，通过选择下拉菜单选定文章分类
写出如何实现这个下拉菜单
答:function categoryList()
{
$result=mysql_query(”select category_id,categroy_name from category”)
or die(”Invalid query: ” . mysql_error());
print(”<select name=’category’ value=”>\n”);
while($rowArray=mysql_fetch_array($result))
{
print(”<option value=’”.$rowArray['category_id'].”‘>”.$rowArray['categroy_name'].”</option>\n”);
}
print(”</select>”);
}

//////////////基础的php面试题-填空题部分 .php//////////////////
比较基础的php面试题及答案-填空题部分 
PHP 

填空题:
1.在PHP中，当前脚本的名称(不包括路径和查询字符串)记录在预定义变量__$_SERVER['PHP_SELF']__或者__FILE__中;而链接到当前页面的URL记录在预定义变量__$_SERVER['HTTP_REFERER']__
中



3.在HTTP 1.0中，状态码 401 的含义是____;如果返回“找不到文件”的提示404，则可用 header 函数，其语句为____。



6.写出一个正则表达式，过虑网页上的所有JS/VBS脚本(即把scrīpt标记及其内容都去掉):preg_replace(”/<script[^>].*?>.*?</script>/si”, “newinfo”, $script);

<?php
"/<script[^>]*?.*?<\/script>/si"
?>



7.以Apache模块的方式安装PHP，在文件http.conf中首先要用语句____动态装载PHP模块，然后再用语句____使得Apache把所有扩展名为php的文件都作为PHP脚本处理。
LoadModule php5_module “c:/php/php5apache2.dll” , AddType application/x-httpd-php .php,




10.一个函数的参数不能是对变量的引用，除非在php.ini中把__allow_call_time_pass_reference boolean__设为on.

11.SQL中LEFT JOIN的含义是__自然左外链接__。如果 tbl_user记录了学生的姓名(name)和学号(ID)，tbl_score记录了学生(有的学生考试以后被开除了，没有其记录)的学号(ID)和考试成绩(score)以及考试科目(subject)，要想打印出各个学生姓名及对应的的各科总成绩，则可以用SQL语句____。

select tbl_user.name,sum_score.sumscore from tbl_user left join (select tble_score.id,sum(tbl_score) as sumscore from tbl_score group by tbl_score.id) as sum_score on tbl_user.id=sum_score.id;




编程题:
13.写一个函数，能够遍历一个文件夹下的所有文件和子文件夹。
答:
function my_scandir($dir)
{
$files = array();
if ( $handle = opendir($dir) ) {
while ( ($file = readdir($handle)) !== false ) {
if ( $file != “..” && $file != “.” ) {
if ( is_dir($dir . “/” . $file) ) {
$files[$file] = scandir($dir . “/” . $file);
}else {
$files[] = $file;
}
}
}
closedir($handle);
return $files;
}
}

14.简述论坛中无限分类的实现原理。
答:
<?php
/*
数据表结构如下:
CREATE TABLE `category` (
`categoryID` smallint(5) unsigned NOT NULL auto_increment,
`categoryParentID` smallint(5) unsigned NOT NULL default ‘0′,
`categoryName` varchar(50) NOT NULL default ”,
PRIMARY KEY (`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

INSERT INTO `category` ( `categoryParentID`, `categoryName`) VALUES
(0, ‘一级类别’),
(1, ‘二级类别’),
(1, ‘二级类别’),
(1, ‘二级类别’),
(2, ‘三级类别’),
(2, ‘333332′),
(2, ‘234234′),
(3, ‘aqqqqqd’),
(4, ‘哈哈’),
(5, ‘66333666′);

*/

//指定分类id变量$category_id,然后返回该分类的所有子类
//$default_category为默认的选中的分类
function Get_Category($category_id = 0,$level = 0, $default_category = 0)
{
global $DB;
$sql = “SELECT * FROM category ORDER BY categoryID DESC”;
$result = $DB->query( $sql );
while ($rows = $DB->fetch_array($result))
{
$category_array[$rows[categoryParentID]][$rows[categoryID]] = array(’id’ => $rows[categoryID], ‘parent’ => $rows[categoryParentID], ‘name’ => $rows

[categoryName]);
}
if (!isset($category_array[$category_id]))
{
return “”;
}
foreach($category_array[$category_id] AS $key => $category)
{
if ($category['id'] == $default_category)
{
echo “<option selected value=”.$category['id'].”";
}else
{
echo “<option value=”.$category['id'].”";
}

if ($level > 0)
{
echo “>” . str_repeat( ” “, $level ) . ” ” . $category['name'] . “</option>\n”;
}
else
{
echo “>” . $category['name'] . “</option>\n”;
}
Get_Category($key, $level + 1, $default_category);
}
unset($category_array[$category_id]);
}

/*
函数返回的数组格式如下所示:
Array
(
[1] => Array ( [id] => 1 [name] => 一级类别 [level] => 0 [ParentID] => 0 )
[4] => Array ( [id] => 4 [name] => 二级类别 [level] => 1 [ParentID] => 1 )
[9] => Array ( [id] => 9 [name] => 哈哈 [level] => 2 [ParentID] => 4 )
[3] => Array ( [id] => 3 [name] => 二级类别 [level] => 1 [ParentID] => 1 )
[8] => Array ( [id] => 8 [name] => aqqqqqd [level] => 2 [ParentID] => 3 )
[2] => Array ( [id] => 2 [name] => 二级类别 [level] => 1 [ParentID] => 1 )
[7] => Array ( [id] => 7 [name] => 234234 [level] => 2 [ParentID] => 2 )
[6] => Array ( [id] => 6 [name] => 333332 [level] => 2 [ParentID] => 2 )
[5] => Array ( [id] => 5 [name] => 三级类别 [level] => 2 [ParentID] => 2 )
[10] => Array ( [id] => 10 [name] => 66333666 [level] => 3 [ParentID] => 5 )
)
*/
//指定分类id,然后返回数组
function Category_array($category_id = 0,$level=0)
{
global $DB;
$sql = “SELECT * FROM category ORDER BY categoryID DESC”;
$result = $DB->query($sql);
while ($rows = $DB->fetch_array($result))
{
$category_array[$rows['categoryParentID']][$rows['categoryID']] = $rows;
}

foreach ($category_array AS $key=>$val)
{
if ($key == $category_id)
{
foreach ($val AS $k=> $v)
{
$options[$k] =
array(
‘id’ => $v['categoryID'], ‘name’ => $v['categoryName'], ‘level’ => $level, ‘ParentID’=>$v['categoryParentID']
);

$children = Category_array($k, $level+1);

if (count($children) > 0)
{
$options = $options + $children;
}
}
}
}
unset($category_array[$category_id]);
return $options;
}

?>
~~`
<?php

class cate
{

function Get_Category($category_id = 0,$level = 0, $default_category = 0)
{
echo $category_id;
$arr = array(
‘0′ => array(
‘1′ => array(’id’ => 1, ‘parent’ => 0, ‘name’ => ‘1111′),
‘2′ => array(’id’ => 2, ‘parent’ => 0, ‘name’ => ‘2222′),
‘4′ => array(’id’ => 4, ‘parent’ => 0, ‘name’ => ‘4444′)
),
‘1′ => array(
‘3′ => array(’id’ => 3, ‘parent’ => 1, ‘name’ => ‘333333′),
‘5′ => array(’id’ => 5, ‘parent’ => 1, ‘name’ => ‘555555′)
),

‘3′ => array(
‘6′ => array(’id’ => 6, ‘parent’ => 3, ‘name’ => ‘66666′),
‘7′ => array(’id’ => 7, ‘parent’ => 3, ‘name’ => ‘77777′)
),
‘4′ => array(
‘8′ => array(’id’ => 8, ‘parent’ => 4, ‘name’ => ‘8888′),
‘9′ => array(’id’ => 9, ‘parent’ => 4, ‘name’ => ‘9999′)
)
);

if (!isset($arr[$category_id]))
{
return “”;
}

foreach($arr[$category_id] AS $key => $cate)
{
if ($cate['id'] == $default_category)
{
$txt = “<option selected value=”.$cate['id'].”";
}else{
$txt = “<option value=”.$cate['id'].”";
}

if ($level > 0)
{
$txt1 = “>” . str_repeat( “-”, $level ) . ” ” . $cate['name'] . “</option>\n”;
}else{
$txt1 = “>” . $cate['name'] . “</option>\n”;
}
$val = $txt.$txt1;
echo $val;
self::Get_Category($key, $level + 1, $default_category);
}

}

function getFlush($category_id = 0,$level = 0, $default_category = 0)
{

ob_start();

self::Get_Category($category_id ,$level, $default_category);

$out = ob_get_contents();

ob_end_clean();
return $out;
}
}
$id =$_GET['id'];
echo “<select>”;
$c = new cate();
//$c->Get_Category();
$ttt=  $c->getFlush($id,’0′,’3′);
echo $ttt;
echo “</select>”;
?>`~~


////////////基础的php面试题-编程题部分 .php//////////////////
比较基础的php面试题及答案-编程题部分 
PHP面试题专栏 

编程题:
1. 写一个函数，尽可能高效的，从一个标准 url 里取出文件的扩展名
例如: http://www.sina.com.cn/abc/de/fg.php?id=1 需要取出 php 或 .php
答案1:
function getExt($url){
$arr = parse_url($url);

$file = basename($arr['path']);
$ext = explode(”.”,$file);
return $ext[1];
}
答案2:
function getExt($url) {
$url = basename($url);
$pos1 = strpos($url,”.”);
$pos2 = strpos($url,”?”);
if(strstr($url,”?”)){
return substr($url,$pos1 + 1,$pos2 – $pos1 – 1);
} else {
return substr($url,$pos1);
}
}

2. 在 HTML 语言中，页面头部的 meta 标记可以用来输出文件的编码格式，以下是一个标准的 meta 语句
请使用 PHP 语言写一个函数，把一个标准 HTML 页面中的类似 meta 标记中的 charset 部分值改为 big5
请注意:
1. 需要处理完整的 html 页面，即不光此 meta 语句
2. 忽略大小写
3. ‘ 和 ” 在此处是可以互换的
4. ‘Content-Type’ 两侧的引号是可以忽略的，但 ‘text/html; charset=gbk’ 两侧的不行
5. 注意处理多余空格

3. 写一个函数，算出两个文件的相对路径
如 $a = ‘/a/b/c/d/e.php’;
$b = ‘/a/b/12/34/c.php’;
计算出 $b 相对于 $a 的相对路径应该是 ../../c/d将()添上
答:function getRelativePath($a, $b) {
$returnPath = array(dirname($b));
$arrA = explode(’/', $a);
$arrB = explode(’/', $returnPath[0]);
for ($n = 1, $len = count($arrB); $n < $len; $n++) {
if ($arrA[$n] != $arrB[$n]) {
break;
}
}
if ($len – $n > 0) {
$returnPath = array_merge($returnPath, array_fill(1, $len – $n, ‘..’));
}

$returnPath = array_merge($returnPath, array_slice($arrA, $n));
return implode(’/', $returnPath);
}
echo getRelativePath($a, $b);


///////////////新建 文本文档.php////////////////////////
1、COOKIE、SESSION的联系和区别，多台web服务器如何共享 SESSION？

    使用session_start()调用session,服务器端在生成session文件的同时,生成session ID哈希值和默认值为PHPSESSID的session name,并向客户端发送变量为(默认的是)PHPSESSID(session name),值为一个128位的哈希值.服务器端将通过该cookie与客户端进行交互.
    session变量的值经php内部系列化后保存在服务器机器上的文本文件中,和客户端的变量名默认情况下为PHPSESSID的coolie进行对应交互.
      即服务器自动发送了http头:header('Set-Cookie: session_name()=session_id(); path=/');
即setcookie(session_name(),session_id());
    当从该页跳转到的新页面并调用session_start()后,PHP将检查与给定ID相关联的服务器端存贮的session数据,如果没找到,则新建一个数据集.

   2、HTTP协议中的POST和GET有何区别？

　　 其中请求方法是请求一定的Web页面的程序或用于特定的URL。可选用下列几种：
　　GET： 请求指定的页面信息，并返回实体主体。
　　HEAD： 只请求页面的首部。
　　POST： 请求服务器接受所指定的文档作为对所标识的URI的新的从属实体。
　　PUT： 从客户端向服务器传送的数据取代指定的文档的内容。
　　DELETE： 请求服务器删除指定的页面。

   3、一段php代码，写出输出结果，

/**** 这个程序****/
$a=0;
$b=0;
if(($a=3)>0 || ($b=3)>0){

$a++;
$b++;

echo $a ;
echo $b; //输出b的值
}

答案：4 1

/**** 这个程序****/
$a=0;
$b=0;
if(($a=3)>0 | ($b=3)>0){

$a++;
$b++;

echo $a ;
echo $b; //输出b的值
}

答案：4 4

   4、reqiure的include都可包含文件，二者的区别何在？

     5、php中WEB上传文件的原理是什么，如何限制上传文件的大小？

1，上传文件的表单使用post方式（和get的区别不用说了）；还要加上enctype='multipart/form-data'。
      2，一般要加上隐藏域：<input type=hidden name='MAX_FILE_SIZE' value=dddddd>，位置在file域前面。value的值是上传文件的客户端字节限制。据说可以减少文件超标时客户端的等待时间，不过我没觉得有什么区别。
      3，出于安全考虑，file域是不许赋值的。随便在file域输入字符串，然后按submit也不会有反应。必须是第二个字符是冒号的时候（比如空格跟随冒号可以上传一个长度为0字节的“文件”），submit才同意“服务”――不过这个是客户端的措施，跟MAX_FILE_SIZE一样很容易绕过去。

     限制上传文件大小的因素有
      1，客户端的隐藏域MAX_FILE_SIZE的数值（可以被绕开）。
      2，服务器端的upload_max_filesize，post_max_size和memory_limit。这几项不能够用脚本来设置。
      3，自定义文件大小限制逻辑。即使服务器的限制是能自己决定，也会有需要个别考虑的情况。所以这个限制方式经常是必要的。
      4，$_FILE['fn']['size']

is_uploaded_file()    ,    move_uploaded_file()

   6、写一个函数，可以遍历文件夹下的所有文件和文件夹。

function myscandir($path)
{
    $files = array();
    if($handle = opendir($path)){
        while(($f = readdir($handle)) !== false){
            $p = $path .'/'. $f;
            if($f == '..' || $f == '.') continue;
            if(is_file($p)){
                $files[] = $f;
            }elseif(is_dir($p)){
                $files[$f] = myscandir($p);
            }
        }
        closedir($handle);
    }
    return $files;   
}

//$f = myscandir('./misc/doo');
//print_r($f);

    7、8、中间有几个unix shell的题目（好像是两个），因为不懂，不记得这些题目了

   9、有mail.log的一个文档，内容为若干邮件地址，其中用'\n'将邮件地址分隔。要求从中挑选出sina.com的邮件地址（包括从文件读取、过滤到列印出来）。

mail.log内容如下：

james@sina.com.cn

jack@163.com

zhansan@sohu.com

lisi@hotmail.com

wangwu@gmail.com

答案：

cat mail.log | grep sina.com

或者：

#!/bin/bash
while read row ;
do
        case $row in
                *sina.com*) echo $row ;;
        esac
done < mail.log

10、js中网页前进和后退的代码

<input type=button value=前进 onclick=history.go(1)>   
<input type=button value=前进 onclick=history.forward()>       
<input type=button value=后退 onclick=history.go(-1)>   
<input type=button value=后退 onclick=history.back()>  

11、window（A）中用window.open（）打开了window（B），如何从窗口B调用窗口A中的内容？A、B仅仅是窗口的代号，不是窗口名字

window.opener.document.getElementById()

12、了解ajax吗？用过吗？……

var xmlhttp = new XMLHttpRequest();
var xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
xmlhttp.open('get',url,true);
xmlhttp.onreadystatechang=function(){
    if(xmlhttp.readyState ==4){
        if(xmlhttp.status==200){alert(xmlhttp.responseText);xmlhttp=null;}
    }
}
xmlhttp.send(null);



Ajax.open("POST",url,true);
//如果是POST方式提交数据，下两行必不可少
Ajax.setrequestheader("content-length",sendData.length);
Ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
Ajax.send(sendData);// 要POST的数据

13、什么是MVC？用过吗？使用时遇到了什么问题，怎么解决的？

14.写出 访问 http://www.sina.com.cn 所需的报文头，嘿嘿，这是超级猪自己想起来地。
答案：可以用get_heards(http://www.sina.com.cn)查看




http://hi.baidu.com/linchaoqi/blog/item/6c148efdfef97d1f08244d1c.html
这是这套面试的网址

http://kcjun.5d6d.com/thread-367-1-1.html
另外一套面试题网址

//////////////附加.php/////////////////
附加:
1.php如何跳转
方法一：php函数跳转,缺点，header头之前不能有输出，跳转后的程序继续执行，可用exit中断执行后面的程序。
Header("Location: 网址");     //直接跳转
header("refresh:3;url=http://axgle.za.net");    //三秒后跳转

方法二：利用meta 
echo "<meta http-equiv=refresh content='0; url=网址'>"; 


2.设置cookies  
bool setcookie ( string name [, string value [, int expire [, string path [, string domain [, bool secure]]]]] )
参数说明: Cookie 的名字，Cookie的值，过期时间，Cookie 在服务器端的有效路径，该 cookie 有效的域名，指明 cookie 是否仅通过安全的 HTTPS 连接传送。当设成 TRUE 时，cookie 仅在安全的连接中被设置。默认值为 FALSE
$value = 'something from somewhere';
setcookie("TestCookie", $value);
setcookie("TestCookie", $value,time()+3600);  /*有效期为一小时 */
setcookie("TestCookie", $value,time()+3600, "/~rasmus/", ".utoronto.ca", 1); 

3.smarty的原理
smarty是个模板引擎，最显著的地方就是有可以把模板缓存起来。 

一般模板来说，都是做一个静态页面，然后在里面把一些动态的部分用一切分隔符切开，然后在PHP里打开这个模板文件，把分隔符里面的值替换掉，然后输出来，你可以看下PHPLib里面的template部分。 
而smarty设定了缓存参数以后，第一运行时候会把模板打开，在php替换里面值的时候把读取的html和php部分重新生成一个临时的php文件，这样就省去了每次打开都重新读取html了。如果修改了模板，只要重新刷下就行了。 

4.php遍历文件夹函数
function loaddir($dirname){
if($handle=opendir($dirname)){
   while(false!==($files=readdir($handle))){
    if($files!="."&&$files!=".."){
     if(is_file($dirname.'/'.$files)){
      echo $dirname.'/'.$files.'<br>';
     }
     if(is_dir($dirname."/".$files)){
      loaddir($dirname."/".$files);
     }
    }
   }
}
} 

////10条PHP编程习惯助你找工作 .php///////////////////////
<?
10条PHP编程习惯助你找工作 


2、字符串的输出

以下哪一条语句的运行速度最快？

print “Hi my name is $a. I am $b”$$
echo “Hi my name is $a. I am $b”$$
echo “Hi my name is “.$a.”. I am “.$b;
echo “Hi my name is “,$a,”. I am “,$b;
echo ‘Hi my name is ‘,$a,’. I am ‘,$b;

最后一条的运行速度是最快的。 print比echo要慢，在字符串中进行变量替换时会慢，而连接字符串要比用逗号连接来得慢，最后一句则是第一个习惯的体现。所以，不在字符串中进行变 量替换不仅会加快程序运行速度，也会让你的代码在任何语法高亮显示的编辑器中显得更为易懂（变量会被高亮显示出来）。很少人知道echo的参数可以用逗号 连接，且速度会比字符串连接要来得快。最后再用上第一个习惯，那这条语句就非常好了。







5、尽量不要使用正则表达式

在进行 常规的字符串操作时，尽可能不要去使用正则表达式（preg和ereg系列函数）。str_replace函数要比preg_replace快得多，甚至 strtr函数也要比str_replace来得快。省去这些不必要的麻烦吧，你的老板会感谢你的。

6、不要在循环声明中使用函数

这个问题不单单出现在PHP中，你可以在其他语言的代码中经常看到：

差：for($i=0;$i< count($array);$i++){…}

好：$count=count($array);for($i=0;$i& lt;$count;$i++){…}

如果在循环声明中使用了 count函数，那每次循环都会调用一次。如果循环次数很多，会浪费非常多的时间。


8、一定要对变量进行初始化（这 里的“初始化”指的是“声明”）

当需要没有初始化的变量，PHP解释器会自动创建一个变量，但依靠这个特性来编程并不是一 个好主意。这会造成程序的粗糙，或者使代码变得另人迷惑，因为你需要探寻这个变量是从哪里开始被创建的。另外，对一个没有初始化的变量进行递增操作要比初 始化过的来得慢。所以对变量进行初始化会是个不错的主意。

9、对代码进行注释



我知道有些自称为PHP大师的人声称自己的代码写得很好，不需要添加什么注 释。在我看来，这些人都是垃圾。学一写注释的规范和技巧，熟悉一下phpDocumentor或Doxygen之类的注释辅助软件，都是值得的。

10、 遵循一个编程规范

关于这一点，是你需要在面试中询问你潜在的老板的，问问他们正在使用什么编程规范。PEAR？Zend？内部规范？ 要提及你正在使用的编程规范，不管是你自己创建的，还是目前普遍流行的一种。对于PHP这种松松垮垮的语言来说，如果没有一个好的编程规范，那么那些代码 就会看起来想一堆垃圾。发臭的，令人作呕的垃圾。一些基本的规范包括空格规范、打括号匹配、命名风格等。这对任何一个追求高质量的代码的人来说都是必须 的。

有人说：“我讨厌你的4个空格的缩进。”我要说，什么？用4个空格来缩进？这比用制表符过占用3个字符的空间。更重要的是，只要 是使用比记事本高级的编辑器，你可以自定义制表符的缩进值。所以每个程序员都可以以其最习惯的方式来看代码。可以时设置为4，也可以设置为0（如果你是个 受虐狂）。反正我不在乎，但你就是不能用空格来缩进！


///////PHP新手面试题总100分.php/////////////////
PHP新手面试题总100分
简述题(50分)
1、用PHP打印出前一天的时间格式是2006-5-10 22:21:21(2分)
echo date('Y-m-d H:i:s', strtotime('-1 day'));
2、echo(),print(),print_r()的区别(3分)
echo是PHP语句, print和print_r是函数,语句没有返回值,函数可以有返回值(即便没有用)  
print只能打印出简单类型变量的值(如int,string)  
print_r可以打印出复杂类型变量的值(如数组,对象)  
echo -- 输出一个或者多个字符串  
3、能够使HTML和PHP分离开使用的模板(1分)
smarty，Heyes Template Class等
5、使用哪些工具进行版本控制？(1分)
VS Server on Apache作服务端,WinCVS作客户端;Subversion on Apache/DAV 做服务端,TortoiseSVN做客户端,或者Subclipse做客户端.
6、如何实现字符串翻转？(3分)
strrev()
---------------------------------------------------------------
7、优化MYSQL数据库的方法。(4分，多写多得)
(1).选取最适用的字段属性,应该尽量把字段设置为NOT NULL，这样在将来执行查询的时候，数据库不用去比较NULL值。
(2).使用连接（JOIN）来代替子查询(Sub-Queries)
(3).使用联合(UNION)来代替手动创建的临时表
(4).尽量少使用 LIKE 关键字和通配符
(5).使用事务和外键
8、PHP的意思(送1分)
Hypertext Preprocessor
9、MYSQL取得当前时间的函数是?，格式化日期的函数是(2分)
now(), DATE_FORMAT(date,format)
10、实现中文字串截取无乱码的方法。(3分)
mb_substr()
---------------------------------------------------------------
11、您是否用过版本控制软件? 如果有您用的版本控制软件的名字是?(1分)
TortoiseSVN-1.2.6 svn-1.2.3
12、您是否用过模板引擎? 如果有您用的模板引擎的名字是?(1分)
smarty
13、请简单阐述您最得意的开发之作(4分)
14、对于大流量的网站,您采用什么样的方法来解决访问量问题?(4分)
首先，确认服务器硬件是否足够支持当前的流量
其次，优化数据库访问。
第三，禁止外部的盗链。
第四，控制大文件的下载。
第五，使用不同主机分流主要流量
第六，使用流量分析统计软件。
-----------------------------------------------------------------
15、用PHP写出显示客户端IP与服务器IP的代码1分)
function get_client_ip() {#
 if(getenv('HTTP_CLIENT_IP')) {
  $client_ip = getenv('HTTP_CLIENT_IP');
 } elseif(getenv('HTTP_X_FORWARDED_FOR')) {
  $client_ip = getenv('HTTP_X_FORWARDED_FOR');
 } elseif(getenv('REMOTE_ADDR')) {
  $client_ip = getenv('REMOTE_ADDR');
 } else {
  $client_ip = $HTTP_SERVER_VAR['REMOTE_ADDR'];
 }
 return $client_ip;
}
16、语句include和require的区别是什么?为避免多次包含同一文件，可用(?)语句代替它们? (2分)
require()和include()除了怎样处理失败之外在各方面都完全一样。include()产生一个警告而require()则导致一个致命错误。
换句话说，如果你想在丢失文件时停止处理页面,用require()。include()  就不是这样，脚本会继续运行。
require()无论如何都会包含文件,而include()可以有选择地包含.
代替用
include_once
require_once
17、如何修改SESSION的生存时间(1分).
$savePath = "./session_save_dir/";
$lifeTime = 24 * 3600;
session_save_path($savePath);
session_set_cookie_params($lifeTime);
session_start();
18、有一个网页地址, 比如PHP开发资源网主页: http://www.phpres.com/index.html,如何得到它的内容?($1分)
file_get_contents($url)
19、在HTTP 1.0中，状态码401的含义是(?)；如果返回“找不到文件”的提示，则可用 header 函数，其语句为(?);(2分)
未授权（Unauthorized)
Header("http/1.0 403 Forbidden");
12、在PHP中，heredoc是一种特殊的字符串，它的结束标志必须?(1分)
跟起始的一样，且结束标志前也要一个换行，后面加上分号
13、谈谈asp,php,jsp的优缺点(1分)
14、谈谈对mvc的认识(1分)
-------------------------------------------------------------------
15、写出发贴数最多的十个人名字的SQL，利用下表：members(id,username,posts,pass,email)(2分)
  select members.username
    from members
order by posts DESC
   limit 10
16. 请说明php中传值与传引用的区别。什么时候传值什么时候传引用？(2分)
按值传递：函数范围内对值的任何改变在函数外部都会被忽略
按引用传递：函数范围内对值的任何改变在函数外部也能反映出这些修改
优缺点：按值传递时，php必须复制值。特别是对于大型的字符串和对象来说，这将会是一个代价很大的操作。
按引用传递则不需要复制值，对于性能提高很有好处。
17. 在PHP中error_reporting这个函数有什么作用？ (1分)
用来配置错误信息回报的等级
18. 请写一个函数验证电子邮件的格式是否正确 (2分)
//if the email address is valid, return true,else return false
function validateEmail($email)
{
    if(eregi('^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*$',$email) ){
        return true;
    }else{
        return false;
    }
}
19. 简述如何得到当前执行脚本路径，包括所得到参数。(2分)
echo $_SERVER['scrīpt_FILENAME']."?".$_SERVER['QUERY_STRING'];
20.如何修改SESSION的生存时间. (1分)
setcookie()
或
session_set_cookie_params($lifeTime)
--------------------------------------------------------------------
21、JS表单弹出对话框函数是?获得输入焦点函数是? (2分)
alert(),prompt(),confirm()
focus()
22、JS的转向函数是?怎么引入一个外部JS文件?(2分)
window.location.href
<scrīpt src=""/>
23、foo()和@foo()之间有什么区别？(1分)
24、如何声明一个名为”myclass”的没有方法和属性的类？ (1分)
class myclass{};
25、如何实例化一个名为”myclass”的对象？(1分)
$newmyclass = new myclass();
26、你如何访问和设置一个类的属性？ (2分)
通过-〉
$newmyclass = new myclass();
$temp=$newmyclass->testvalue;
$newmyclass->testvalue="a";
27、mysql_fetch_row() 和mysql_fetch_array之间有什么区别？ (1分)
mysql_fetch_row -- 从结果集中取得一行作为枚举数组
mysql_fetch_array --  从结果集中取得一行作为关联数组，或数字数组，或二者兼有

--------------------------------------------------------------------
28、GD库是做什么用的？ (1分)
GD库提供了一系列用来处理图片的API，使用GD库可以处理图片，或者生成图片。
在网站上GD库通常用来生成缩略图或者用来对图片加水印或者对网站数据生成报表。
29、指出一些在PHP输入一段HTML代码的办法。(1分)
print("<table></table>");
30、下面哪个函数可以打开一个文件，以对文件进行读和写操作？(1分)(c)
    (a) fget()  (b) file_open()   (c) fopen()   (d) open_file()
31、下面哪个选项没有将 john 添加到users 数组中？ (1分) (b)(d)
    (a) $users[] = ‘john’;
    (b) array_add($users,’john’);
    (c) array_push($users,‘john’);
    (d) $users ||= ‘john’;
32、下面的程序会输入是否?(1分)
    <?php
      $num = 10;
      function multiply(){
        $num = $num * 10;
      }
      multiply();
      echo $num;
    ?>
否，局部变量
33、使用php写一段简单查询，查出所有姓名为“张三”的内容并打印出来 (2分)
表名User
Name Tel Content Date
张三 13333663366 大专毕业 2006-10-11
张三 13612312331 本科毕业 2006-10-15
张四 021-55665566 中专毕业 2006-10-15

请根据上面的题目完成代码：
$mysql_db=mysql_connect("local","root","pass");
@mysql_select_db("DB",$mysql_db);
$result=mysql_query("select * from User where Name='张三'");
while($row=mysql_fetch_array($result))
{
    echo $row['Name'].$row['Tel'].$row['Content'].$row['Date'];
    echo "<br>";
}
34、如何使用下面的类,并解释下面什么意思?(3)

class test{
   function Get_test($num){
      $num=md5(md5($num)."En");
      return $num;
   }
}
双重md5加密
$testObject = new test();
$encryption = $testObject->Get_test("xiaotian_ls");
----------------------------------------------------------------------------
35、写出 SQL语句的格式 : 插入 ，更新 ，删除 (4分)
   表名User
   Name Tel Content  Date
   张三 13333663366  大专毕业 2006-10-11
   张三 13612312331  本科毕业 2006-10-15
   张四 021-55665566 中专毕业 2006-10-15
  (a) 有一新记录(小王 13254748547 高中毕业 2007-05-06)请用SQL语句新增至表中
   INSERT INTO User('Name','Tel','Content','Date') VALUES('小王','13254748547','高中毕业','2007-05-06')
  (b) 请用sql语句把张三的时间更新成为当前系统时间
   UPDATE User SET Date=DATE_FORMAT(NOW(),'%Y-%m-%d') WHERE Name='张三'
  (c) 请写出删除名为张四的全部记录
   DELETE FROM User WHERE Name='张四'
36、请写出数据类型(int char varchar datetime text)的意思; 请问varchar和char有什么区别(2分)
int 数值类型 char 固定长度字符串 varchar 可变长字符串 datetime 日期时间型 text 字符字符串
char列的长度固定为创建表时声明的长度.varchar列中的值为可变长字符串.
37、MySQ自增类型(通常为表ID字段)必需将其设为(?)字段(1分)
AUTO_INCREMENT
38、写出以下程序的输出结果 (1分)
   <?
    $b=201;
    $c=40;
    $a=$b>$c?4:5;
    echo $a;
   ?>
    4
39、检测一个变量是否有设置的函数是否?是否为空的函数是?(2分)
isset() empty()
-----------------------------------------------------------------------------
40、取得查询结果集总数的函数是?(1分)
count()
41、$arr = array('james', 'tom', 'symfony'); 请打印出第一个元素的值 (1分)
echo $arr[0];
42、请将41题的数组的值用','号分隔并合并成字串输出(1分)
echo $arr[0].$arr[1].$arr[2]
43、$a = 'abcdef'; 请取出$a的值并打印出第一个字母(1分)
echo $a{0};
44、PHP可以和sql server/oracle等数据库连接吗?(1分)
可以
45、请写出PHP5权限控制修饰符(3分)
private protected public
46、请写出php5的构造函数和析构函数(2分)
__construct __destruct
------------------------------------------------------------------------------

47、以下请用PHPMYADMIN完成

(一)创建新闻发布系统，表名为message有如下字段 (3分)

id 文章id
title 文章标题
content 文章内容
category_id 文章分类id
hits 点击量

CREATE TABLE 'message'(
    'id' int(11) NOT NULL auto_increment,
    'title' varchar(200) default NULL,
    'content' blob,
    'category_id' int(11) default NULL,
    'hits' int(11) default NULL,
    PRIMARY KEY('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8
(二)同样上述新闻发布系统：表comment记录用户回复内容，字段如下 (4分)

comment_id 回复id
id 文章id，关联message表中的id
comment_content 回复内容
现通过查询数据库需要得到以下格式的文章标题列表,并按照回复数量排序，回复最高的排在最前面
文章id 文章标题 点击量 回复数量
用一个SQL语句完成上述查询，如果文章没有回复则回复数量显示为0

SELECT message.id id,message.title title,IF(message.`hits` IS NULL,0,message.`hits`) hits,IF(comment.`id` is NULL,0,count(*)) number
FROM message LEFT JOIN comment ON message.id=comment.id
GROUP BY message.`id`
(三)上述内容管理系统，表category保存分类信息，字段如下 (3分)

category_id int(4) not null auto_increment;
categroy_name varchar(40) not null;
用户输入文章时，通过选择下拉菜单选定文章分类
写出如何实现这个下拉菜单
function categoryList()
{
    $result=mysql_query("select category_id,categroy_name from category")
            or die("Invalid query: " . mysql_error());
    print("<select name='category' value=''>\n");
    while($rowArray=mysql_fetch_array($result))
    {
        print("<option value='".$rowArray['category_id']."'>".$rowArray['categroy_name']."</option>\n");
    }
    print("</select>");
}



附加:
1.php如何跳转
方法一：php函数跳转,缺点，header头之前不能有输出，跳转后的程序继续执行，可用exit中断执行后面的程序。
Header("Location: 网址");     //直接跳转
header("refresh:3;url=http://axgle.za.net");    //三秒后跳转

方法二：利用meta 
echo "<meta http-equiv=refresh content='0; url=网址'>"; 


2.设置cookies  
bool setcookie ( string name [, string value [, int expire [, string path [, string domain [, bool secure]]]]] )
参数说明: Cookie 的名字，Cookie的值，过期时间，Cookie 在服务器端的有效路径，该 cookie 有效的域名，指明 cookie 是否仅通过安全的 HTTPS 连接传送。当设成 TRUE 时，cookie 仅在安全的连接中被设置。默认值为 FALSE
$value = 'something from somewhere';
setcookie("TestCookie", $value);
setcookie("TestCookie", $value,time()+3600);  /*有效期为一小时 */
setcookie("TestCookie", $value,time()+3600, "/~rasmus/", ".utoronto.ca", 1); 

3.smarty的原理
smarty是个模板引擎，最显著的地方就是有可以把模板缓存起来。 

一般模板来说，都是做一个静态页面，然后在里面把一些动态的部分用一切分隔符切开，然后在PHP里打开这个模板文件，把分隔符里面的值替换掉，然后输出来，你可以看下PHPLib里面的template部分。 
而smarty设定了缓存参数以后，第一运行时候会把模板打开，在php替换里面值的时候把读取的html和php部分重新生成一个临时的php文件，这样就省去了每次打开都重新读取html了。如果修改了模板，只要重新刷下就行了。 

4.php遍历文件夹函数
function loaddir($dirname){
if($handle=opendir($dirname)){
   while(false!==($files=readdir($handle))){
    if($files!="."&&$files!=".."){
     if(is_file($dirname.'/'.$files)){
      echo $dirname.'/'.$files.'<br>';
     }
     if(is_dir($dirname."/".$files)){
      loaddir($dirname."/".$files);
     }
    }
   }
}
} 


////////////php程序员上机题.php//////////////////
<?
某大公司的PHP面试题
1. 如何用php的环境变量得到一个网页地址的内容？ip地址又要怎样得到？
[php]
echo $_SERVER ['PHP_SELF'];
echo $_SERVER ['SERVER_ADDR'];
[/php]


2. 求两个日期的差数，例如2007-2-5 ~ 2007-3-6 的日期差数
[php]
$begin=strtotime('2007-2-5');
$end=strtotime('2007-3-6');
echo ($end-$begin)/(24*3600);
[/php]


3. 请写一个函数，实现以下功能：
字符串“open_door” 转换成 “OpenDoor”、”make_by_id” 转换成 ”MakeById”。
[php]
function changeStyle(& $str) {

/*$str = str_replace ( "_", " ", $str );
$str = ucwords ( $str );
$str = str_replace ( " ", "", $str );
return $str;*/

$arrStr=explode('_',$str);
foreach($arrStr as $key=>$value){
  $arrStr[$key]=strtoupper(substr($value,0,1)).substr($value,1);
}
return implode('',$arrStr);
}
$s = "open_door";
echo changeStyle ( $s );
[/php]

4. 要求写一段程序，实现以下数组$arr1转换成数组$arr2：
[php]$arr1 = array (
'0' => array ('fid' => 1, 'tid' => 1, 'name' =>'Name1' ),
'1' => array ('fid' => 1, 'tid' => 2 , 'name' =>'Name2' ),
'2' => array ('fid' => 1, 'tid' => 5 , 'name' =>'Name3' ),
'3' => array ('fid' => 1, 'tid' => 7 , 'name' =>'Name4' ),
'4' => array ('fid' => 3, 'tid' => 9, 'name' =>'Name5' ) 
);
$arr2 = array ( 
'0' => array ( 
'0' => array ( 'tid' => 1, 'name' => 'Name1'),
'1' => array ( 'tid' => 2, 'name' => 'Name2'),
'2' => array ( 'tid' => 5, 'name' => 'Name3'),
'3' => array ( 'tid' => 7, 'name' => 'Name4')
),
'1' => array ( 
'0' => array ( 'tid' => 9, 'name' => 'Name5' ) 
)
);
<?php
$arr1 = array (
'0' => array ('fid' => 1, 'tid' => 1, 'name' =>'Name1' ),
'1' => array ('fid' => 1, 'tid' => 2 , 'name' =>'Name2' ),
'2' => array ('fid' => 1, 'tid' => 5 , 'name' =>'Name3' ),
'3' => array ('fid' => 1, 'tid' => 7 , 'name' =>'Name4' ),
'4' => array ('fid' => 3, 'tid' => 9, 'name' =>'Name5' ) 
);
function changeArrayStyle($arr){
foreach($arr as $key=>$value){
  $result[$value['fid']][]=$value;
}
return array_values($result);
}
$arr2=changeArrayStyle($arr1);
echo "<pre>";
var_dump($arr2);
[/php]

5. 请简述数据库设计的范式及应用。
一般第3范式就足以，用于表结构的优化，这样做既可以避免应用程序过于复杂同时也避免了SQL语句过于庞大所造成系统效率低下。
ANSWER：
第一范式：若关系模式R的每一个属性是不可再分解的，再属于第一范式。
第二范式：若R属于第一范式，且所有的非码属性都完全函数依赖于码属性，则为第二范式。
第三范式：若R属于第二范式，且所有的非码属性没有一个是传递函数依赖于候选码，则属于第三范式。
6.一个表中的Id有多个记录，把所有这个id的记录查出来，并显示共有多少条记录数，用SQL语句及视图、存储过程分别实现。
存储过程：
[php]
DELIMITER //
create procedure proc_countNum(in columnId int,out rowsNo int)
begin
  select count(*) into rowsNo from member where member_id=columnId;    
end
call proc_countNum(1,@no);
select @no;

[/php]
视图：
create view v_countNum as select member_id,count(*) as countNum from member group by member_id
select countNum from v_countNum where member_id=1
7 表中有A B C三列,用SQL语句实现：当A列大于B列时选择A列否则选择B列，当B列大于C列时选择B列否则选择C列。
[php]select
case
when first_name>middle_name then
case when first_name>last_name then first_name
else last_name end
else
case when middle_name>last_name then middle_name else last_name
end
end as name
from member
[/php]
8请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?
ANSWER: sql优化有鸟用，不如直接加索引。
9 如果模板是用smarty模板。怎样用section语句来显示一个名为$data的数组。比如：
[php]$data = array(
[0] => array( [id]=8 [name]=’name1′)
[1] => array( [id]=10 [name]=’name2′)
[2] => array( [id]=15 [name]=’name3′)
……
)[/php]
写出在模板页的代码？ 若用foreach语句又要怎样显示呢？
占无答案.
10 写一个函数，能够遍历一个文件夹下的所有文件和子文件夹。（目录操作）
[php] <?php
$d = dir(dirname(__file__));
//echo "Handle: " . $d->handle . "\n";
//echo "Path: " . $d->path . "\n";
while ( false !== ($entry = $d->read ()) ) {
echo $entry . "<br />";
}
$d->close ();
[/php]

11 两张表 city表和province表。分别为城市与省份的关系表。
city:
id City Provinceid
1 广州 1
2 深圳 1
3 惠州 1
4 长沙 2
5 武汉 3
………. 广州
province:
id Province
1 广东
2 湖南
3 湖北
……….
（1） 写一条sql语句关系两个表，实现：显示城市的基本信息。？
（2） 显示字段：城市id ，城市名， 所属省份 。
如：
Id（城市id） Cityname(城市名) Privence(所属省份)
。。。。。。。。。
。。。。。。。。。
（2）如果要统计每个省份有多少个城市，请用group by 查询出来。？
显示字段：省份id ，省份名，包含多少个城市。
ANSWER:
1.select A.id,A.Cityname,B.Province from city A,province B where A.provinceid=B.id
2.select B.id,B.Province,count(*) as num from city A,province B where A.provinceid=B.id group by B.id
12. 按照你的经验请简述软件工程进行软件开发的步骤。以下工具Rational Rose、PowerDesigner、Project、VSS或CVS、TestDirector使用过那种,有缺点是什么？
公司用dbdesigner及cvs,测试管理工具用的是Mantis
13. 请简述操作系统的线程与进程的区别。列举LINUX下面你使用过的软件？
14. 请使用伪语言结合数据结构冒泡排序法对以下一组数据进行排序 10 2 36 14 10 25 23 85 99 45。
[php]function bubble_sort(& $arr){
$number=count($arr);
for($i=0;$i<$number-1;$i++){
  for($j=0;$j<$number-1-$i;$j++){
   if($arr[$j]>$arr[$j+1]){
    $tmp=$arr[$j];
    $arr[$j]=$arr[$j+1];
    $arr[$j+1]=$tmp;
   }
  }
} 
}
$str="10 2 36 14 10 25 23 85 99 45";
$arr=explode(" ",$str);
bubble_sort($arr);
echo "<pre>";
var_dump($arr);
[/php] 

//////PHP程序员测试题及答案.php////////////////////


PHP程序员测试题及答案


1.表单中 get与post提交方法的区别?
答:get是发送请求HTTP协议通过url参数传递进行接收,而post是实体数据,可以通过表单提交大量信息. 


2.session与cookie的区别?
答:session:储存用户访问的全局唯一变量,存储在服务器上的php指定的目录中的（session_dir）的位置进行的存放
cookie:用来存储连续訪問一个頁面时所使用，是存储在客户端，对于Cookie来说是存储在用户WIN的Temp目录中的。 
两者都可通过时间来设置时间长短


3.数据库中的事务是什么?
答:事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，


事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。


简述题:
1、用PHP打印出前一天的时间格式是2006-5-10 22:21:21(2分)
答:echo date('Y-m-d H:i:s', strtotime('-1 days')); 


2、echo(),print(),print_r()的区别(3分)
答:echo是PHP语句, print和print_r是函数,语句没有返回值,函数可以有返回值(即便没有用) 
print（） 只能打印出简单类型变量的值(如int,string)
print_r（）可以打印出复杂类型变量的值(如数组,对象) 
echo 输出一个或者多个字符串

3、能够使HTML和PHP分离开使用的模板(1分)
答:Smarty,Dwoo,TinyButStrong,Template Lite,Savant,phemplate,XTemplate


4、使用哪些工具进行版本控制?(1分)
答:cvs,svn,vss;


5、如何实现字符串翻转?(3分)
答:echo strrev($a);


6、优化MYSQL数据库的方法。(4分，多写多得)
答:
   1、选取最适用的字段属性,尽可能减少定义字段长度,尽量把字段设置NOT NULL,例如'省份,性别',最好设置为ENUM
   2、使用连接（JOIN）来代替子查询:
      a.删除没有任何订单客户:DELETE FROM customerinfo WHERE customerid NOT in(SELECT customerid FROM orderinfo)
      b.提取所有没有订单客户:SELECT FROM customerinfo WHERE customerid NOT in(SELECT customerid FROM orderinfo)
      c.提高b的速度优化:SELECT FROM customerinfo LEFT JOIN orderid customerinfo.customerid=orderinfo.customerid
      WHERE orderinfo.customerid IS NULL
      3、使用联合(UNION)来代替手动创建的临时表
      a.创建临时表:SELECT name FROM `nametest` UNION SELECT username FROM `nametest2`
      4、事务处理:
      a.保证数据完整性,例如添加和修改同时,两者成立则都执行,一者失败都失败
                  mysql_query("BEGIN");
         mysql_query("INSERT INTO customerinfo (name) VALUES ('$name1')";
         mysql_query("SELECT * FROM `orderinfo` where customerid=".$id");
         mysql_query("COMMIT");
  5、锁定表,优化事务处理:
     a.我们用一个 SELECT 语句取出初始数据，通过一些计算，用 UPDATE 语句将新值更新到表中。
     包含有 WRITE 关键字的 LOCK TABLE 语句可以保证在 UNLOCK TABLES 命令被执行之前，
     不会有其它的访问来对 inventory 进行插入、更新或者删除的操作
          mysql_query("LOCK TABLE customerinfo READ, orderinfo WRITE");
          mysql_query("SELECT customerid FROM `customerinfo` where id=".$id);
          mysql_query("UPDATE `orderinfo` SET ordertitle='$title' where customerid=".$id);
          mysql_query("UNLOCK TABLES");
  6、使用外键,优化锁定表
     a.把customerinfo里的customerid映射到orderinfo里的customerid,
     任何一条没有合法的customerid的记录不会写到orderinfo里
           CREATE TABLE customerinfo
           (
               customerid INT NOT NULL,
                PRIMARY KEY(customerid) 
            )TYPE = INNODB;
           CREATE TABLE orderinfo
           (
               orderid INT NOT NULL,
               customerid INT NOT NULL,
               PRIMARY KEY(customerid,orderid),
               FOREIGN KEY (customerid) REFERENCES customerinfo
               (customerid) ON DELETE CASCADE 
           )TYPE = INNODB;
           注意:'ON DELETE CASCADE',该参数保证当customerinfo表中的一条记录删除的话同时也会删除order
           表中的该用户的所有记录,注意使用外键要定义事务安全类型为INNODB;
  7、建立索引:
      a.格式:
           (普通索引)->
           创建:CREATE INDEX <索引名> ON tablename (索引字段)
           修改:ALTER TABLE tablename ADD INDEX [索引名] (索引字段)
           创表指定索引:CREATE TABLE tablename([...],INDEX[索引名](索引字段)) 
           (唯一索引)->
           创建:CREATE UNIQUE <索引名> ON tablename (索引字段)
           修改:ALTER TABLE tablename ADD UNIQUE [索引名] (索引字段)
           创表指定索引:CREATE TABLE tablename([...],UNIQUE[索引名](索引字段)) 
           (主键)->
           它是唯一索引,一般在创建表是建立,格式为:
           CREATA TABLE tablename ([...],PRIMARY KEY[索引字段])
  8、优化查询语句
      a.最好在相同字段进行比较操作,在建立好的索引字段上尽量减少函数操作
       例子1:
           SELECT * FROM order WHERE YEAR(orderDate)<2008;(慢)
           SELECT * FROM order WHERE orderDate<"2008-01-01";(快)
       例子2:
           SELECT * FROM order WHERE addtime/7<24;(慢)
           SELECT * FROM order WHERE addtime<24*7;(快)
        例子3:
           SELECT * FROM order WHERE title like "%good%";
           SELECT * FROM order WHERE title>="good" and name<"good";


8、PHP的意思(送1分)
答:PHP是一个基于服务端来创建动态网站的脚本语言，您可以用PHP和HTML生成网站主页


9、MYSQL取得当前时间的函数是?，格式化日期的函数是(2分)
答:now(),date()


10、实现中文字串截取无乱码的方法。(3分)
答:function GBsubstr($string, $start, $length) {
if(strlen($string)>$length){
$str=null;
$len=$start+$length;
for($i=$start;$i<$len;$i++){
if(ord(substr($string,$i,1))>0xa0){
$str.=substr($string,$i,2);
$i++;
}else{
$str.=substr($string,$i,1);
}
}
return $str.'...';
}else{
return $string;
}
}


12、您是否用过模板引擎? 如果有您用的模板引擎的名字是?(1分)
答:用过,smarty

13、请简单阐述您最得意的开发之作(4分)
答:信息分类


14、对于大流量的网站,您采用什么样的方法来解决访问量问题?(4分)
答:确认服务器硬件是否足够支持当前的流量,数据库读写分离,优化数据表,
程序功能规则,禁止外部的盗链,控制大文件的下载,使用不同主机分流主要流量


15、用PHP写出显示客户端IP与服务器IP的代码1分)
答:打印客户端IP:echo $_SERVER[‘REMOTE_ADDR’]; 或者: getenv('REMOTE_ADDR');
打印服务器IP:echo gethostbyname("www.bolaiwu.com")


16、语句include和require的区别是什么?为避免多次包含同一文件，可用(?)语句代替它们? (2分)
答:require->require是无条件包含也就是如果一个流程里加入require,无论条件成立与否都会先执行require 
include->include有返回值，而require没有(可能因为如此require的速度比include快) 
注意:包含文件不存在或者语法错误的时候require是致命的,include不是


17、如何修改SESSION的生存时间(1分).
答:方法1:将php.ini中的session.gc_maxlifetime设置为9999重启apache
方法2:$savePath = "./session_save_dir/";
$lifeTime = 小时 * 秒;
session_save_path($savePath);
session_set_cookie_params($lifeTime);
session_start();
方法3:setcookie() and session_set_cookie_params($lifeTime);

////////////////php综合复习题大全.php///////////////////
1. 变量如何定义？

2. 如何检查变量是否定义？
    isset()

3. 如何删除一个变量？
    unset()

4. 判断一个变量是否为空的函数？
    empty()

5. 什么是可变变量？
获取一个普通变量的值作为这个可变变量的变量名。
6. php中变量有哪些基本数据类型？
    php支持8种原始数据类型。
    包括：
    四种标量类型（布尔型boolean，整型integer，浮点型float/double , 字符串string）
    两种复合类型(数组array ， 对象object)
    两种特殊类型（资源resource，NULL）


7. 其它类型转换为boolean类型时，哪些被认为是false？
    布尔值false，整型值0， 浮点型值0.0， 空白字符串， 字符串'0', 空数组，空对象， 特殊数据类型NULL, 没有设定的变量。

8. 标量数据和数组的最大区别是什么？
    一个标量只能存放一个数据，而数组可以存放多个数据。

9. 常量如何定义? 如何检测一个常量是否被定义？
    define() , defined()

10. 常量的值只能是哪些数据类型？
    常量的值只能是标量类型的数据。

11. 常量分为系统内置常量和自定义常量。请说出最常见的几个系统内置常量？
    __FILE__ , __LINE__ , PHP_OS , PHP_VERSION

12. 如果定义了两个相同的常量，前者和后者哪个起作用？
    前者起作用，因为常量一旦定义就不能被重新定义或者取消定义。

13. 常量和变量有哪些区别？
    1）常量前没有$符号；
    2）常量只能通过define()定义，而不能通过赋值语句定义；
    3）常量可以在任何地方定义和访问，而变量定义的访问有固定的规则；
    4）常量一旦定义就不能被重新定义或者取消定义，而变量而通过赋值方式重新定义；
    5）常量的值只能是标量数据，而变量的数据库类型有8中原始数据类型。


14. PHP中常用的几个预定义的全局数组变量是哪些？
    有9大预定义的内置数组变量：
    $_POST, $_GET, $_REQUEST, $_SESSION, $_COOKIE, $_FILES，$_SERVER, $_ENV, $GLOBALS

15. 在实际开发中，常量最常用于哪些地方？
    1）连接数据库的信息定义成常量，如数据库服务器的用户名、密码、数据库名、主机名；
    2）将站点的部分路径定义成常量，如web绝对路径，smarty的安装路径，model、view或者controller的文件夹路径；
    3）网站的公共信息，如网站名称，网站关键词等信息。

16. 函数的优越性有哪些？

17. 函数名起名有哪些规范？函数名区分大小写吗？
    1）函数名以字母或者下划线开头；
    2）函数名不区分大小写；
    3）函数名不可以使用已经声明过的或者系统自建的函数名称。

18. 什么是变量的能见度？
就是变量在程序中的可作用范围。根据变量的能见度，变量分为局部变量和全局变量。

19. 什么是局部变量和全局变量？函数内是否可以直接调用全局变量？
    局部变量是函数内部定义的变量，其作用域是所在的函数。如果函数外还有一个跟局部变量名字一样的变量，
    程序会认为它们两个是完全不同的两个变量。当退出函数的时候，其中的局部变量就同时被清除。

    全局变量是定义在所有函数以外的变量，其作用域是整个php文件，但是在用户自定义的函数内部是无法使用的。
    如果一定要在用户自定义的函数内部使用全局变量，那么就需要使用global关键字声明。
    也就是说如果在函数内的变量前加上golbal来修饰，那么函数内部就可以访问到这个全局变量，
    不仅可以利用这个全局变量进行运算而且可以对这个全局变量进行重新赋值。


20. global关键词如何使用？预定义的全局变量数组$GLOBALS如何使用？

21. 什么是静态变量？

22. php中函数传递参数的方式有哪些？两者有什么区别？
    按值传递和按地址传递（或按引用传递）

23. 什么是递归函数？如何进行递归调用？
    递归函数其实就是调用自身的函数，但是必须满足以下两个条件：
    1）在每一次调用自身时，必须是更接近于最终结果；
    2）必须有一个确定的递归终止条件，不会造成死循环。
    举例说明：
    在实际工作中往往会在遍历文件夹的时候使用。
    如果有个例子是希望获取到目录windows下所有的文件，那么先遍历windows目录，如果发现其中还有文件夹，那么就会调用自身，继续往下寻找，依次类推，
    直到遍历到再也没有文件夹为止，这也就是意味着遍历出来了所有的文件。

24. include()和require()函数的用法和区别是什么？


25. 说出前置++和后置++的区别？

26. 什么是三目（或三元）运算符？
表达式1?表达式2:表达式3
27.switch语句使用的注意事项有哪些？

28.break和continue使用过程中有哪些区别？
    break可以终止循环。
    continue没有break强大，只能终止本次循环而进入到下一次循环中。


29. 数组根据索引分为哪两种，如何区分？
    数字索引数组和关联数组。

30. 数组的赋值方式有哪两种？
    数组的声明方式主要有两种。
    1.通过array()函数声明数组；
        可以通过key=>value的方式分别定义索引和值，也可以不定义数组的索引下标，只给出数组的元素值。
    2.直接为数组元素赋值,不需要调用array()函数。例如：
        $arr[0] = 1;
        $arr[1] = 2;

31.数组如何遍历？
    foreach()

32. foreach数组的时候指针是如何指向的？list()/each()/while()循环数组的时候指针如何指向的呢？
    当foreach开始执行的时候，数组内部的指针会自动指向第一个单元。因为foreach所操作的是指定数组的拷贝，而不是该数组本身。
    而each()一个数组后，数组指针将停留在数组中的下一个单元或者碰到数组结尾时停留在最后一个单元。如果要再次使用each()遍历数组，必须要使用reset().
    reset()将数组的内部指针倒回到第一个单元并返回第一个数组单元的值。

32. 如何计算数组长度（或者说计算数组中所有元素的个数）？字符串怎么取长度？
    count() -- 计算数组中的元素个数。
    可以使用count(数组名)或者count(数组名,1),如果有第二个参数，并且是数字1，则表示递归统计数组元素的个数。
    如果第二个参数是数字0，则等同于只有一个参数的count()函数。
    sizeof() -- count() 的别名
    字符串：strlen()、mb_strlen();

33. 数组排序的常用函数？数组合并的常用函数？
sort(), array_merge();+array_combine();
34. 数组合并函数array_merge()和数组加法运算的区别是什么？

35. 字符串定义的时候单引号和双引号有什么区别？

36. echo()和print()的区别是什么？

37. 按照分类说说都有哪些字符串处理函数？这些函数的作用是什么？

38. 正则表达式是什么？php中有哪些常用的跟正则相关的函数？
    正则表达式是用于描述字符排列模式的一种语法规则。正则表达式也叫做模式表达式。
    网站开发中正则表达式最常用于表单提交信息前的客户端验证。
    比如验证用户名是否输入正确，密码输入是否符合要求，email、手机号码等信息的输入是否合法。
    在php中正则表达式主要用于字符串的分割、匹配、查找和替换操作。
    

    preg系列函数可以处理。具体有以下几个：
    
    string preg_quote ( string str [, string delimiter] )
        转义正则表达式字符 正则表达式的特殊字符包括：. \\ + * ? [ ^ ] $ ( ) { } = ! < > | :。
    preg_replace -- 执行正则表达式的搜索和替换
    mixed preg_replace ( mixed pattern, mixed replacement, mixed subject [, int limit] )
    preg_replace_callback -- 用回调函数执行正则表达式的搜索和替换
    mixed preg_replace_callback ( mixed pattern, callback callback, mixed subject [, int limit] )
    preg_split -- 用正则表达式分割字符串
    array preg_split ( string pattern, string subject [, int limit [, int flags]] )


39. 获取当前时间戳的函数主要有哪些？

40. header()函数主要的功能有哪些？使用过程中注意什么？

41. empty()函数哪些情况下返回true？
    布尔值false，
    整型值0， 
    浮点型值0.0， 
    空白字符串， 
    字符串'0', 
    array()空数组，
    特殊数据类型NULL, 
    没有任何属性的对象，
    没有赋值的变量。

42. 连接数据库操作的步骤是什么？每一步的返回值是什么数据类型？

$coon = mysql_connect('localhost', 'root' ,''); //返回资源类型
mysql_select_db('bbs', $coon);  // 布尔类型
mysq_query('set names utf8');  //布尔类型
$qry = mysql_query('select * from bbsinfo');  // 资源类型
mysql_fetch_row($qry)；  // 数组类型



43. 说说mysql_affected_rows(),mysql_insert_id()的用法？

44. 列举常用的文件处理函数，分别返回什么数据类型？
// 对文件操作
$file = "a.txt"; 
$fp = fopen($file, 'a+');   // 资源类型
$fd = fread($fp, 10);       // 字符串
$fw = fwrite($fp, '国家宁'); // 整型(写入的长度)

45. 文件上传需要注意哪些细节？怎么把文件保存到指定目录？怎么避免上传文件重名问题？
    1.首现要在php.ini中开启文件上传；
    2.在php.ini中有一个允许上传的最大值，默认是2MB。必要的时候可以更改；
    3.上传表单一定要记住在form标签中写上enctype="multipart/form-data"；
    4.要注意上传文件的大小、文件类型是否符合要求，上传后存放的路径是否存在。

    可以通过上传的文件名获取到文件后缀，然后使用时间戳+文件后缀的方式为文件重新命名，这样就避免了重名。
    可以自己设置上传文件的保存目录，与文件名拼凑形成一个文件路径，使用move_uploaded_file()，就可以完成
    将文件保存到指定目录。


46. $_FILES是几维数组？第一维和第二维的索引下标分别是什么？
    二维数组。第一维是上传控件的name，二维下标分别为name/type/tmp_name/size/error.

47. 什么是ajax？ajax的原理是什么？ajax的核心技术是什么？ajax的优缺点是什么？
    ajax是asynchronous javascript and xml的缩写，是javascript、xml、css、DOM等多个技术的组合。

    Ajax的工作原理是一个页面的指定位置可以加载另一个页面所有的输出内容，这样就实现了一个静态页面也能获取到
    数据库中的返回数据信息了。所以ajax技术实现了一个静态网页在不刷新整个页面的情况下与服务器通信，
    减少了用户等待时间，同时也从而降低了网络流量，增强了客户体验的友好程度。
    
    Ajax的优点是：
    1.  减轻了服务器端负担，将一部分以前由服务器负担的工作转移到客户端执行，利用客户端闲置的资源进行处理；
    2.  在只局部刷新的情况下更新页面，增加了页面反应速度，使用户体验更友好。
    Ajax的缺点是不利于seo推广优化，因为搜索引擎无法直接访问到ajax请求的内容。
    ajax的核心技术是XMLHttpRequest，它是javascript中的一个对象。

48. jquery是什么？jquery简化ajax后的方法有哪些？

49. 什么是会话控制？

50. 使用cookie的注意事项有哪些？
1） setcookie()之前不可以有任何页面输出，就是空格，空白行也不可以；
2） setcookie()后，在当前页面调用$_COOKIE['cookiename']不会有输出，必须刷新或到下一个页面才可以看到cookie值；
3） 不同的浏览器对cookie处理不同，客户端可以禁用cookie，浏览器也可以闲置cookie的数量，一个浏览器能创建的cookie数量最多300个，并且每个不可以超过4kb，
每个web站点能设置的cookie总数不能超过20个。
4） cookie是保存在客户端的，用户禁用了cookie，那么setcookie就不会起作用了。所以不可以过度依赖cookie。

41. 使用session的时候，通过什么来表示当前用户，从而与其他用户进行区分？
sessionid，通过session_id()函数可以取得当前的session_id。

42. session和cookie的使用步骤分别是什么？什么是sesssion和cookie的生命周期？session和cookie的区别是什么？
    cookie是保存在客户端机器的，对于未设置过期时间的cookie，cookie值会保存在机器的内存中，只要关闭浏览器则
    cookie自动消失。如果设置了cookie的过期时间，那么浏览器会把cookie以文本文件的形式保存到硬盘中，
    当再次打开浏览器时cookie值依然有效。
    
    session是把用户需要存储的信息保存在服务器端。每个用户的session信息就像是键值对一样存储在服务器端，
    其中的键就是sessionid，而值就是用户需要存储信息。服务器就是通过sessionid来区分存储的session信息是
    哪个用户的。
    
    两者最大的区别就是session存储在服务器端，而cookie是在客户端。session安全性更高，而cookie安全性弱。

    session在web开发中具有非常重要的份量。它可以将用户正确登录后的信息记录到服务器的内存中，当用户以此身份
    访问网站的管理后台时，无需再次登录即可得到身份确认。而没有正确登录的用户则不分配session空间，即便输入了
    管理后台的访问地址也不能看到页面内容。通过session确定了用户对页面的操作权限。
    
    使用session的步骤：
    1. 启动session：
        使用session_start()函数来启动。
    2. 注册会话：
        直接给$_SESSION数组添加元素即可。
    3. 使用会话：
        判断session是否为空或者是否已经注册，如果已经存在则像普通数组使用即可。
    4. 删除会话：
        1.可以使用unset删除单个session；
        2.使用$_SESSION=array()的方式，一次注销所有的会话变量；
        3.使用session_destroy()函数来彻底销毁session。


    cookie怎么使用？
    1. 记录用户访问的部分信息
    2. 在页面间传递变量
    3. 将所查看的internet页存储在cookies临时文件夹中，可以提高以后的浏览速度。

    创建cookie：
        setcookie(string cookiename , string value , int expire);
    读取cookie：
        通过超级全局数组$_COOKIE来读取浏览器端的cookie的值。
    删除cookie：有两种方法
        1.手工删除方法：
            右击浏览器属性，可以看到删除cookies，执行操作即可将所有cookie文件删除。
        2.setcookie()方法：
            跟设置cookie的方法一样，不过此时讲cookie的值设置为空，有效时间为0或小于当前时间戳。




43. 在实际开发中，session在哪些场合使用？
    session用来存储用户登录信息和用在跨页面传值。
    1）常用在用户登录成功后，将用户登录信息赋值给session；
    2）用在验证码图片生成，当随机码生成后赋值给session。

44. 注销session会话的形式有几种？

45. 什么是OOP?什么是类和对象？什么是类属性？OOP的三大特性是什么？
    OOP(object oriented programming)，即面向对象编程，其中两个最重要的概念就是类和对象。
    世间万物都具有自身的属性和方法，通过这些属性和方法可以区分出不同的物质。
    属性和方法的集合就形成了类，类是面向对象编程的核心和基础，
    通过类就将零散的用于实现某个功能的代码有效地管理起来了。
    
    类只是具备了某些功能和属性的抽象模型，而实际应用中需要一个一个实体，也就是需要对类进行实例化，
    类在实例化之后就是对象。


    OOP具有三大特点：
    1. 封装性：
       也称为信息隐藏，就是将一个类的使用和实现分开，只保留部分接口和方法与外部联系，或者说只公开了一些供开发人员使用的方法。
       于是开发人员只需要关注这个类如何使用，而不用去关心其具体的实现过程，这样就能实现MVC分工合作，也能有效避免程序间相互依赖，
     实现代码模块间松藕合。

    2. 继承性：
       就是子类自动继承其父级类中的属性和方法，并可以可以添加新的属性和方法或者对部分属性和方法进行重写。继承增加了代码的可重用性。
       php只支持单继承，也就是说一个子类只能有一个父类。

    3. 多态性：
       子类继承了来自父级类中的属性和方法，并对其中部分方法进行重写。
       于是多个子类中虽然都具有同一个方法，但是这些子类实例化的对象调用这些相同的方法后却可以获得完全不同的结果，这种技术就是多态性。
       多态性增强了软件的灵活性。


46. 常用的属性的访问修饰符有哪些？分别代表什么含义？
    private，protected，public。如果不使用这三个关键词，也可以使用var关键字。但是var不可以跟权限修饰词一起使用。


47. $this和self、parent这三个关键词分别代表什么？在哪些场合下使用？


48.类中如何定义常量、如何类中调用常量、如何在类外调用常量。
    类中的常量也就是成员常量，常量就是不会改变的量，是一个恒值。
    定义常量使用关键字const.
    例如：const PI = 3.1415326;
    无论是类内还是类外，常量的访问和变量是不一样的，常量不需要实例化对象，
    访问常量的格式都是类名加作用域操作符号（双冒号）来调用。
    即：类名 :: 类常量名; 


48. 作用域操作符::如何使用？

49. 什么是魔术方法？常用的魔术方法有哪几个？

50. 什么是构造方法和析构方法？
    构造方法就是在实例化一个对象的同时自动执行的成员方法，作用就是初始化对象。
    php5之前，一个跟类名完全相同的方法是构造方法，php5之后魔术方法__construct()就是构造方法。
    如果类中没有定义构造方法，那么php会自动生成一个，这个自动生成的构造方法没有任何参数，
    没有任何操作。
    构造方法的格式如下：
    function __construct(){}
    或者：function 类名(){}
    构造方法可以没有参数，也可以有多个参数。

    析构方法的作用和构造方法正好相反，是对象被销毁时被自动调用的，作用是释放内存。
    析构方法的定义方法为：__destruct();
    因为php具有垃圾回收机制，能自动清除不再使用的对象，释放内存，一般情况下可以不手动创建析构方法。

51. __autoload()方法的工作原理是什么？
    使用这个魔术函数的基本条件是类文件的文件名要和类的名字保持一致。
    当程序执行到实例化某个类的时候，如果在实例化前没有引入这个类文件，那么就自动执行__autoload()函数。
    这个函数会根据实例化的类的名称来查找这个类文件的路径，当判断这个类文件路径下确实存在这个类文件后
    就执行include或者require来载入该类，然后程序继续执行，如果这个路径下不存在该文件时就提示错误。
    使用自动载入的魔术函数可以不必要写很多个include或者require函数。


52. 什么是抽象类和接口？抽象类和接口有什么不同和相似的地方？
抽象类是一种不能被实例化的类，只能作为其他类的父类来使用。
    抽象类是通过关键字 abstract 来声明的。
    抽象类与普通类相似，都包含成员变量和成员方法，两者的区别在于，抽象类中至少要包含一个抽象方法，
    抽象方法没有方法体，该方法天生就是要被子类重写的。
    抽象方法的格式为：abstract function abstractMethod();
        
    因为php中只支持单继承，如果想实现多重继承，就要使用接口。也就是说子类可以实现多个接口。
    接口类是通过interface关键字来声明的，接口类中的成员常量和方法都是public的，方法可以不写关键字public，
    接口中的方法也是没有方法体。接口中的方法也天生就是要被子类实现的。

    抽象类和接口实现的功能十分相似，最大的不同是接口能实现多继承。在应用中选择抽象类还是接口要看具体实现。
    子类继承抽象类使用extends，子类实现接口使用implements。


53. __call的参数有几个，类型是什么，意义是什么？
    魔术方法__call()的作用是当程序调用一个不存在或不可见的成员方法时，php会先调用__call()方法，
    将那个不存在的方法的方法名和参数都存储下来。
    __call()包含两个参数，第一个参数是那个不存在的方法的方法名，是个字符串类型；
    第二个参数是那个不存在的方法的所有参数，是个数组类型。

    本人认为__call()方法的意义更多在于调试，可以定位到错误。同时可以捕捉异常，如果某个方法不存在，
    则执行其它可替代方法。


54. 字符串怎么转成整数，有几种方法？怎么实现？
    强制类型转换: (整型)字符串变量名;
    直接转换：settype(字符串变量,整型);
    intval(字符串变量);

55.页面字符出现乱码，怎么解决?
    1.首先考虑当前文件是不是设置了字符集。查看是不是meta标签中写了charset，如果是php页面还可以看看是不是
    在header()函数中指定了charset；
    2.如果设置了字符集（也就是charset），那么判断当前文件保存的编码格式是否跟页面设置的字符集保持一致，
    两者必须保持统一；
    3.如果涉及到从数据库提取数据，那么判断数据库查询时的字符集是否跟当前页面设置的字符集一致，两者必须统一。


56.说出数组涉及到的常用函数。
    array --  声明一个数组
    count -- 计算数组中的单元数目或对象中的属性个数
    foreach -- 遍历数组
    list -- 遍历数组
    explode -- 将字符串转成数组
    implode -- 将数组转成一个新字符串
    array_merge -- 合并一个或多个数组
    is_array -- 检查是否是数组     

    print_r -- 输出数组
    sort -- 数组排序

    array_keys -- 返回数组中所有的键名
    array_values -- 返回数组中所有的值
    key -- 从关联数组中取得键名


57. smarty模板技术的用途是什么？

58. smarty配置主要有哪几项？

59. smarty在使用过程中需要注意哪些细节？
    Smarty是基于MVC概念的一种模板引擎，它将一个页面程序分成了两部分来实现：即视图层和控制层，
    也就是说smarty技术将用户UI与php代码分离开。
    这样程序员和美工各司其职，互不干扰。
    
    smarty运用过程中要注意以下几个问题：
    1.正确配置smarty。主要要配置smarty模板文件的路径；
    2.php页面中使用assign赋值 和 display显示页面；
    3.smarty模板文件中不允许出现php代码段，所有的注释，变量，函数都要包含在定界符内。

60. 什么是MVC？MVC的目的是什么？


//////php面试题 附答案0.php////////////////////

PHP笔试题(附答案)基础题 
1. 写出如下程序的输出结果
<?
$str1 = null;
$str2 = false;
echo $str1==$str2 ? '相等' : '不相等';

$str3 = '';
$str4 = 0;
echo $str3==$str4 ? '相等' : '不相等';

$str5 = 0;
$str6 = '0';
echo $str5===$str6 ? '相等' : '不相等';
?>


2. 写出如下程序的输出结果
<?
$a1 = null;
$a2 = false;
$a3 = 0;
$a4 = '';
$a5 = '0';
$a6 = 'null';
$a7 = array();
$a8 = array(array());

echo empty($a1) ? 'true' : 'false';
echo empty($a2) ? 'true' : 'false';
echo empty($a3) ? 'true' : 'false';
echo empty($a4) ? 'true' : 'false';
echo empty($a5) ? 'true' : 'false';
echo empty($a6) ? 'true' : 'false';
echo empty($a7) ? 'true' : 'false';
echo empty($a8) ? 'true' : 'false';
?>

3. 写出如下程序的输出结果
<?
$test = 'aaaaaa';
$abc = & $test;
unset($test);

echo $abc;
?>

4. 写出如下程序的输出结果
<?$count = 5;
function get_count(){
static $count = 0;
return $count++;
}

echo $count;
++$count;
echo get_count();
echo get_count();
?>

5. 写出如下程序的输出结果
<?
$GLOBALS['var1'] = 5;
$var2 = 1;
function get_value(){
global $var2;
$var1 = 0;
return $var2++;
}
get_value();

echo $var1;
echo $var2;
?>

6. 写出如下程序的输出结果
<?
function get_arr($arr){
unset($arr[0]);
}
$arr1 = array(1, 2);
$arr2 = array(1, 2);

get_arr(&$arr1);
get_arr($arr2);

echo count($arr1);
echo count($arr2);
?>


7. 使用五种以上方式获取一个文件的扩展名

要求：dir/upload.image.jpg，找出 .jpg 或者 jpg ，
必须使用PHP自带的处理函数进行处理，方法不能明显重复，可以封装成函数，比如 get_ext1($file_name), get_ext2($file_name)


二、算法题


1. 使用PHP描述冒泡排序和快速排序算法，对象可以是一个数组

2. 使用PHP描述顺序查找和二分查找（也叫做折半查找）算法，顺序查找必须考虑效率，对象可以是一个有序数组

3. 写一个二维数组排序算法函数，能够具有通用性，可以调用php内置函数



【附答案】（以下答案不一定是最好的，只是一个简单的参考）

一、基础题

1. 相等 相等 不相等
2. true true true true true false true false
3. aaaaaa
4. 5 0 1
5. 5 2
6. 1 2
7. 使用五种以上方式获取一个文件的扩展名

function get_ext1($file_name){
return strrchr($file_name, '.');
}
function get_ext2($file_name){
return substr($file_name, strrpos($file_name, '.'));
}
function get_ext3($file_name){
return array_pop(explode('.', $file_name));
}
function get_ext4($file_name){
$p = pathinfo($file_name);
return $p['extension'];
}
function get_ext5($file_name){
return strrev(substr(strrev($file_name), 0, strpos(strrev($file_name), '.')));
}


二、算法题

1. 使用PHP描述冒泡排序和快速排序算法，对象可以是一个数组

//冒泡排序（数组排序） 
function bubble_sort($array) 
{ 
          $count = count($array); 
          if ($count <= 0) return false;

          for($i=0; $i<$count; $i++){ 
                  for($j=$count-1; $j>$i; $j--){ 
                          if ($array[$j] < $array[$j-1]){ 
                                  $tmp = $array[$j]; 
                                  $array[$j] = $array[$j-1]; 
                                  $array[$j-1] = $tmp; 
                          } 
                  } 
          } 
          return $array; 
}

//快速排序（数组排序） 
function quick_sort($array) { 
          if (count($array) <= 1) return $array;

          $key = $array[0]; 
          $left_arr = array(); 
          $right_arr = array();

          for ($i=1; $i<count($array); $i++){ 
                  if ($array[$i] <= $key) 
                          $left_arr[] = $array[$i]; 
                  else 
                          $right_arr[] = $array[$i]; 
          }

          $left_arr = quick_sort($left_arr); 
          $right_arr = quick_sort($right_arr);

          return array_merge($left_arr, array($key), $right_arr); 
}


2. 使用PHP描述顺序查找和二分查找（也叫做折半查找）算法，顺序查找必须考虑效率，对象可以是一个有序数组

//二分查找（数组里查找某个元素） 
function bin_sch($array, $low, $high, $k){ 
      if ($low <= $high){ 
          $mid = intval(($low+$high)/2); 
          if ($array[$mid] == $k){ 
              return $mid; 
          }elseif ($k < $array[$mid]){ 
              return bin_sch($array, $low, $mid-1, $k); 
          }else{ 
              return bin_sch($array, $mid+1, $high, $k); 
          } 
      } 
      return -1; 
}

//顺序查找（数组里查找某个元素） 
function seq_sch($array, $n, $k){ 
      $array[$n] = $k; 
      for($i=0; $i<$n; $i++){ 
          if($array[$i]==$k){ 
              break; 
          } 
      } 
      if ($i<$n){ 
          return $i; 
      }else{ 
          return -1; 
      } 
}


3. 写一个二维数组排序算法函数，能够具有通用性，可以调用php内置函数

//二维数组排序， $arr是数据，$keys是排序的健值，$order是排序规则，1是升序，0是降序
function array_sort($arr, $keys, $order=0) {
if (!is_array($arr)) {
     return false;
}
$keysvalue = array();
foreach($arr as $key => $val) {
     $keysvalue[$key] = $val[$keys];
}
if($order == 0){
     asort($keysvalue);
}else {
     arsort($keysvalue);
}
reset($keysvalue);
foreach($keysvalue as $key => $vals) {
     $keysort[$key] = $key;
}
$new_array = array();
foreach($keysort as $key => $val) {
     $new_array[$key] = $arr[$val];
}
return $new_array;
}


一份php面试题(附答案)2007-06-25 10:36
考的很基础，但基础不牢，有一批不会做。像在HTTP 1.0中，状态码 401 的含义，error_reporting(2047)这些不知道。但用2047似乎有点儿变态，太不易读。

如果可以参考手册~~~~


* 1.在PHP中，当前脚本的名称（不包括路径和查询字符串）记录在预定义变量（1）中；而链接到当前页面的URL记录在预定义变量（2）中。
2.执行程序段<?php echo 8%(-2) ?>将输出（3）。
3.在HTTP 1.0中，状态码 401 的含义是（4）；如果返回“找不到文件”的提示，则可用 header 函数，其语句为（5）。
4.数组函数 arsort 的作用是（6）；语句 error_reporting(2047)的作用是（7）。
5.PEAR中的数据库连接字符串格式是（8）。
6.写出一个正则表达式，过虑网页上的所有JS/VBS脚本（即把script标记及其内容都去掉）：（9）。
7.以Apache模块的方式安装PHP，在文件http.conf中首先要用语句（10）动态装载PHP模块，
然后再用语句（11）使得Apache把所有扩展名为php的文件都作为PHP脚本处理。
8.语句 include 和 require 都能把另外一个文件包含到当前文件中，它们的区别是（12）；为了避免多次包含同一文件，可以用语句（13）来代替它们。
9.类的属性可以序列化后保存到 session 中，从而以后可以恢复整个类，这要用到的函数是（14）。
10.一个函数的参数不能是对变量的引用，除非在php.ini中把（15）设为on.
11.SQL 中LEFT JOIN的含义是（16）。
如果 tbl_user记录了学生的姓名(name)和学号(ID)，
tbl_score记录了学生（有的学生考试以后被开除了，没有其记录）的学号(ID)和考试成绩(score)以及考试科目(subject)，
要想打印出各个学生姓名及对应的的各科总成绩，则可以用SQL语句（17）。

12.在PHP中，heredoc是一种特殊的字符串，它的结束标志必须（18）。



13.写一个函数，能够遍历一个文件夹下的所有文件和子文件夹。
14.简述论坛中无限分类的实现原理。
15.设计一个网页，使得打开它时弹出一个全屏的窗口，该窗口中有一个文本框和一个按钮。用户在文本框中输入信息后点击按钮就可以把窗口关闭，而输入的信息却在主网页中显示。

//答案（填空）:

1. echo $_SERVER['PHP_SELF']; echo $_SERVER["HTTP_REFERER"];
2. 0
3. (4)未授权 (5) header("HTTP/1.0 404 Not Found");
4. (6)对数组进行逆向排序并保持索引关系   (7)All errors and warnings
5. 没弄明白
6. /<script[^>].*?>.*?<\/script>/si
7.(10)   LoadModule     php5_module "D:/xampp/apache/bin/php5apache2.dll"
  
    (11) AddType application/x-httpd-php-source .phps
       AddType application/x-httpd-php .php .php5 .php4 .php3 .phtml
8.(12) 发生异常时include产生警告require产生致命错误   (13) require_once()/include_once()
9. serialize() /unserialize()
10. allow_call_time_pass_reference
11. (16) 自然左外连接
      (17) select name , count(score) as sum_score from tbl_user left join tbl_score on tbl_user.ID=tbl_score.ID   group by tbl_user.ID
12. 结束标识符所在的行不能包含任何其它字符除";"



13.

/**
* 遍历目录，结果存入数组。支持php4及以上。php5以后可用scandir()函数代替while循环。
* @param string $dir
* @return array
*/
function my_scandir($dir)
{
    $files = array();
    if ( $handle = opendir($dir) ) {
        while ( ($file = readdir($handle)) !== false ) {
            if ( $file != ".." && $file != "." ) {
                if ( is_dir($dir . "/" . $file) ) {
                    $files[$file] = rec_scandir($dir . "/" . $file);
                }else {
                    $files[] = $file;
                }
            }
        }
        closedir($handle);
        return $files;
    }
} 
 
///PHP面试题1.php///////////////////////////
1.以下哪一句不会把 John 新增到 users 阵列？ 
$users[] = 'john'; 
成功把 John 新增到阵列 users。 
array_add($users,’john’); 
函式 array_add() 无定义。 
array_push($users,‘john’); 
成功把 John 新增到阵列 users。 
$users ||= 'john'; 
语法错误。 
2.sort()、assort()、和 ksort() 有什么分别？它们分别在什么情况下使用？ 
sort() 
根据阵列中元素的值，以英文字母顺序排序，索引键会由 0 到 n-1 重新编号。主要是当阵列索引键的值无关疼痒时用来把阵列排序。 
assort() 
PHP 没有 assort() 函式，所以可能是 asort() 的笔误。 
asort() 
与 sort() 一样把阵列的元素按英文字母顺序来排列，不同的是所有索引键都获得保留，特别适合替联想阵列排序。 
ksort() 
根据阵列中索引键的值，以英文字母顺序排序，特别适合用于希望把索引键排序的联想阵列。 
3.以下的代码会产生什么？为什么？ 
$num =10; 
function multiply(){ 
$num =$num *10; 
} 
multiply(); 
echo $num; 
由于函式 multiply() 没有指定 $num 为全域变量（例如 global $num 或者 $_GLOBALS['num']），所以 $num 的值是 10。 
4. reference 跟一个正规的变量有什么分别？如何 pass by reference？在什么情况下我们需要这样做？ 
Reference 传送的是变量的地址而非它的值，所以在函式中改变一个变量的值时，整个应用都见到这个变量的新值。 
一个正规变量传送给函式的是它的值，当函式改变这个变量的值时，只有这个函式才见到新值，应用的其他部分仍然见到旧值。 

$myVariable = "its' value"; 
Myfunction(&$myVariable); // 以 reference 传送参数以 reference 传送参数给函式，可以使函式改变了的变量，即使在函式结束后仍然保留新值。 
5.些函式可以用来在现正执行的脚本中插入函式库？ 
对这道题目不同的理解会有不同的答案，我的第一个想法是插入 PHP 函式库不外乎 include()、include_once()、require()、require_once()，但细心再想，“函式库”也应该包括 com 物件和 .net 函式库，所以我们的答案也要分别包括 com_load 和 dotnet_load，下次有人提起“函式库”的时候，别忘记这两个函式。 
6.foo() 与 @foo() 有什么分别？ 
foo() 会执行这个函式，任何解译错误、语法错误、执行错误都会在页面上显示出来。 
@foo() 在执行这个函式时，会隐藏所有上述的错误讯息。 
很多应用程式都使用 @mysql_connect() 和 @mysql_query 来隐藏 mysql 的错误讯息，我认为这是很严重的失误，因为错误不该被隐藏，你必须妥善处理它们，可能的话解决它们。 
7.你如何替 PHP 的应用程式侦错？ 
我并不常这样做，我曾经试过很多不同的侦错工具，在 Linux 系统中设定这些工具一点也不容易。不过以下我会介绍一个近来颇受注目的侦错工具。 
PHP - Advanced PHP Debugger 或称 PHP - APD，第一步是执行以下的指令安装： 
pear install apd安装后在你的脚本的开头位置加入以下的语句开始进行侦错： 
apd_set_pprof_trace();执行完毕，打开以下档案来查阅执行日志： 
apd.dumpdir 
你也可以使用 pprofp 来格式化日志。 
详细的资料可以参阅 http://us.php.net/manual/en/ref.apd.php。 
8.“===”是什么？试举一个“==”是真但“===”是假的例子。 
“===”是给既可以送回布尔值“假”，也可以送回一个不是布尔值但却可以赋与“假”值的函式，strpos() 和 strrpos() 便是其中两个例子。 
问题的第二部份有点困难，想一个“==”是假，但是“===”是真的例子却很容易，相反的例子却很少。但我终于找到以下的例子： 
if (strpos("abc", "a") == true){ // 这部分永不会被执行，因为 "a" 的位置是 0，换算成布尔值“假”}if (strpos("abc", "a") === true){ // 这部份会被执行，因为“===”保证函式 strpos() 的送回值不会换算成布尔值.} 
9.你会如何定义一个没有成员函式或特性的类别 myclass？ 
class myclass{} 
10.你如何产生一个 myclass 的物件？ 
$obj = new myclass(); 
11.在一个类别内如何存取这个类别的特性及变改它的值？ 
使用语句：$this->propertyName，例如： 
class myclass{ private $propertyName; public function __construct() { $this->propertyName = "value"; }} 
12.include 和 include_once 有什么分别？require 又如何？ 
三者都是用来在脚本中插入其他档案，视乎 url_allow_fopen 是否核准，这个档案可以从系统内部或外部取得。但他们之间也有微细的分别： 
include()：这个函式容许你在脚本中把同一个档案插入多次，若果档案不存在，它会发出系统警告并继续执行脚本。 
include_once()：它跟 include() 的功能相似，正如它的名字所示，在脚本的执行期间，有关档案只会被插入一次。 
require()：跟 include() 差不多，它也是用来在脚本中插入其他档案，但若果档案不存在，它会发出系统警告，这个警告会引致致命错误令脚本中止执行 
13.以下哪一个函式可以把浏览器转向到另一个页面？ 
redir() 
这不是一个 PHP 函式，会引致执行错误。 
header() 
这个是正确答案，header() 用来插入卷头资料，可以用来使浏览器转向到另一个页面，例如： 
header("Location: http://www.search-this.com/"); 
location() 
这不是一个 PHP 函式，会引致执行错误。 
redirect() 
这不是一个 PHP 函式，会引致执行错误。 

14.以下哪一个函式可以用来开启档案以便读／写？ 
fget() 
这不是一个 PHP 函式，会引致执行错误。 
file_open() 
这不是一个 PHP 函式，会引致执行错误。 
fopen() 
这是正确答案，fopen() 可以用来开启档案以便读／写，事实上这个函式还有很多选项，详细资料请参阅 php.net。 
open_file() 
这不是一个 PHP 函式，会引致执行错误。 
15.mysql_fetch_row() 和 mysql_fetch_array() 有什么分别？ 
mysql_fetch_row() 把数据库的一列储存在一个以零为基数的阵列中，第一栏在阵列的索引 0，第二栏在索引 1，如此类推。mysql_fetch_assoc() 把数据库的一列储存在一个关联阵列中，阵列的索引就是栏位名称，例如我的数据库查询送回“first_name”、“last_name”、“email”三个栏位，阵列的索引便是“first_name”、“last_name”和“email”。mysql_fetch_array() 可以同时送回 mysql_fetch_row() 和 mysql_fetch_assoc() 的值。 
16.下面的代码用来做什么？请解释。 
$date='08/26/2003';print ereg_replace("([0-9]+)/([0-9]+)/([0-9]+)","\\2/\\1/\\3",$date); 
这是把一个日期从 MM/DD/YYYY 的格式转为 DD/MM/YYYY 格式。我的一个好朋友告诉我可以把这个正规表达式拆解为以下的语句，对于如此简单的表示是来说其实无须拆解，纯粹为了解说的方便： 
// 对应一个或更多 0-9，后面紧随一个斜号$regExpression = "([0-9]+)/";// 应一个或更多 0-9，后面紧随另一个斜号$regExpression .= "([0-9]+)/";// 再次对应一个或更多 0-9$regExpression .= "([0-9]+)";至于 \\2/\\1/\\3 则是用来对应括号，第一个括号对的是月份，第二个括号对应的是日期，第三个括号对应的是年份。 
17.给你一行文字 $string，你会如何编写一个正规表达式，把 $string 内的 HTML 标签除去？ 
首先，PHP 有内建函式 strip_tags() 除去 HTML 标签，为何要自行编写正规表达式？好了，便当作是面试的一道考题吧，我会这样回答： 
$stringOfText = "
This is a test

";$expression = "/<(.*?)>(.*?)<\/(.*?)>/";echo preg_replace($expression, "\\2", $stringOfText);// 有人说也可以使用 /(<[^>]*>)/ $expression = "/(<[^>]*>)/";echo preg_replace($expression, "", $stringOfText); 
18.PHP 和 Perl 分辨阵列和散列表的方法有什么差异？ 
这正是为何我老是告诉别人选择适当的编程语言，若果你只用一种语言的话你怎么能回答这道问题？这道问题很简单，Perl 所有阵列变量都是以 @ 开头，例如 @myArray，PHP 则沿用 $ 作为所有变量的开头，例如 $myArray。 
至于 Perl 表示散列表则用 %，例如 %myHash，PHP 则没有分别，仍是使用 $，例如 $myHash。 
19.你如何利用 PHP 解决 HTTP 的无状态本质？ 
最主要的俩各选择是 session 和 cookie。使用 session 的方法是在每一页的开始加上 session_start()，然后利用 $_SESSION 散列表来储存 session 变量。至于 cookie 你只需记着一个原则：在输出任何文字之前调用 set_cookie() 函式，此外只需使用 $_COOKIE 散列表便可以存取所有 cookie 变量。 
还有一个不那么可靠的方法，就是利用访客的 IP 地址，这个方法有特定的危险性。 
20.GD 函式库用来做什么？ 
这个可能是我最喜欢的函式库，自从 PHP 4.3.0 版本后 GD 便内建在 PHP 系统中。这个函式库让你处理和显示各式格式的图档，它的另一个常见用途是制作所图档。GD 以外的另一个选择是 ImageMagick，但这个函式库并不内建于 PHP 之中，必须由系统管理员安装在伺服器上。 
21.试写出几个输出一段 HTML 代码的方法。 
嗯，你可以使用 PHP 中任何一种输出语句，包括 echo、print、printf，大部分人都使用如下例的 echo： 
echo "My string $variable";你也可以使用这种方法： 
echo << HTML tags in here as well. The END; remarks must be on a line of its own, and can't contain any extra white space.END; 
22.PHP 比 Perl 好吗？请讨论。 
我们不要为一个简单的问题引发一场舌战，正如我经常说的：“为工作选择适合的语言，不要把工作迁就语言。”我个人认为 Perl 十分适合用作命令行工具，虽然它在网页应用上也有不错的表现，但是它的真正实力在命令行上才能充分发挥。同样地，PHP 虽然可以在控制台的环境中使用，但是个人认为它在网页应用上有更好的表现，PHP 有大量专门为网页应用而设计的函式，Perl 则似乎以命令行为设计之本。 
个人来说两种语言我都喜欢，在大学期间我经常使用 Perl、PHP 和 Java，可惜工作上我使用 C#，但在家里我花不少时间操练 PHP、Perl、Ruby（现正学习）和 Java，保持我的技能知识在最新状态。很多人问我 C 和 C++ 怎么样，它们是否仍有机会在我的应用中占一席位，我的答案基本上是“否”，我近来的工作主要集中在网页开发，虽然 C 和 C++ 也可以用来写网页，但它们到底不是为这种工作而设计的，“为工作选择适合的语言”，若果我需要编写一个控制台应用，用来展示 bubble sort、quick sort 和 merge sort 的效能比较，我一定会使用 C / C++。若果我需要编写一个相片簿系统，我会使用 PHP 或者 C#（我认为制作用户介面方面 .NET 语言比网页更加）。 

//////////////php面试题11.php///////////////////////
这是一份比较全面的PHP面试题.对准备去新公司应聘PHP职位的开发者应该有帮助.
或者说,对招聘PHP开发人员的企业也有些帮助,不过就不要 原样打印出来考了,稍微改一改. 

　　简述题(50分)
本部分设定了隐藏,您已回复过了,以下是隐藏的内容



　　1、用PHP打印出前一天 的时间格式是2006-5-10 22:21:21(2分)

　　2、echo(),print(),print_r()的区别(3分)

　 　3、能够使HTML和PHP分离开使用的模板(1分)

　　4、使用哪些工具进行版本控制?(1分)

　　5、如何实现字 符串翻转?(3分)

　　 ---------------------------------------------------------------

　 　6、优化MYSQL数据库的方法。(4分，多写多得)

　　7、PHP的意思(送1分)

　　8、MYSQL取得当前时间 的函数是?，格式化日期的函数是(2分)

　　9、实现中文字串截取无乱码的方法。(3分)

　　 ---------------------------------------------------------------

　 　10、您是否用过版本控制软件? 如果有您用的版本控制软件的名字是?(1分)

　　11、您是否用过模板引擎? 如果有您用的模板引擎的名字是?(1分)

　　12、请简单阐述您最得意的开发之作(4分)

　　13、对于大流量的网站, 您采用什么样的方法来解决访问量问题?(4分)

　　 -----------------------------------------------------------------

　 　14、用PHP写出显示客户端IP与服务器IP的代码1分)

　　15、语句include和require的区别是什么?为避免多次包 含同一文件，可用(?)语句代替它们? (2分)

　　16、如何修改SESSION的生存时间(1分).

　　17、有一 个网页地址, 比如PHP研究室主页: http://www.php100.com,如何得 到它的内容?($1分)

　　18、在HTTP 1.0中，状态码401的含义是(?);如果返回“找不到文件”的提示，则可用 header 函数，其语句为(?);(2分)

　　19、在PHP中，heredoc是一种特殊的字符串，它的结束标志必须?(1分)

　 　20、谈谈asp,php,jsp的优缺点(1分)

　　21、谈谈对mvc的认识(1分)

　　 -------------------------------------------------------------------

　 　22、写出发贴数最多的十个人名字的SQL，利用下表：members(id,username,posts,pass,email)(2分)

　 　23. 请说明php中传值与传引用的区别。什么时候传值什么时候传引用?(2分)

　　24. 在PHP中error_reporting这个函数有什么作用? (1分)

　　25. 请写一个函数验证电子邮件的格式是否正确 (2分)

　　26. 简述如何得到当前执行脚本路径，包括所得到参数。(2分)

　　27.如何修改SESSION的生存 时间. (1分)

　　 --------------------------------------------------------------------

　 　28、JS表单弹出对话框函数是?获得输入焦点函数是? (2分)

　　29、JS的转向函数是?怎么引入一个外部JS文件?(2分)

　 　30、foo()和@foo()之间有什么区别?(1分)

　　31、如何声明一个名为”myclass”的没有方法和属性的类? (1分)

　　32、如何实例化一个名为”myclass”的对象?(1分)

　　33、你如何访问和设置一个类的属性? (2分)

　　34、mysql_fetch_row() 和mysql_fetch_array之间有什么区别? (1分)

　 　--------------------------------------------------------------------

　 　35、GD库是做什么用的? (1分)

　　36、指出一些在PHP输入一段HTML代码的办法。(1分)

　　37、下 面哪个函数可以打开一个文件，以对文件进行读和写操作?(1分)
　　(a) fget() (b) file_open() (c) fopen() (d) open_file()

　　38、下面哪个选项没有将 john 添加到users 数组中? (1分)
　 　(a) $users[] = ‘john’;
　　(b) array_add($users,’john’);
　　(c) array_push($users,‘john’);
　　(d) $users ||= ‘john’;

　　39、下面的程序 会输入是否?(1分)
　　$num = 10;
　　function multiply(){
　　$num = $num * 10;
　　}
　　multiply();
　　echo $num;
　　?>

　　40、使用php 写一段简单查询，查出所有姓名为“张三”的内容并打印出来 (2分)
　　表名　UserName　Tel　Content　Date
　　 　　　张三 13333663366 大专毕业 2006-10-11
　　　　　张三 13612312331 本科毕业 2006-10-15
　 　　　　张四 021-55665566 中专毕业 2006-10-15
　　请根据上面的题目完成代码：
　　 $mysql_db=mysql_connect("local","root","pass");
　　 @mysql_select_db("DB",$mysql_db);

　　41、如何使用下面的类,并解释下面什么意思?(3)
　 　class test{
　　function Get_test($num){
　　 $num=md5(md5($num)."En");
　　return $num;
　　}
　　}

　　 ----------------------------------------------------------------------------

　 　42、写出 SQL语句的格式 : 插入 ，更新 ，删除 (4分)
　　表名　UserName　Tel　Content　Date
　 　　　　张三 13333663366 大专毕业 2006-10-11
　　　　　张三 13612312331 本科毕业 2006-10-15
　　　　　张四 021-55665566 中专毕业 2006-10-15
　　(a) 有一新记录(小王 13254748547 高中毕业 2007-05-06)请用SQL语句新增至表中
　　(b) 请用sql语句把张三的时间更新成为当前系统时间
　　(c) 请写出删除名为张四的全部记录

　　43、请写出数据类型(int char varchar datetime text)的意思; 请问varchar和char有什么区别(2分)

　　44、MySQ 自增类型(通常为表ID字段)必需将其设为(?)字段(1分)

　　45、写出以下程序的输出结果 (1分)
　　$b=201;
　 　$c=40;
　　$a=$b>$c?4:5;
　　echo $a;
　　?>

　　46、检测一个变 量是否有设置的函数是否?是否为空的函数是?(2分)

　　 -----------------------------------------------------------------------------

　 　47、取得查询结果集总数的函数是?(1分)

　　48、$arr = array('james', 'tom', 'symfony'); 请打印出第一个元素的值 (1分)

　　49、请将41题的数组的值用','号分隔并合并成字串输出(1分)

　 　50、$a = 'abcdef'; 请取出$a的值并打印出第一个字母(1分)

　　51、PHP可以和sql server/oracle等数据库连接吗?(1分)

　　52、请写出PHP5权限控制修饰符(3分)

　　53、请写出 php5的构造函数和析构函数(2分)

　　 ------------------------------------------------------------------------------

　 　54、以下请用PHPMYADMIN完成

　　(一)创建新闻发布系统，表名为message有如下字段 (3分)
　　id 文章id
　　title 文章标题
　　content 文章内容
　　category_id 文章分类id
　　hits 点击量

　　(二)同样上述新闻发布系统：表comment记录用户回复内容，字段如下 (4分)
　　comment_id 回复id
　　id 文章id，关联message表中的id
　　comment_content 回复内容
　　现通过查询数据库 需要得到以下格式的文章标题列表,并按照回复数量排序，回复最高的排在最前面
　　文章id 文章标题 点击量 回复数量
　　用一个SQL 语句完成上述查询，如果文章没有回复则回复数量显示为0

　　(三)上述内容管理系统，表category保存分类信息，字段如下 (3分)
　　category_id int(4) not null auto_increment;
　　categroy_name varchar(40) not null;
　　用户输入文章时，通过选择下拉菜单选定文章分类
　　写出如何实现这个下拉菜单


　 　填空题

　　1.在PHP中，当前脚本的名称(不包括路径和查询字符串)记录在预定义变量____中;而链接到当前页面的URL记录在预 定义变量____中。

　　2.执行程序段将输出____。

　　3.在HTTP 1.0中，状态码 401 的含义是____;如果返回“找不到文件”的提示，则可用 header 函数，其语句为____。

　　4.数组函数 arsort 的作用是____;语句 error_reporting(2047)的作用是____。

　　5.PEAR中的数据库连接字符串格式是 ____。

　　6.写出一个正则表达式，过虑网页上的所有JS/VBS脚本(即把scrīpt标记及其内容都去掉)：____。

　 　7.以Apache模块的方式安装PHP，在文件http.conf中首先要用语句____动态装载PHP模块，然后再用语句____使得Apache 把所有扩展名为php的文件都作为PHP脚本处理。

　　8.语句 include 和 require 都能把另外一个文件包含到当前文件中，它们的区别是____;为了避免多次包含同一文件，可以用语句____来代替它们。

　　9.类的属 性可以序列化后保存到 session 中，从而以后可以恢复整个类，这要用到的函数是____。

　　10.一个函数的参数不能是对变量 的引用，除非在php.ini中把____设为on.

　　11.SQL中LEFT JOIN的含义是____。如果 tbl_user记录了学生的姓名(name)和学号(ID)，tbl_score记录了学生(有的学生考试以后被开除了，没有其记录)的学号(ID)和 考试成绩(score)以及考试科目(subject)，要想打印出各个学生姓名及对应的的各科总成绩，则可以用SQL语句____。

　 　12.在PHP中，heredoc是一种特殊的字符串，它的结束标志必须____。

　　编程题

　　
　　1. 写一个函数，尽可能高效的，从一个标准 url 里取出文件的扩展名
　　例如: http://www.sina.com.cn/abc/de/fg.php?id=1 需要取出 php 或 .php

　　2. 在 HTML 语言中，页面头部的 meta 标记可以用来输出文件的编码格式，以下是一个标准的 meta 语句
　　请使用 PHP 语言写一个函数，把一个标准 HTML 页面中的类似 meta 标记中的 charset 部分值改为 big5
　　请注意:
　　1. 需要处理完整的 html 页面，即不光此 meta 语句
　　2. 忽略大小写
　　3. ' 和 " 在此处是可以互换的
　　4. 'Content-Type' 两侧的引号是可以忽略的，但 'text/html; charset=gbk' 两侧的不行
　　5. 注意处理多余空格

　　 3. 写一个函数，算出两个文件的相对路径
　　如 $a = '/a/b/c/d/e.php';
　　$b = '/a/b/12/34/c.php';
　　计算出 $b 相对于 $a 的相对路径应该是 ../../c/d将()添上

      3. 写一个函数，能够遍历一个文件夹下的所有文件和子文件夹。

　　4.简述论坛中无限分类的实现原理。


//////////PHP面试题2.php//////////////////
Question 1

What does <? echo count ("123") ?> print out?D

A)    3

B)    False

C)    Null

D)    1

E)    0

Question 2

Which of the following snippets prints a representation of 42 with two decimal places?B

A)    printf("%.2d\n", 42);

B)    printf("%1.2f\n", 42);

C)    printf("%1.2u\n", 42);

Question 3

Given
     $text = 'Content-Type: text/xml';
Which of the following prints 'text/xml'?C

A)    print substr($text, strchr($text, ':'));

B)    print substr($text, strchr($text, ':') + 1);

C)    print substr($text, strpos($text, ':') + 1);

D)    print substr($text, strpos($text, ':') + 2);

E)    print substr($text, 0, strchr($text, ':')

Question 4

What is the value of $a?
     <?php
         $a = in_array('01', array('1')) == var_dump('01' == 1); A
     ?>

A)    True

B)    False

Question 5

What is the value of $result in the following PHP code?
     <?php
         function timesTwo($int) {
             $int = $int * 2;    
         }
         $int = 2;
         $result = timesTwo($int);
     ?>;

Answer: NULL

Question 6

The code below ___________ because ____________.
<?php
     class Foo {
     ?>
     <?php
            function bar() {
                print "bar";
            }
     }
?>

A)    will work, class definitions can be split up into multiple PHP blocks.

B)    will not work, class definitions must be in a single PHP block.

C)    will not work, class definitions must be in a single file but can be in multiple PHP blocks.

D)    will work, class definitions can be split up into multiple files and multiple PHP blocks.

Question 7

When turned on, ____________ will _________ your script with different variables from HTML forms and cookies.

A)    show_errors, enable

B)    show_errors, show

C)    register_globals, enhance

D)    register_globals, inject 

Question 8

What will be the output of the following PHP code:
     <?php
         echo count(strlen("http://php.net"));
     ?>

Answer: 1

Question 9

What is the best all-purpose way of comparing two strings?

A)    Using the strpos function

B)    Using the == operator

C)    Using strcasecmp()

D)    Using strcmp() 

Question 10

What is the difference between "print()" and "echo()"?

Answer: print is a function,echo is a language construct









