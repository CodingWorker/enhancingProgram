//////////////////////////////////////////////////////////////////////////
///////////////////            PHP面试整理             ///////////////////
/////////////////////////////////////////////////////////////////////////
1、echo print print_r的区别
echo 是PHP语句，没有返回值；print 和print_r是函数，有返回值,布尔值；
echo 和 print仅能打印出简单类型的变量，如Int string
print_r可以打印复杂的变量，如数组和对象;打印对象时仅能打印出属性

2、对于大流量的访问，您采用什么方式解决访问流量的问题
方法：
    PHP缓存
    生成HTML静态页面
    使用主辅数据库，把数据库的读写分开
    使用负载均衡器和多台服务器

    缓存-> 数据库读写分离->生成静态页面->负载均衡->消息队列等等措施


3、用PHP写出显示客户端IP和服务器IP
客户端IP：$_SERVER["REMOTE_ADDR"]
服务器IP：$_SERVER["SERVER_ADDR"]

4、语句include和require的区别，为避免多次包含同一文件，可以使用什么语句替代？
include 和require都是语言结构，不是函数，但有返回值
区别是如果包含文件不存在，include会产生警告，后面的程序可以继续执行；而require则产生致命的错误，终止执行脚本

可以使用include_once 或require_once来替换，他会检测文件是否已被包含

5、如何修改session的生存时间
方法：
    php.ini中修改session的垃圾处理机制时间：session.gc_maxlifetime 
    设置session的cookie的有效时间

6、PHP中error_reporting函数作用
动态的设置错误报告的级别，php.ini中有一个对应的变量error_reporrting也可以设报告级别

7、 检测变量是否存在或是否有值的函数：
是否存在：isset()存在返回真
是否为空:empty() 为空返回真
如果var是非空或非零的值，则empty()返回 FALSE 。换句话说，""、0、"0"、 NULL 、 FALSE 、array(); 以及没有任何属性的对象都将被认为是空的，
如果 var  为空，则返回 TRUE 。

8、public protected private的区别
public:公有，外部对象可以访问，可以继承
protected：受保护的，外部不可以访问，可以被继承
private：私有，只能在自身类的内部被访问

9、js表单弹出对话框函数，获得输入焦点函数
alert() prompt() conform()
focus()

10、session禁用后还能获得session吗?
可以，通过url获得，设置session.use_trans_sid使得sid透明（即在客户端不可见），从而以get方式传递，安全性差

11、POST和get传输的最大容量分别是多少
post可以在php.ini中设置 post_max_size;
get一般大小受到url长度的限制，该长度一般为2048字节（一个字母占一个字节，汉子一般占两个字节）

12、PHP是什么
PHP全称：Hypertext Preprocessor（超文本预处理程序），是一种用来开发动态网站的服务器脚本语言。

13、什么是MVC
3层分离机制，即模型层、视图层和控制器层分离
M代表模型层，用来与数据库交互数据信息
V代表视图层，用来将html和数据输出到客户端浏览器
C代表控制器层，用来连接模型层和视图层，控制、读取和分配视图中的数据

14、在页面中引用css方式有几种：
3种，内联，内部和外部

15、PHP中的错误类型有哪些
PHP错误类型有三类：
    1、提示：这都是一些正常的信息，而非重大的错误，有些甚至不会展示给用户
    2、警告：这是有点严重的错误，会将警告框显示给用户，但不会影响代码的输出
    3、错误：这是严重的错误，会终止脚本的运行

16、如何不使用submit按钮提交表单
使用超链接等，加入js表单提交事件

17、写出字符串0，分别在PHP和js中转换为布尔类型，值是true还是false
```php 
<?php
$int=0;
$bool=(bool)$int;
var_dump($bool);//是false
?>

js
<script type="text/javascript">
    var a="0";
    var bool=!!a;
    alert(bool);//是true
</script>
```

18、cookie session的 联系和区别
cookie存储在客户端，session存储在服务器端，一般session要借助于cookie存储sessionid；cookie的存储容量有限制（受客户端浏览器设置的影响），而session的容量不受限制

19、session实现多台服务器共享
方法： 
    1、存入到mysql服务器
    2、存储到nfs服务器
    3、存储到硬件设备

20、$_GET["int"]整数   $_GET["float"] 
    浮点 $_GET["text"]文本,不需要显示html  
    $_GET["content"] 文本,需要显示到html
以上数据改用什么方法过滤安全？数据入库之前需要做什么处理？
对于          处理             描述
$_GET["int"]  使用intval函数   将对应项转换为整数
$_GET["float"] 使用float强制转换 (float)$_GET["float"] 转换为浮点型，或者使用floatval函数
$_GET["text"]  先使用htmlspecialchars()将html标签转换为实体，再addslashes()函数转义特殊字符，然后入库
$_GET["content"]  先使用htmlspecialchars()将html标签转换为实体，再addslashes()函数转义特殊字符，然后入库
                  出库时，使用stripslashes()函数去掉转义符号即可，还原原始数据样貌，这时的html实体也可以在网站上正常显示hmtl标签字符串
其他函数参考手册
未完！！！！！！！

21、正则表达式中字符的含义
[^]  ?=前瞻积极断言    ?!前瞻消极断言  ?<=后瞻积极断言   ?<！后瞻消极断言
?:子组缓存中不包含该子组

22、面向对象中，self与$this的区别是什么？
this是指向当前对象的指针，self是指向当前类的指针，parent是指向当前类的父类的指针

23、写出多进程并发同时，读写同一文件时能保证文件内容完整的代码
文件独占   文件加锁
```if(flock($file,LOCK_EX)){
    fwrite($file,"write more words");
    flock($file,LOCK_UN);
}else{
    //文件不能加锁的代码
}
fclose($file);
这是有问题的，更多内容参见csdn博客
```

24、以下输出
```
$father="mother";
$mother="son";
echo $$father;// son
```
25、var_dump()没有返回值

26、以下输出
```
$A="Hello"; 
function print_A() {  
    $A= "php mysql !!";
    global $A;
    echo $A;
}
print_A();// php mysql!!
echo $A;

```
mysql_numm_fields：取得结果集中字段数目，推荐mysqli相应的扩展
strcmp() strcmp() 函数比较两个字符串。
注释：strcmp() 函数是二进制安全的，且对大小写敏感。
不能使用final标识成员属性，final仅能标识方法和类
抽象类中不是必须有抽象方法，但有抽象方法则类必须要有抽象类。
获得实例化对象所属类名字的函数get_class()
使用mysqli对象中的affected_rows属性，对哪个操作没有影响？select
preg_match的返回值：0或1，因为他匹配到一此即停止搜索，发生错误放回false
```
<?php 
    $x=array("aaa","ttt","www","ttt","yyy","tttt"); 
    $y=array_count_values($x); 
    echo $y["ttt"]; 
?>
```
下列哪一个方法用于二进制比较String（不区分大小写） ？strcasecmp
"{$str1}{$str2}"合并字符串

```
<? php
    $x="display"; 
    ${$x.'_result'} (); 
?> 
以上代码将会调用display_result()

```
关于mysql_pconnect说法正确的是?创建持久链接




写一个遍历目录下所有文件和子目录的函数
```
function get_all_dirs_files($dir){
    $files=array();
    if(file_exists($dir)){
        return false;
    }elseif(is_dir($dir)){
        return false;
    }else{
        $dir=open($dir);
        while($filename=readdir($dir)){
            if($filename=="." || $filename==".."){
                continue;
            }elseif(is_file($filename)){
                $files[]=$dir."/".$filename;
            }else{
                get_all_dirs_files($filename);
            }
        }
    }
    return $files;
}
```

简述json和jsonp的区别

11、抓取远程图片到本地，所用的函数
方法：
    ????socket
    curl
PHP中获取图像尺寸大小的方法是什么？

如何用PHP和MySQL上传视频？
18、简述一下优化Mysql用到地方法以及用到的工具和命令


?????/2、MySql获取当前时间的函数和格式化日期函数
获取当前时间函数：now()
格式化时间：date_format()

mysql_fetch_row 和 mysql_fecth_array 

```
<?php
    $link1 =mysql_connect("localhost","root","");
    $link2 = mysql_connect("localhost","root","");
    mysql_close();// 就近原则，关闭$link2
?>
```

```
获得实例化对象所属类名字的函数是：get_class()
```

```
getdate()返回时间戳的数组信息，共11个元素，包括年，月，日，时 分秒...
```

```
 function total_Sum($c=5, $b=3,$a){ //缺省参数要放在可变参数之后
             echo$a."+ ".$b." + ".$c." = ".($a+$b+$c) ;
}
total_Sum(1);
正确的应为：
function total_Sum($a,$c=5, $b=3){
             echo$a."+ ".$b." + ".$c." = ".($a+$b+$c) ;
}
total_Sum(1);

```

```数据库中的事务是什么
事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，
事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。
```


```foo()和@foo()之间有什么区别
@foo()抑制错误输出
```


如何实现字符串翻转?  
1、注意这里是字符而非字节，要考虑多字节，可以使用mb_substr函数
2、可以一个个的截取到数组，数组翻转输出字符串
3、直接一个个的输出组成字符串


使用五种以上方式获取一个文件的扩展名
1\截取字符串 substr strpos  basename
2\strrchr($str,".")
3\explode($file) 取最后一个 $arr(count($arr)-1);
4\strrchr(basename($str),".")
5\pathnfo($filename)["extension"]
6\end(explode($filename,"."))

将1234567890转换成1,234,567,890
1\除以3取余数
2\从字符串头截取该余数个字符串
3、剩下的每三个分割
4、将两部分字符串连接在一起
```
function get_sci_num($str){
    $str=(string)$str;
    $len=strlen($str);
    $n=$len/3;
    if($n<=1){
        return $str;
    }
    return substr($str,0,$n).",".substr(chunk_split(substr($str,$n),3,","),0,-1);
}
或者使用自带函数：
number_format
```

用PHP打印出前一天的时间格式
```
echo date("Y-n-d",strtotime("-1 days"));
echo date("Y-m-d",time()-3600*24);
```

isset检测：只要不是空的和未初始化(未赋值)的就为真

$a="hello";
$b=&$a;
$b="world";
echo $a;//输出hello,若更改b的值则a也跟着改
关键点:
$a = &$b;
既不是a 指向 b,
也不是b 指向 a,
而是a,b共同指向一个地址.
```所以,a,b一改则全改.
但unset某一个变量,并不影响对方.
```
