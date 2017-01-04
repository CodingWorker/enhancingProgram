#PHP基础语法 
###了解PHP   
BS与CS结构
- B/S结构即浏览器和服务器结构；
- Client/Server架构，即服务器/客户端架构。是大家熟知的软件系统体系结构，通过将任务合理分配到Client端和Server端，降低了系统的通讯开销，需要安装客户端才可进行管理操作。
###集成化服务器的安装   
3. 服务器请求流程（http请求流程） 
一次完整的HTTP请求所经历的7个步骤
HTTP通信机制是在一次完整的HTTP通信过程中，Web浏览器与Web服务器之间将完成下列7个步骤：
1). 建立TCP连接
在HTTP工作开始之前，Web浏览器首先要通过网络与Web服务器建立连接，该连接是通过TCP来完成的，该协议与IP协议共同构建Internet，即著名的TCP/IP协议族，因此Internet又被称作是TCP/IP网络。HTTP是比TCP更高层次的应用层协议，根据规则，只有低层协议建立之后才能进行更高层协议的连接，因此，首先要建立TCP连接，一般TCP连接的端口号是80。
2). Web浏览器向Web服务器发送请求命令 
一旦建立了TCP连接，Web浏览器就会向Web服务器发送请求命令。例如：GET/sample/hello.jsp HTTP/1.1。
3). Web浏览器发送请求头信息 
浏览器发送其请求命令之后，还要以头信息的形式向Web服务器发送一些别的信息，之后浏览器发送了一空白行来通知服务器，它已经结束了该头信息的发送。
4). Web服务器应答 
客户机向服务器发出请求后，服务器会客户机回送应答， HTTP/1.1 200 OK ，应答的第一部分是协议的版本号和应答状态码。
5). Web服务器发送应答头信息 
正如客户端会随同请求发送关于自身的信息一样，服务器也会随同应答向用户发送关于它自己的数据及被请求的文档。
6). Web服务器向浏览器发送数据 
Web服务器向浏览器发送头信息后，它会发送一个空白行来表示头信息的发送到此为结束，接着，它就以Content-Type应答头信息所描述的格式发送用户所请求的实际数据。
7). Web服务器关闭TCP连接 
一般情况下，一旦Web服务器向浏览器发送了请求数据，它就要关闭TCP连接，然后如果浏览器或者服务器在其头信息加入了这行代码：Connection:keep-alive

TCP连接在发送后将仍然保持打开状态，于是，浏览器可以继续通过相同的连接发送请求。保持连接节省了为每个请求建立新连接所需的时间，还节约了网络带宽。
 
5. 成功请求PHP脚本所有的流程 
如果请求的是/index.php，根据配置文件，WebServer知道这个不是静态文件，需要去找PHP解析器来处理，那么他会把这个请求简单处理后交给PHP解析器。
WebServer会依据CGI协议，将请求的Url、数据、Http Header等信息发送给PHP解析器，接下来PHP解析器会解析php.ini文件，初始化执行环境，然后处理请求，再以CGI规定的格式返回处理后的结果，退出进程。webserver再把结果返回给浏览器。整个处理过程如上图所示。

###PHP语法学习 
4. 程序中空白特点 
PHP解析器忽略程序中的空白行，就像没有空白一样

5. 程序中换行符的处理
```
\n和<br/>都可以，只是写法会有不同
echo "hafaf\n";
echo "afaf"."<br/>";
echo "afafafaf"; 
```
 
#变量与数据类型 

###变量与常量的声明与使用 
1.查看数据类型方法
```
echo gettype("afafafaf");
或者var_dump()
```
2.变量的传值赋值与传址赋值 
函数一般是传值赋值，对象传递的是引用
 
###数据类型    
1. 布尔型（boolean）  var_dump(is_boolean("afafafaf"));
2. 整型（integer） var_dump(is_integer("afafafaf"));
3. 浮点型（float） var_dump(is_float("afafafaf"));
4. 字符串（string） var_dump(is_string("afafafaf"));
5. 数组（array） 
6. 对象（object） 
7. 资源（resource） 
8. NULL 
9. PHP垃圾回收机制(Garbage Collector) 
8种数据类型与每种数据类型的判断(is_string,is_array,is_integer...)、检测(var_dump，gettype())、转换处理 (string)123,(int)"12"，

#运算符与流程控制   

###算术运算符 
 

#函数式编程   

###函数定义
 
函数检测 function_exists()
`var_dump(function_exists("a"));`

###函数参数    

6.参数默认值使用 function aa(a,b,c=2,d=3)有默认值的要放在后面

7.参数的引用传递  &操作符

9.递归算法原理 

###代码复用    

#时区  

2. 修改php.ini改变时区 
3. 通过PHP脚本修改时区  `date_timezone_set()`

4. 获得当前脚本时区

###时间处理

1.时间戳的概念 

4.获得微秒数 `microtime()`
5.字符串转为时间戳  `strtotime("2012-01-02");` 
 

#数学运算

向上与向下取整 floor  ceil

随机更换网站css样式表 rand(5,15)  array_rand(1,2,3,4)


#字符串操作   

###字符串定义 
3种

###字符串处理函数 
1.去除边界字符串 ltrim rtrim trim
2.计算英文和汉字字符串长度 
 
4.首字母转大写处理 ucfirst

6. 字符串数组转换处理  str_split  explode
7.截取部分字符串处理  substr
8.获取字符串位置操作  strpos
9.字符串检索替换操作  str_replace
10.url解析处理   parse_url   parse_str
11.字符串实体操作  htmlspecialchars  htmlentities  strip_tags htmlspecialchars_decode
12.自动转义处理  `magic_quotes_gpc`   
*13.实现检测是否是图片类型函数*    


#数组处理

###数组基础

5.GET&POST&REQUEST&GLOBALS&SERVER以超级全局变量使用

###数组遍历

2. 获得数组的键名与单元 list each
3. 数组指针的移动 each 

###数组操作函数 
1. 数组元素统计 count sizeof
2. 判断数组键与单元 
3. 数组元素的检索 in_array
4. 数组元素的过滤 array_filter  array_map array_walk
5. 数组单元应用函数  array_map array_walk

8. 数组的键名与键值操作 
9. 递归更改数组键名大小写  array_change_key_case


#正则表达式

###正则语法

###正则函数操作
1. 正则匹配操作函数  preg_match
2. 匹配所有结果集  preg_match_all
3. 正则匹配数组  
4. 通过正则拆分字符串  preg_split
5. 正则的替换拆操作  preg_replace_callback
*6. 回调函数实现正则  * 
7.书写邮箱与网站正则 
8.字符串中网址替换处理   


#文件操作

###目录CURD操作

获得磁盘总空间与可用空间  `disk_free_space()  disk_total_space()`

目录的读写检测 
获得文件主文件名与目录 basename  dirname
检测文件或目录是否存在  file_exists 
检测目录与创建目录  is_dir   mkdir
目录切换与删除操作  chdir  rmdir
目录与文件重命名  rename
遍历目录   $dir->read()  readdir()
复制文件操作   copy
递归创建多层目录函数   
递归删除目录函数  mkdir
目录移动函数  

###PHP操作文件

1. 判断文件的读写权限  id_readable   id_writeable  is_writable 
2. 获得文件大小   filesize()
3. 快速创建与获得文件内容  tmpfile   file_get_contents
*4. 打开远程文件 *
5. 获得文件修改时间  fileatime   filectime


#上传与下载

###文件上传

1. 前台表单上传设置 action enctype=multipart/form-data 
2. 表单设置上传大小  upload_max__filesize
3. php.ini配置项的上传设置 
4. 多文上传处理 
*5. 多种上传错误讲解 0 1 2 3 4 5 7 
7. 常见的文档mime类型 *
8. 判断合法上传文件  filesize  is_uploaded_file 
9. 移动上传文件  move_uploaded_file
10. 多文上传的表单设置  name[]

*###文件下载*
发送文档header头 
实现文件和图片也可以下载 
3. 设置下载窗口文件名 
4. 设置下载文件单位 
5. 设置下载文件大小 
6. 启动文件下载 


#面向对象(OOP)   

###基础知识

4. 对象句柄、属性、方法与对象生命周期 
5. 对象产生的步骤 
6. 对象内存的分布分析 
7. 对象的生命周期 
8. 面向对象的特性  通过本章的学习，学员要掌握什么是面向对象编程，为什么要使用面向对编程，以及面向对象编程的重要性与优越性。掌握PHP对象产生的流程，以及PHP的类与对象在内存中的分布形式。   4
对象关键字   public、private、protected 
模块设计原则 
3. static变量与static方法 
4. 对引用指针$this 
5. 本类的引用self:: 
6. 父类的引parent: 
7.构造与析构方法 
8. 抽象类与抽象方法 
9. 面向对象接口 
10.继承extends 
11.单例设计模式   这部分是对PHP面向对象基本语法学习，学员需要掌握每一个关键字的具体含义与使用方法，这样才可以顺利的进行后面的面向对象开发。  8
方法与常量   1. 构造方法__construct 
2. 析构方法__destruct() 
3. __CLASS__ 
4. __METHOD__ 
5. __FUNCTION__ 
6. __DIR__ 
7. __FILE__ 
8. __call() 
9. __isset() 
10. __get() 
11. __set() 
12.__autoload() 
13. get_class_methods() 
14. get_class_vars() 
15. call_user_func_array() 
16. get_object_vars() 
17. method_exists() 
18.通过__autoload实现自定义加载机制 
19.自定义__init构造方法    通过本章节的学习，老师结合具体实例讲解PHP面向对象众多的常量与魔术方法的使用。    8
命名空间    命名空间    1.命名空间定义 
2.字命名空间 
3.多命名空间 
4.多命名空间{}写法 
5.非限定名称 
6.限定名称 
7.完全限定名称 
8.__NAMESPACE__ 
9.namespace关键字 
10.别名导入 
11.全局空间 
12.解析优先级    掌握命名空间意义，熟练使用命名空间的多种声明方式，理解命名空间与系统目录联系，掌握通过命名空间解决命名冲突的方法。

#Ajax异步处理

###Ajax处理介绍
1. 异步请求 
2. Ajax使用场景 
3. XMLHttpRequest状态 
4. Ajax事件处理 
5. 打开与发送请求 
6.XHR请求状态码 
7. 发送Post数据 
8. Ajax接收数据 这部份学员清楚 Ajax是什么，什么时候使用Ajax。通过实例讲解让学生掌握Ajax的使用，以及创建属于自己的Ajax处理引擎 6
Jquery中使用Ajax   1.$.ajax使用 
2.序列化表单处理 
3.PHP返回不同类型处理 
4.异步许愿墙与留言板实现 
5.异步检测用户名是否存在   

#会话控制 

###Cookie


###Session



*#图像处理*


##基础部分

1. 检测GD库 
2. 设置header头信息 
3. 创建图像画布 
4. 设置图像颜色值 
5. 图像填充处理 
6 绘制各种图形元素 
7. 在画布上写入文字 
8. 释放图像资源 
9. 打开外部图像 
10. 获得图像尺寸、颜色、通道信息 
11. 图像的复制操作 
12. 支持ttf字体的图像处理    网站视图显示是由图像与文构成的，图像处理是在网站开发中，经常使用到的功能。通过本章的学习，学员可以通过PHP程序进行任意的图像处理，应对以后工作中任何图像处理问题。  2
实例开发    1. 验证码类的开发 
2. 图像水印处理类开发 
3. 图片缩略图处理类开发   本章节通过OOP思想开发各种图像处理类，使学生更加深刻的领会OOP面向对象编程的好处，同时通过实例让学员知道，图像处理在实际工作中的使用场景。

*#Smarty模板引擎 *

###基础部分

1. 模板引擎工作原理 
2. Smarty的特点 
3. Smarty模板引擎配置 
4. Smarty分配变量 
5. Smarty显示模板视图 
6. 变量调节器 
7. literal解决与Js冲突 
8. if条件函数 
9. foreach循环标签 
10. section循环标签 
11. include包含模板 Smarty是公认的高效模引擎。当然我们在开发中大部分使用PHP框架产品，很多框架产品都有模板引擎，而且可以很好的与框架相结合。也就是说，对有模板引擎的框架产品来说，Smarty并没有优势，但对于没有模板引擎的框架产品或其他开源项目来说，学习Smarty还是很有必要的，而且学员可以更深刻 的掌握模板引擎的工作原理，对PHP技能的提高，很有帮助。   10
Smarty扩展提高  1. 自定义变量调节器 
2. 自定义行标签(函数) 
3. 自定义块标签 
4. Smarty缓存处理 
5. Smarty局部缓存处理 
6.自定义加载css,js函数 
7.自定义文章块标签 
8.如何把smarty融入到自己产品中去    Smarty提供了非常多的变量调节器，函数，块标签，但是在不同场景下并不能满足开发中的所有需求，所以本章是Smarty扩展部分，主要讲解变量调节器、函数、标签、缓存处理等Smarty高级功能。   



