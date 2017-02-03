1、写出五种以上你使用过的PHP的扩展的名称（提示：常用的PHP扩展）
mysqli、（数据库扩展）
gd2、（gd库进行图像处理，验证码，水印，缩略图等）
pdo、（让不同数据库使用相同的方法名，解决数据库连接不统一的问题）
curl、（抓取网页内容，模拟登录等）
mbstring、（php内部编码扩展，用以让PHP支持多语言）
php_ming：快速生成 Flash 动画（swf文件）

 

2、了解MVC模式吗？请写出三种以上目前PHP流行的MVC框架名称（不区分大小写）
MVC是Model（模型）、View(视图）、Controller（控制器）的缩写。
模型：模型部分关心的是欲显示的数据的细节，关注的是如何使用数据库来读取和保存数据
视图: 视图关心的是用户显示的部分，它通常是HTML。
控制器：控制器将特定的Model和view结合起来，保证将正确的数据显示到页面上。
常用的MVC框架：
Zend Framework
CakePHP
ThinkPHP
CI
YII

 

3、用PHP打印出前一天的时间格式是2008-2-8 18:00:10

echo '昨天:', date('Y-m-d H:i:s', strtotime('-1 day')), '<br />';

echo date('Y-m-d H:i:s',time() -24*3600);




5、能够使HTML和PHP分离开使用的模板
常用的模板引擎：smarty，还有PHPLib,FastTemplate,Savant等。


 

6、如何实现字符串翻转？
可用内置函数strrev()。如果不准用PHP内置函数的就自己写:

function str_rev($str){
	$len = strlen($str);
	$new = '';
	for($i=$len-1; $i>=0; $i--){
		$new .= $str{$i};
	}
	echo $new;
}
 



当 unset 一个引用，只是断开了变量名和变量内容之间的绑定。这并不意味着变量内容被销毁了。例如：

<?php
	$a = 1;
	$b =& $a;
	unset($a);
?>
不会 unset $b，只是 $a与值1的连接被销毁。



12、某内容管理系统：用户提交内容后，系统生成静态HTML页面；写出实现的基本思路，最好写出相关代码。
答：用户提交内容后，将内容加在最终页面模板上，然后另存为HTML页面（创建HTML页面，将内容和页面模板写入）。
代码：
$tpl->assign('vars', $vars);
$static_html = $tpl->fetch('tpl/index.html'); //Smarty的fetch方法
$fh = fopen('html/index.html', 'w');
fwrite($fh, $static_html);



16、简述如何得到当前执行脚本路径，包括所得到参数。
例如访问http://temp.com/phpinfo.php?id=1
echo $_SERVER['SCRIPT_URL']; //得到/phpinfo.php
echo $_SERVER["SCRIPT_URI"]; //得到http://temp.com/phpinfo.php
echo $_SERVER["SCRIPT_FILENAME"]; //得到F:/www/Temp/phpinfo.php
echo $_SERVER["REQUEST_URI"]; //得到/phpinfo.php?id=1
echo $_SERVER["SCRIPT_NAME"]; //得到/phpinfo.php


21、一个函数的参数不能是对变量的引用，除非在php.ini中把__设为on。
答：allow_call_time_pass_reference



23、有一数组　$a=array(3,2,4,9,8);请将其重新排序，按从小到大的顺序列出。
可用冒泡法进行排序：
冒泡排序的基本概念是：依次比较相邻的两个数，将小数放在前面，大数放在后面。即首先比较第1个和第2个数，将小数放前，大数放后。然后比较第2个数和第3个数，将小数放前，大数放后，如此继续，直至比较最后两个数，将小数放前，大数放后，此时第一趟结束，在最后的数必是所有数中的最大数。重复以上过程，仍从第一对数开始比较（因为可能由于第2个数和第3个数的交换，使得第1个数不再小于第2个数），将小数放前，大数放后，一直比较到最大数前的一对相邻数，将小数放前，大数放后，第二趟结束，在倒数第二个数中得到一个新的最大数。如此下去，直至最终完成排序。
//下面第一个函数是我自己写的，第二个是百度出来的
function bubble_order($arr){
	 $length = count($arr);
	 $var_len = $length;
	for($j = 1; $j<=$length; $j++){
		$newlen = --$var_len;
		for($i = 0; $i<$newlen; $i++){
			if($arr[$i]>$arr[$i+1]){
				$m = $arr[$i+1];
				$arr[$i+1] = $arr[$i];
				$arr[$i] = $m;
			}
		}
	}
	return $arr;
}

/**
 * 冒泡排序：一维数组值从小往大排序
 */

function bubble_sort($arr){
	$count = count($arr);
	if($count <= 0)return false;
	for($i=0; $i<$count; $i++){
		for($j=$count-1; $i<$j; $j--){
			if($arr[$j] < $arr[$j-1]){
				//交换相邻位置的值
				$tmp = $arr[$j];
				$arr[$j] = $arr[$j-1];
				$arr[$j-1] = $tmp;
			}
		}
	}
	return $arr;
}




24、写出session的运行机制。
session创建时，是否会在客户端记录一个cookie?cookie里面的内容是什么？

session机制是一种服务器端的机制，服务器使用一种类似于散列表的结构（也可能就是使用散列表）来保存信息。

当程序需要为某个客户端的请求创建一个session的时候，服务器首先检查这个客户端的请求里是否已包含了一个session标识-称为sessionid，如果已包含一个sessionid则说明以前已经为此客户端创建过session，服务器就按照sessionid把这个session检索出来使用（如果检索不到，可能会新建一个），如果客户端请求不包含sessionid，则为此客户端创建一个session并且生成一个与此session相关联的sessionid，sessionid的值应该是一个既不会重复，又不容易被找到规律以仿造的字符串，这个sessionid将被在本次响应中返回给客户端保存。

保存这个sessionid的方式可以采用cookie，这样在交互过程中浏览器可以自动的按照规则把这个标识发给服务器。一般这个cookie的名字都是类似于SEEESIONID。

由于cookie可以被人为的禁止，必须有其他机制以便在cookie被禁止时仍然能够把sessionid传递回服务器。经常被使用的一种技术叫做URL重写，就是把sessionid直接附加在URL路径的后面，附加方式也有两种，一种是作为URL路径的附加信息，表现形式为http://…../xxx;SEEESIONID=ByOK3vjFD75aPnrF7C2HmdnV6QZcEbzWoWiBYEnLerjQ99zWpBng!-145788764

另一种是作为查询字符串附加在URL后面，表现形式为http://…../xxx?SEEESIONID=ByOK3vjFD75aPnrF7C2HmdnV6QZcEbzWoWiBYEnLerjQ99zWpBng!-145788764

为了在整个交互过程中始终保持状态，就必须在每个客户端可能请求的路径后面都包含这个SEEESIONID。







25、Cookie的原理及使用？

Cookie是网站保存在浏览器客户端的信息，也就是说保存在访客的机器里的变量，一般随着HTTP头发送到服务器端。在Cookie生效之后及失效之前，客户每次发出页面请求的时候（包括PHP页面和静态html页面），都会把Cookie一块发送到服务器，只要我们针对它进行相应的处理，就可以实现变量'追随'。

cookie可以跨越子域名。
比如我们在xiaofeicn.com下面注册个个cookie，那么可以在bbs.xiaofeicn.com上读取到该cookie。
session不可以跨越子域名：
比如我们在xiaofeicn.com下面注册个个session，那么不可以在bbs.xiaofeicn.com,www.xiaofeicn.com上读取到该session。

 

a． 设置一个Cookie变量

setcookie(string name, string value, int expire,string path, string domain, int secure);
　　其中name是Cookie变量名称标识，你在PHP中将可以像使用普通变量名一样来用它引用Cookie变量。value是Cookie变量的初始值，expire 表示该Cookie变量的有效时间；path 为该Cookie变量的相关路径；domain 表示Cookie变量的网站；secure 则需在 https 的安全传输时才有效。 　　例如我们要设置一个变量username，它的值是字符串'bluewind'，我们可以这么写代码： setcookie ('username','bluewind'); //这两个参数是setcookie必要的。
　　我们还想给这个变量设置有效时间来限制操作超时等，比如说一小时： setcookie('username','bluewind', 3600); //有效时间的单位是秒。
注意：setcookie和header函数一样，需要放在任何能向客户端输出的语句之前。

b． 销毁一个cookie变量
　　销毁Cookie变量只要将它的value设为空就可以了，setcookie ('username' ,'');
 
c． Cookie的有效范围和生存期

　　Cookie的有效范围（也就是说在这个范围的页面都能得到这个Cookie变量）默认的是该目录及其子目录，当然你可以用setcookie的path和domain参数进行修改。如果你不对cookie的expire进行设置，那么当你离开网站的页面，cookie也同时自动销毁。




43、求两个日期的差数，例如2007-2-5 ~ 2007-3-6 的日期差数（天数）。
思路1：先用strtotime转换成unix时间戳，然后相减，除以86400.
思路2：先用mktime转换成unix时间戳，然后相减，除以86400.





46、如果模板是用smarty模板。怎样用section语句来显示数组,若用foreach语句又要怎样显示呢？
参考http://www.86shichang.com/blog/post-181.html

foreach循环
<?php
	$arr = array(9 => 'Tennis', 3 => 'Swimming', 8 => 'Coding');
	$smarty->assign('myArray', $arr);
?>
<ul>
	{foreach from=$myArray key=k item=v}
	<li>{$k}: {$v}</li>
	{/foreach}
</ul>
________________________
section循环

<?php
    $data = array(1000,1001,1002);
    $smarty->assign('custid',$data);
?>

customer和下面的foo可以随便命名，作用其实仅仅是一个索引下标，用来引用数组中的元素
{section name=customer loop=$custid}    //customer是$custid的索引
  id: {$custid[customer]}<br />
{/section}
<hr />

{section name=foo loop=$custid step=-1}
 id: {$custid[foo]}<br />
{/section}

//输出
id: 1000
id: 1001
id: 1002
<hr />
id: 1002
id: 1001
id: 1000




47、不用新变量直接交换现有两个变理的值。
考算法的基本功。
法一
$a = 'welcome';
$b = 'beijing';

$a = '|'.$a.'|'.'|'.$b.'|'; //|welcome||beijing|
$b = str_replace( '|'.$b.'|','', $a);
$b = trim($b, '|');
$a = str_replace( '|'.$b.'|','', $a);
$a = trim($a, '|');
echo $a;
echo $b;

法二
$var1 = 'hello';
$var2 = 'world';
$var1 = explode('#', $var1 . '#' . $var2);
$var2 = $var1[0];
$var1 = $var1[1];


48、$a=5;$b=3;怎么交换两个数字？
$a=$a+$b; // 8
$b=$a-$b; //5
$a=$a-$b; //3



49、PHP数字金额转中文大写格式，同时说明思路(考数组掌握)。
15001.25 壹万伍仟零壹元贰角伍分

//下面是我写的，很好理解，人比较笨所以代码量有点大
/**
 * 人民币大写算法(10万以内有效)
 */

//$num = 12345.67;
function RMB_daxie($num){
	$num = round($num, 2);
	$str = '' . $num;
	$arr = explode('.', $str);
	$a = $arr[0];
	$b = $arr[1];
	$len_a = strlen($a);
	$len_b = strlen($b);

	for($i=0; $i<$len_a; $i++){
		$left_arr[] = substr($a, $i, 1);
	}//$left_arr = array('1', '2', '3', '4', '5');

	for($j=0; $j<$len_b; $j++){
		$right_arr[] = substr($b, $j, 1);
	}//$right_arr = array('6', '7');

	$daxie = array('0'=>'零','1'=>'壹','2'=>'贰','3'=>'叁', '4'=>'肆','5'=>'伍','6'=>'陆','7'=>'柒','8'=>'捌','9'=>'玖');

	//整数位处理
	foreach($left_arr as $k=>$v){
		$left_arr[$k] = $daxie[$v];
		switch ($len_a--) {
			case 5:
				$left_arr[$k] .='万';break;
			case 4:
				$left_arr[$k] .='仟';break;
			case 3:
				$left_arr[$k] .='佰';break;
			case 2:
				$left_arr[$k] .='拾';break;
			default:
				$left_arr[$k] .='元';break;
		}
	}
	$left_rmb = implode('', $left_arr);

	//小数位处理
	foreach($right_arr as $k=>$v){
		$right_arr[$k] = $daxie[$v];
		switch ($len_b--) {
			case '2':
				$right_arr[$k] .='角';break;
			default:
				$right_arr[$k] .='分';break;
		}
	}
	$right_rmb = implode('', $right_arr);

	$res = $left_rmb . $right_rmb;
	$res = str_replace('零仟', '零', $res);
	$res = str_replace('零佰', '零', $res);
	$res = str_replace('零拾', '零', $res);
	$res = str_replace('零零零', '零', $res); //零零零和零零的顺序不能变，否则处理1004.23或者10003.23有问题
	$res = str_replace('零零', '零', $res);
	$res = str_replace('零元', '元', $res); //零元必须放在最后处理
	return $res;
}

echo RMB_daxie(92210.07);


50、写一个函数，能够遍历一个文件夹下的所有文件和子文件夹。


/**
 * 遍历文件夹和子文件夹、文件，并打印
 */
function print_dir($path, $deep=1){
	if(!is_dir($path))return false;

	$fh = opendir($path);
	while(($name = readdir($fh)) !== false){ //用!==防止文件名为false
		if($name == '.' || $name == '..'){
			continue;
		}
		if(!is_dir($path . '/' . $name)){
			echo str_repeat('&nbsp;', $deep),$name,'<br />';
		}else{
			echo str_repeat('&nbsp', $deep),$name,'<br />';
			print_dir($path . '/' . $name, $deep+1);
		}
	}
	closedir($fh);
}



53、假定要使用Apache+Php的配置，并将php3编译成Apache的一个模块。那麽以下httpd.conf文件的语句是必须的：【C】

A、AddModule mod_php3.c
B、LoadModule php3_module libexec/libphp3.so
C、AddType application/x-httpd-php3 .php3
D、setup
E、make install






59、下面建立与MySQL Server的连接语法正确的是：[BD]
A、$link=connect('host_name','user_name','password');
B、$link=mysql_connect('host_name','user_name','password');
C、$link=mysqlconnect('host_name','user_name','password');
D、$link=mysql_pconnect('host_name','user_name','password');
E、$link=pconnect('host_name','user_name','password');

mysql_pconnect() 和 mysql_connect() 非常相似，但有两个主要区别：
当连接的时候本函数将先尝试寻找一个在同一个主机上用同样的用户名和密码已经打开的（持久）连接，如果找到，则返回此连接标识而不打开新连接。
其次，当脚本执行完毕后到 SQL 服务器的连接不会被关闭，此连接将保持打开以备以后使用（mysql_close() 不会关闭由 mysql_pconnect() 建立的连接）。





60、rawurlencode()的作用是？
按照 RFC 3986 对 URL 进行编码，返回字符串，此字符串中除了 -_. 之外的所有非字母数字字符都将被替换成百分号（%）后跟两位十六进制数,空格替换成%20。这是在 RFC RFC 3986 中描述的编码，是为了保护原义字符以免其被解释为特殊的 URL 定界符(比如?表示get传参)，同时保护 URL 格式以免其被传输媒体（像一些邮件系统）使用字符转换时弄乱。

与urlencode()的区别：
urlencode:
返回字符串，此字符串中除了 -_. 之外的所有非字母数字字符都将被替换成百分号（%）后跟两位十六进制数，空格则编码为加号（+）。此编码与 WWW 表单 POST 数据的编码方式是一样的，同时与 application/x-www-form-urlencoded 的媒体类型编码方式一样。由于历史原因，此编码在将空格编码为加号（+）方面与 RFC1738 编码（参见 rawurlencode()）不同。

其实这样做的目的只有一个：防止中文乱码和保护一些传递的参数。多数情况下，有些浏览器会自动编码，解码。其实不用这两个函数也没影响。

在实际的开发中为了避免URL格式不统一，还是推荐大家使用rawurlencode()来进行URL的编码。





61、请说明在php.ini中safe_mode开启之后对于PHP系统函数的影响?

safe_mode是唯一PHP_INI_SYSTEM属性，必须通过php.ini或httpd.conf来设置。要启用safe_mode，只需修改php.ini： safe_mode = On 或者修改httpd.conf，定义目录：Options FollowSymLinks php_admin_value safe_mode 1

重启apache后safe_mode就生效了。启动safe_mode，会对许多PHP函数进行限制，特别是和系统相关的文件操作，数据库操作等函数。在多用户开发时可以进行文件的权限控制，默认情况下，所有操作文件的函数将只能操作与脚本UID相同的文件。




62、PHP5中魔术方法函数有哪几个，请举例说明各自的用法

__construct 对象生成时自动调用
__destruct  对象销毁时自动调用
__call, 
__get 如下
__set 如下
__isset 当在一个未定义的属性上调用 isset() 时，__isset() 被调用
__unset 当一个变量被unset的时被自动调用,并且__unset的的参数是被unset的变量
__clone  克隆对象，如obj_b = clone obj_a的时候会执行obj_a对象的__clone方法
__autoload（已被spl_autoload_register函数替代）：自动加载类



 
//__set()方法用来设置私有属性 
public function __set($name,$value){ 
	$this->$name = $value; 
} 

//__get()方法用来获取私有属性 
public function __get($name){ 
	return $this->$name; 
} 

__get()方法：这个方法用来获取私有成员属性值的,有一个参数，参数传入你要获取的成员属性的名称，返回获取的属性值，这个方法不用我们手工的去调用，因为我们也可以把这个方法做成私有的方法，是在直接获取私有属性的时候对象自动调用的。因为私有属性已经被封装上了，是不能直接获取值的，但是如果你在类里面加上了这个方法，在使用“echo$p1->name”这样的语句直接获取值的时候就会自动调用__get($name)方法，将属性name传给参数$name，通过这个方法的内部执行，返回我们传入的私有属性的值。如果成员属性不封装成私有的，对象本身就不会去自动调用这个方法。



__set()方法：这个方法用来为私有成员属性设置值的，有两个参数，第一个参数为你要为设置值的属性名，第二个参数是要给属性设置的值，没有返回值。这个方法同样不用我们手工去调用，它也可以做成私有的，是在直接设置私有属性值的时候自动调用的，同样属性私有的已经被封装上了，如果没有__set()这个方法，是不允许的，比如：$this->name='zhangsan',这样会出错，但是如果你在类里面加上了__set($property_name, $value)这个方法，在直接给私有属性赋值的时候，就会自动调用它，把属性比如name传给$property_name,把要赋的值'zhangsan'传给$value，通过这个方法的执行，达到赋值的目的
比如$p1->name="张三"; 


<? echo count ('123'); ?>   输出结果是D
A) 3 
B) False 
C) Null 
D) 1 
E) 0
// 如果 var 不是数组类型将返回 1，如果是实现了 Countable 接口的对象则返回对象内的元素个数，有一个例外，如果 var 是 NULL 则结果是 0。
（实现countable的接口对象，可以重写count()函数）


65、What is the value of $a?  B
<?php 
	$a = in_array('01', array('1')) == var_dump('01' == 1); 
?> 
A) True 
B) False
//in_array()返回的结果是false(字符串01和字符串1不一样)而后者返回的结果(由于类型转换)是true



66、What is the value of $result in the following PHP code? 
<?php 
function timesTwo($int) { 
	$int = $int * 2; 
} 
$int = 2; 
$result = timesTwo($int); 
?>; 
//答案：null，因为并没有return值




67、The code below ____B____ because ____________. 
<?php 
class Foo { 
	?> 
	<?php 
	function bar() { 
		print “bar”; 
	} 
} 
?> 
A) will work, class definitions can be split up into multiple PHP blocks. 
B) will not work, class definitions must be in a single PHP block. 
C) will not work, class definitions must be in a single file but can be in multiple PHP blocks. 
D) will work, class definitions can be split up into multiple files and multiple 




zend optimizer是什么
一般情况下，执行使用ZO的php程序比不使用的要快40%到100%。这意味着网站的访问者可以更快的浏览网页，从而完成更多的事务，创造更好的客户满意度。更快的反应同时也意味着可以节省硬件投资，并增强网站所提供的服务。所以，使用ZO，就等于提高了网站的盈利能力。ZO能给php用户带来很多益处，特别是那些运营网站的人。快速运行php程序可以显著降低服务器的CpU负载，并可以减少一半的反应时间。
优化原理：在被最终执行之前，对那些由运行编译器产生的代码进行优化。




72、将字符09转换成十进制数字。
$a = '09';
//intval($a);
//或者$a + 0 转换（防溢出）
//(int) $a 强制转换


79、以下哪一个函数可以把浏览器转向到另一个页面？ (B)

A) redir()
这不是一个 PHP 函数，会引致执行错误。

B) header()
这个是正确答案，header() 用来插入卷头资料，可以用来使浏览器转向到另一个页面，例如：
header('Location: http://www.search-this.com/');

C) location()
这不是一个 PHP ，会引致执行错误。

D) redirect()
这不是一个 PHP 函数，会引致执行错误。（tp中有这个内置的函数）


$_SERVER各个值的含义


error_reporting(2047)什么作用？
答：PHP 显示所有错误 E_ALL


用PHP打印出前一天的时间格式是2013-11-26 12:11:11
答:echo date('Y-m-d H:i:s', strtotime('-1 days'));

打开php.ini中的Safe_mode，会影响哪些函数？至少说出6个。
答：
copy()	fopen()		header()  
highlight_file()
mkdir()     move_uploaded_file()
mysql_*
set_time_limit()
touch()





MySQL数据库，怎么优化？
表设计字段优化：对每个字段用合适的长度等
尽量用连接查询代替子查询
尽量用union联合查询代替用临时表查询
对经常查询的字段添加索引
频繁更新的表/需要支持事务用innodb引擎，经常查询的表用myisam引擎
sql语句的优化：比如limit分页时用新建索引表来加快查询



实现中文字串截取无乱码的方法。

/**
 * 中文截取无乱码
 * @param [int]	$start 跳过前多少个"字节"
 * @param [int] $length 要截取的"字节"数
 * return [string] 返回截取出的字符
 */
function Cutstr($string, $start=0, $length) {

    if(strlen($string) > $length){//字符串的长度大于要截取的长度时
        $str = '';
        $len = $start + $length;//截取的总长度是开始位置+要截取的字节长度
        
        for($i=$start; $i<$len; $i++){
            if(ord(substr($string, $i, 1))>0xa0){//判断截取字符串第一个字符是否是汉字 ord()函数取字符串的ASCII值 0xa0表示一个汉字的开始
                $str .= substr($string,$i,2);//由于汉字占两个字节，所以取两个字符
                $i++;
            }else{
                $str .= substr($string,$i,1);//不是汉字就取一个字符
            }
        }
        return $str;
    }else{
        return $string; //要截取的长度比总长度大时直接返回原字符串
    }
}



在HTTP 1.0中，状态码401的含义是(_);如果返回“找不到文件”的提示，则可用 header 函数，其语句为(__);
答:状态401代表未被授权,header("Location:xxx.php");


JS弹出对话框函数是?获得输入焦点函数是?
答:弹出对话框: alert(),prompt(),confirm() 获得输入焦点 onfocus()


$a = 'meizhi520.com'; 请取出$a的值并打印出第一个字母
答:echo $a{0} 或 echo substr($a,0,1)



http常见的状态码：
100 Continue
  初始的请求已经接受，客户应当继续发送请求的其余部分

200 OK
  一切正常，对GET和POST请求的应答文档跟在后面

202 Accepted
  已经接受请求，但处理尚未完成。

204 No Content
  没有新文档，浏览器应该继续显示原来的文档。如果用户定期地刷新页面，而Servlet可以确定用户文档足够新，这个状态代码是很有用的

300 Multiple Choices
  客户请求的文档可以在多个位置找到，这些位置已经在返回的文档内列出。如果服务器要提出优先选择，则应该在Location应答头指明。

301 Moved Permanently
  客户请求的文档在其他地方，新的URL在Location头中给出，浏览器应该自动地访问新的URL。

302 Found
  类似于301，但新的URL应该被视为临时性的替代，而不是永久性的。

303 See Other
  类似于301/302，不同之处在于，如果原来的请求是POST，Location头指定的重定向目标文档应该通过GET提取

304 Not Modified
  客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓冲的文档还可以继续使用。

305 Use Proxy
  客户请求的文档应该通过Location头所指明的代理服务器提取

307 Temporary Redirect
  和302（Found）相同。许多浏览器会错误地响应302应答进行重定向，即使原来的请求是 POST，即使它实际上只能在POST请求的应答是303时才能重定向。由于这个原因，HTTP 1.1新增了307，以便更加清除地区分几个状态代码： 当出现303应答时，浏览器可以跟随重定向的GET和POST请求；如果是307应答，则浏览器只能跟随对GET请求的重定向。

400 Bad Request
  请求出现语法错误。

401 Unauthorized
  客户试图未经授权访问受密码保护的页面。应答中会包含一个WWW-Authenticate头，浏览器据此显示用户名字/密码对话框，然后在填写合适的Authorization头后再次发出请求。

403 Forbidden
  资源不可用。

404 Not Found
  无法找到指定位置的资源


405 Method Not Allowed
  请求方法（GET、POST、HEAD、Delete、PUT、TRACE等）对指定的资源不适用。

406 Not Acceptable
  指定的资源已经找到，但它的MIME类型和客户在Accpet头中所指定的不兼容

407 Proxy Authentication Required
  类似于401，表示客户必须先经过代理服务器的授权。


410 Gone
  所请求的文档已经不再可用，而且服务器不知道应该重定向到哪一个地址。它和404的不同在于，返回407表示文档永久地离开了指定的位置，而404表示由于未知的原因文档不可用。


411 Length Required
  服务器不能处理请求，除非客户发送一个Content-Length头。

413 Request Entity Too Large
  目标文档的大小超过服务器当前愿意处理的大小。如果服务器认为自己能够稍后再处理该请求，则应该提供一个Retry-After头


414 Request URI Too Long
  URI太长

416 Requested Range Not Satisfiable
  服务器不能满足客户在请求中指定的Range头

500 Internal Server Error
  服务器遇到了意料不到的情况，不能完成客户的请求

502 Bad Gateway
  服务器作为网关或者代理时，为了完成请求访问下一个服务器，但该服务器返回了非法的应答

503 Service Unavailable
  服务器由于维护或者负载过重未能应答。

504 Gateway Timeout
  此状态码由作为代理或网关的服务器使用，表示不能及时地从远程服务器获得应答

505 HTTP Version Not Supported
  服务器不支持请求中所指明的HTTP版本


100-199 用于指定客户端应相应的某些动作。 
200-299 用于表示请求成功。 
300-399 用于已经移动的文件并且常被包含在定位头信息中指定新的地址信息。 
400-499 用于指出客户端的错误。 
500-599 用于支持服务器错误。


------------------------难点-----------------------------------------------  

