例外是处于条件语句中间时，此时PHP解释器会根据条件判断来决定哪些输出，哪些跳过。

<?php ?> 和 <script language="php"> </script> 总是可用

另外的需要php.ini配置  <?php= ?>  

settype($a,"array")//true
is_integer is_array   is_null  is_bool  is_float  is_string

GET  长度：IE2048左右 其他7500左右

`error_reporting(E_ALL)`;显示所有的错误

###魔术常量
    __LINE__//返回当前代码在文件中的行数
    __FILE__//返回当前脚本的文件地址
    __DIR__//返回当前脚本的目录
    __FUNCTION__
    __CLASS__
    __TRAIT__
    __METHOD__
    __NAMESPACE__

两个浮点数不应该被比较,会因为误差导致错误

位运算符|不会发生短路，会计算所有的表达式

对数组操作，+ 和array_merge作用基本相同，只是在单元同名时一个保留前面的一个保留后面的

instanceof用于确定一个变量是否属于某一类class的实例
var_dump($a instanceof MyClass);//判断是否属于某一类的实例

endwhile  endif  endswitch  endfor  endforeach

foreach($arr as $key => &$value) foreach 就是提供遍历数组，只有引用传递时才会改变数组的值

<?php 
$a=array(1,2,3);
while(list($k,$v)=each($a)):
	echo $k."=>".$v."<br/>";
endwhile;
 ?>

goto break continue

switch松散比较

按值传递，除非设置allow_call_time_pass_reference此方法以不在被支持

对象！=实例； 对象是对实例的引用，通过克隆clone的方法可以给已经创建对象的实例建立一个新的实例
也可以理解成对象名是一个标识符，标识一个对象
const

范围解析操作符`::`,可以用来访问静态变量和类常量

preg_quote,就是加上相应的反斜线

断言：?= ?!     ?<=  ?<!   \b   \A  \Z  \z     ^ $  
例子：(?<=\d{3})(?<！999)foo
 
模式操作符也可以这样用在子组中：/ab(a(?i)b|c)c/

条件子组：(?(condition)yes-pattern|no-pattern)

(?# 注释内容)

preg_filter($pattern,$replace,$subject)

preg_grep($pattern,$subject)

preg_match($pattern,$subject,$arr)

preg_replace_callback

preg_split($pattern,$subject)

cookie会编码进请求头发送到服务器，服务器解码并存入$_COOKIE

$_REQUEST

setcookie(名字，值，时间，路径，域名，secure,httponly)

session的一些配置及函数调用这些配置
			session.cookies_lifetime 
            session.cookie_path
            session.cookie_domain 
            session.cookie_secure 
            session.cookie_httponly 

session.use_trans_sid

session文件有文件锁性质

session使用完要及时关掉

???????????????#传递SESSION-ID
两种方法：

sesson生命周期：
open-read-write-close[-destroy-gc]

session_cache_limiter()

setcookie("PHPSESSID")------session_destory

session_name session_id 设置新的之后，生成新的对应文件或值，文件为空的

session_regenerate_id()保存了session的信息，在session_start后执行

session_save_handler()，设置用户自定义的处理session函数之前要先设置session_module_name()为user

session_status

2. chgrp — 改变文件所属的组
3. chmod — 改变文件模式
4. chown — 改变文件的所有者
5. clearstatcache — 清除文件状态缓存

16. fgetcsv — 从文件指针中读入一行并解析 CSV 字段

fgets-----fgetss


file_put_contents-------file_get_contents     stream_get_contents

fileatime filemtime filectime fileinode filegroup fileowner fileperms  touch  umask

fnmatch

fopen($filenamne,"xb") 文件存在返回false并产生错误,不存在则创建

fpassthru

ftell

ftruncate

glob

is_link  lchgrp  lchown  link  linkinfo  lstat   readlink 

popen pclose  

tempnam  tmpfile get_temp_dir



MIME类型


上传文件$_FILES数组存储的为：
name:客户端机器上文件原名称
type:上传文件MIME类型，这个只是通过文件名称后缀判断的，并不能代表文件的真实类型
tmp_name：上传的文件在服务器端保存的临时地址
error：上传产生的差错代码（0 1 2 3 4 6 7）
size:已上传文件的大小，字节

文件上传常见配置项：
		max_file_size
		upload_max_filesize
		memory_limit
		max_execution_time
		max_input_time
		post_max_size
文件上传：单个文件 多个文件 多个同名文件

|--------------------------------------------------------
|
|				数组函数
|-------------------------------------------------------|

1. array_change_key_case — 返回字符串键名全为小写或大写的数组
2. array_chunk — 将一个数组分割成多个
3. array_column — 返回数组中指定的一列
4. array_combine — 创建一个数组，用一个数组的值作为其键名，另一个数组的值作为其值
5. array_count_values — 统计数组中所有的值出现的次数
				求差集：三类,都不区分顺序
				1、仅比较键 key
				2、仅比较值 diff
				3、同时比较键和值 assoc
6. array_diff_assoc — 带索引检查计算数组的差集
7. array_diff_key — 使用键名比较计算数组的差集
8. array_diff_uassoc — 用用户提供的回调函数做索引检查来计算数组的差集
9. array_diff_ukey — 用回调函数对键名比较计算数组的差集
10. array_diff — 计算数组的差集,仅比较键值
11. array_fill_keys — 使用指定的键和值填充数组
12. array_fill — 通过指定的索引顺序及个数和值生成数组,填充位置
13. array_filter — 用回调函数过滤数组中的单元
14. array_flip — 交换数组中的键和值
15. array_intersect_assoc — 带索引检查计算数组的交集
16. array_intersect_key — 使用键名比较计算数组的交集
17. array_intersect_uassoc — 带索引检查计算数组的交集，用回调函数比较索引
18. array_intersect_ukey — 用回调函数比较键名来计算数组的交集
19. array_intersect — 计算数组的交集
20. array_key_exists — 检查给定的键名或索引是否存在于数组中
21. array_keys — 返回数组中所有的键名
22. array_map — 将回调函数作用到给定数组的单元上
23. array_merge_recursive — 递归地合并一个或多个数组
24. array_merge — 合并一个或多个数组
25. array_multisort — 对多个数组或多维数组进行排序
26. array_pad — 用值将数组填补到指定长度，填充长度
27. array_pop — 将数组最后一个单元弹出（出栈）
28. array_product — 计算数组中所有值的乘积
29. array_push — 将一个或多个单元压入数组的末尾（入栈）
30. array_rand — 从数组中随机取出一个或多个单元
31. array_reduce — 用回调函数迭代地将数组简化为单一的值
32. array_replace_recursive — 使用传递的数组递归替换第一个数组的元素
33. array_replace — 使用传递的数组替换第一个数组的元素
34. array_reverse — 返回一个单元顺序相反的数组
35. array_search — 在数组中搜索给定的值，如果成功则返回相应的键名
36. array_shift — 将数组开头的单元移出数组
37. array_slice — 从数组中取出一段
38. array_splice — 把数组中的一部分去掉并用其它值取代
39. array_sum — 计算数组中所有值的和
40. array_udiff_assoc — 带索引检查计算数组的差集，用回调函数比较数据
41. array_udiff_uassoc — 带索引检查计算数组的差集，用回调函数比较数据和索引
42. array_udiff — 用回调函数比较数据来计算数组的差集
43. array_uintersect_assoc — 带索引检查计算数组的交集，用回调函数比较数据
44. array_uintersect_uassoc — 带索引检查计算数组的交集，用回调函数比较数据和索引
45. array_uintersect — 计算数组的交集，用回调函数比较数据
46. array_unique — 移除数组中重复的值
47. array_unshift — 在数组开头插入一个或多个单元
48. array_values — 返回数组中所有的值
49. array_walk_recursive — 对数组中的每个成员递归地应用用户函数
50. array_walk — 对数组中的每个成员应用用户函数
51. array — 新建一个数组
52. arsort — 对数组进行逆向排序并保持索引关系
53. asort — 对数组进行排序并保持索引关系
54. compact — 建立一个数组，包括变量名和它们的值
55. count — 计算数组中的单元数目或对象中的属性个数
56. current — 返回数组中的当前单元
57. each — 返回数组中当前的键／值对并将数组指针向前移动一步
58. end — 将数组的内部指针指向最后一个单元
59. extract — 从数组中将变量导入到当前的符号表
60. in_array — 检查数组中是否存在某个值
61. key_exists — 别名 array_key_exists
62. key — 从关联数组中取得键名
63. krsort — 对数组按照键名逆向排序
64. ksort — 对数组按照键名排序
65. list — 把数组中的值赋给一些变量
66. natcasesort — 用“自然排序”算法对数组进行不区分大小写字母的排序
67. natsort — 用“自然排序”算法对数组排序
68. next — 将数组中的内部指针向前移动一位
69. pos — current 的别名
70. prev — 将数组的内部指针倒回一位
71. range — 建立一个包含指定范围单元的数组
72. reset — 将数组的内部指针指向第一个单元
73. rsort — 对数组逆向排序
74. shuffle — 将数组打乱
75. sizeof — count 的别名
76. sort — 对数组排序
77. uasort — 使用用户自定义的比较函数对数组中的值进行排序并保持索引关联
78. uksort — 使用用户自定义的比较函数对数组中的键名进行排序
79. usort — 使用用户自定义的比较函数对数组中的值进行排序


next prev end reset each 数组指针移动

用户自定义函数排序 求交集 求差集

|================================
|    	文件夹操作
|===============================

类dir()
1. chdir — 改变目录
2. chroot — 改变根目录
3. closedir — 关闭目录句柄
4. dir — 返回一个 Directory 类实例
5. getcwd — 取得当前工作目录
6. opendir — 打开目录句柄
7. readdir — 从目录句柄中读取条目
8. rewinddir — 倒回目录句柄
9. scandir — 列出指定路径中的文件和目录

|===================================================
|
|			字符串操作函数
|
|==================================================

1. addcslashes — 以 C 语言风格使用反斜线转义字符串中的字符
2. addslashes — 使用反斜线引用字符串
3. bin2hex — 将二进制数据转换成十六进制表示
4. chop — rtrim 的别名
5. chr — 返回指定的字符
6. chunk_split — 将字符串分割成小块
7. convert_cyr_string — 将字符由一种 Cyrillic 字符转换成另一种
8. convert_uudecode — 解码一个 uuencode 编码的字符串
9. convert_uuencode — 使用 uuencode 编码一个字符串
10. count_chars — 返回字符串所用字符的信息
11. crc32 — 计算一个字符串的 crc32 多项式
12. crypt — 单向字符串散列
13. echo — 输出一个或多个字符串
14. explode — 使用一个字符串分割另一个字符串
15. fprintf — 将格式化后的字符串写入到流
16. get_html_translation_table — 返回使用 htmlspecialchars 和 htmlentities 后的转换表
17. hebrev — 将逻辑顺序希伯来文（logical-Hebrew）转换为视觉顺序希伯来文（visual-Hebrew）
18. hebrevc — 将逻辑顺序希伯来文（logical-Hebrew）转换为视觉顺序希伯来文（visual-Hebrew），并且转换换行符
19. hex2bin — 转换十六进制字符串为二进制字符串
20. html_entity_decode — Convert all HTML entities to their applicable characters
21. htmlentities — Convert all applicable characters to HTML entities
22. htmlspecialchars_decode — 将特殊的 HTML 实体转换回普通字符
23. htmlspecialchars — Convert special characters to HTML entities
24. implode — 将一个一维数组的值转化为字符串
25. join — 别名 implode
26. lcfirst — 使一个字符串的第一个字符小写
27. levenshtein — 计算两个字符串之间的编辑距离
28. localeconv — Get numeric formatting information
29. ltrim — 删除字符串开头的空白字符（或其他字符）
30. md5_file — 计算指定文件的 MD5 散列值
31. md5 — 计算字符串的 MD5 散列值
32. metaphone — Calculate the metaphone key of a string
33. money_format — Formats a number as a currency string
34. nl_langinfo — Query language and locale information
35. nl2br — 在字符串所有新行之前插入 HTML 换行标记
36. number_format — 以千位分隔符方式格式化一个数字
37. ord — 返回字符的 ASCII 码值
38. parse_str — 将字符串解析成多个变量
39. print — 输出字符串
40. printf — 输出格式化字符串
41. quoted_printable_decode — Convert a quoted-printable string to an 8 bit string
42. quoted_printable_encode — Convert a 8 bit string to a quoted-printable string
43. quotemeta — Quote meta characters
44. rtrim — 删除字符串末端的空白字符（或者其他字符）
45. setlocale — Set locale information
46. sha1_file — 计算文件的 sha1 散列值
47. sha1 — 计算字符串的 sha1 散列值
48. similar_text — 计算两个字符串的相似度
49. soundex — Calculate the soundex key of a string
50. sprintf — Return a formatted string
51. sscanf — 根据指定格式解析输入的字符
52. str_getcsv — 解析 CSV 字符串为一个数组
53. str_ireplace — str_replace 的忽略大小写版本
54. str_pad — 使用另一个字符串填充字符串为指定长度
55. str_repeat — 重复一个字符串
56. str_replace — 子字符串替换
57. str_rot13 — 对字符串执行 ROT13 转换
58. str_shuffle — 随机打乱一个字符串
59. str_split — 将字符串转换为数组
60. str_word_count — 返回字符串中单词的使用情况
61. strcasecmp — 二进制安全比较字符串（不区分大小写）
62. strchr — 别名 strstr
63. strcmp — 二进制安全字符串比较
64. strcoll — 基于区域设置的字符串比较
65. strcspn — 获取不匹配遮罩的起始子字符串的长度
66. strip_tags — 从字符串中去除 HTML 和 PHP 标记
67. stripcslashes — 反引用一个使用 addcslashes 转义的字符串
68. stripos — 查找字符串首次出现的位置（不区分大小写）
69. stripslashes — 反引用一个引用字符串
70. stristr — strstr 函数的忽略大小写版本
71. strlen — 获取字符串长度
72. strnatcasecmp — 使用“自然顺序”算法比较字符串（不区分大小写）
73. strnatcmp — 使用自然排序算法比较字符串
74. strncasecmp — 二进制安全比较字符串开头的若干个字符（不区分大小写）
75. strncmp — 二进制安全比较字符串开头的若干个字符
76. strpbrk — 在字符串中查找一组字符的任何一个字符
77. strpos — 查找字符串首次出现的位置
78. strrchr — 查找指定字符在字符串中的最后一次出现
79. strrev — 反转字符串
80. strripos — 计算指定字符串在目标字符串中最后一次出现的位置（不区分大小写）
81. strrpos — 计算指定字符串在目标字符串中最后一次出现的位置
82. strspn — 计算字符串中全部字符都存在于指定字符集合中的第一段子串的长度。
83. strstr — 查找字符串的首次出现
84. strtok — 标记分割字符串
85. strtolower — 将字符串转化为小写
86. strtoupper — 将字符串转化为大写
87. strtr — 转换指定字符
88. substr_compare — 二进制安全比较字符串（从偏移位置比较指定长度）
89. substr_count — 计算字串出现的次数
90. substr_replace — 替换字符串的子串
91. substr — 返回字符串的子串
92. trim — 去除字符串首尾处的空白字符（或者其他字符）
93. ucfirst — 将字符串的首字母转换为大写
94. ucwords — 将字符串中每个单词的首字母转换为大写
95. vfprintf — 将格式化字符串写入流
96. vprintf — 输出格式化字符串
97. vsprintf — 返回格式化字符串
98. wordwrap — 打断字符串为指定数量的字串



二/面向对象编程的特性：封装/继承/多态
    a)把一类对象的共同属性和方法抽象出来，形成类，--抽象
    b)封装：隐藏属性和方法,尽可能的对成员进行封装
	c)继承：关键字extends
	d)多态：不是很明显，子类继承父类的方法，通过多个子类的方法的重写实现多态（即同样的方法实现不同的状态）



|=================================================
|            msyqli扩展
|=================================================

通过mysqli类库操作数据库的步骤：
1、建立到mysql的链接
2、打开指定的数据库
3、设置默认客户端的字符集（统一设置为urf8）
4、执行sql语句
5、释放结果集$result->   close   free  free_result()
6、关闭链接吗$mysqli->close()



|======================================
|        mysql
|=====================================

create database 数据库名 [charset 字符集]

Mysql中,表/列可以改名,database不能改名.

rename table oldname to newname

engine myisam charset utf8;

Truncate和delete是有区别的,

清空表数据: truncate 表名

如何破解数据库的密码:
    关闭数据库服务器，以跳过验证参数-skip-gtrant-tables启动；然后使用客户端免密码登录；修改mysql库的user表的root@%的密码即可，然后关闭数据库服务器重新启动重新登录。

mysql三大列类型：数值型 字符串型 日期时间类型

tinyint 0-255
smallint 0-65535
mediumint 0-1677万
int  42亿

一个字节8个位

整型要想到unsigned

create table hb(
id int(5) unsigned zerofill not null auto_increment,
hname varchar(20) not null default '',
primary key(id)
) engine myisam charset utf8;

int(M)-M一定要和zerofill一起用才起显示补0作用，否则是空格补全，但利用空间减少还是起作用的

Float(M,D),decimal(M,D)

Char(M)  , M 代表宽度, 0<=M<=255之间

Varchar(M), M代表宽度, 0<=M<=65535

(char型,如果不够M个字符,内部用空格补齐,取出时再把右侧空格删掉)  
注:这意味着,如果右侧本身有空格,将会丢失.

char(M),varchar(M)限制的是字符,不是字节，有多少字就多少字符，有多少字母就多少字符，这里不分中文和英文

YEAR类型 1970-1969

date类型 2010-01-22

time类型 839:12:112

datetime 时期时间  1998-12-31 13:56:23

timestamp类型unix时间戳

频繁用到的信息,优先考虑效率,存储到一张表中.
不常用的信息和比较占据空间的信息,优先考虑空间占用,存储到辅表中.

Alter table 表名 add 列名称 列类型 列参数;  [加的列在表的最后]

Alter table 表名 add 列名称 列类型 列参数 after 某列 [把新列加在某列后]

lter table 表名 add 列名称 列类型 列参数 first [把新列加在最前面]

Alter table 表名  drop 列名

change可以改变旧的列名而modify则不能修改。
Alter table 表名 modify 列名 新类型  新参数

Alter table 表名 change 旧列名 新列名 新类型 新参数

列就是变量,在每一行上,列的值都在变化.(就将列的表头看做变量名，将列数据看做值，where比较这个值)
Where条件是表达式,在哪一行上表达式为真,
哪一行就取出来

Having:可以对结果集（包含有别名）再进行筛选（用法与where作用于原表字段相同）
Where 表达式中的变量（字段）只能是表中原有的字段名或其表达式
Having既可以操作原表数据，又可以操作选择出的结果集列别名

select count(*) from 表名, 查询的就是绝对的行数,哪怕某一行所有字段全为NULL,也计算在内.
而select count(列名) from 表名,
查询的是该列不为null的所有行的行数.

Having既可以操作原表数据，又可以操作选择出的结果集列别名,及having可以替代where

排序只是对结果进一步的整理，因此要放在结果集出现之后
排序的语法:
Order by 结果集中的列名 desc/asc

书写顺序：Where group having order limit

子查询：where型（=和in和like三种） from型 exists型

A left join B on 条件 left C on 条件…可多重左连接

如果Union后的结果有重复(即某2行,或N行,所有的列,值都一样),怎么办?
答:这种情况是比较常见的,默认会去重.

问:如果不想去重怎么办?
答: union all

Select user();
Select database();
Select version();

视图的修改
Alter view 视图名 as select xxxxxx

删除视图：
drop view 视图名

创建视图：
create  view 视图名 as select XXX

Order by 和limit得到的表与原不再是一一对应的，因此使用这两个函数创建的视图不能改变数据

视图的algorithm
Algorithm = merge/ temptable/ undefined

Ansi代表本地字符集

UTF-8是一个变长的编码，1-6个字节长度

1:告诉服务器,我给你发送的数据是什么编码的? character_set_client
2:告诉转换器,转换成什么编码? Character_set_connection
3:查询的结果用什么编码? Character_set_results 

create trigger t1
before insert on ord
for each row
begin
declare
rnum int;
select num into rnum from goods_num where gid=new.gid;
if new.much>rnum then
	set new.much=rnum;
end if;
update goods_num set num=num-new.much where gid=new.gid;
end$

存储过程: procedure
Create procedure name()
Begin
//sql代码
End

rename table oldname to newname

语法:set 变量名:=表达式/字面值
create procedure p3()
begin
declare age tinyint default 18;
declare height tinyint default 180;
set age:=age+20;
select concat("年龄是：",age,"身高是：",height);
end$


grant all on *.* to zhangsan@"localhost" identified by "111";

Revoke all on *.* from zhangsan@”localhost”;

任何时候在对权限更改后要记得flush privileges

Grant all on gyshop.* to zhangsan@”lcoalhost”;(已经有密码就不用设了)

Revoke all on test.* from zhangsan@”localhost”;

grant create,drop,insert,update,select on gyshop.goods to zhangsan@”localhost”;

|================================
#        Ajax
|=================================

实例化对象：
    var xmlHttp=false;
    try{
        xmlHttp=new XMLHttpRequest();
    }catch(e){
        try{
            xmlHttp=new ActiveObject("Msxml2.XMLHTTP");
        }catch(e2){
            xmlHttp=new ActiveObject("Microsoft.XMLHTTP")    
        }
    }

奇迹关键:XMLHttpRequest对象，属于javascript
将要用到该对象的很少的属性和方法：
1、open()建立到服务器的新请求
2、send()向服务器发送请求
3、abort()退出当前请求
4、readyState属性，提供当前HTML的就绪状态
5、responseText属性，服务器返回的请求响应文本


			var xhr=getxhr();
			function callserver(){
				var city=document.getElementById("city").value;
				var state=document.getElementById('state').value;
				if(city==null || city=="") return;
				if(state==null || state=="") return;
				var url="test.php?city="+escape(city)+"&state="+escape(state);
				xhr.open("GET",url,true);//设置为true为异步请求
				xhr.onreadystatechange=statechange;
				xhr.send(null);	

			}
			//处理函数
			function statechange(){
			    if(xhr.readyState==4 || xhr.readyState=="complete"){
			   	 	var response=xhr.responseText;
			   	 	document.getElementById("zipCode").value=response;
			    }
			}
			//获取xhr对象
			function getxhr(){
				var xhr=false;
				try{
					xhr=new XMLHttpRequest();
				}catch(e){
					try{
						xhr=new ActiveObject("Msxml2.XMLHTTP");
					}catch(e2){
						xhr=new ActiveObject("Microsoft.XMLHTTP");
					}
				}
				return xhr;
			}


为了增加更健壮的错误处理并尽量避免过于复杂，可以增加一两个状态码检查;
function updatePage(){
    if(request.readyState==4 || request.readyState=="complete"){
        if(request.status==200){
            //执行代码
        }else if(request.status==404){
            alert("url不存在");
        }else{
            alert("错误码为:"+request.status);
        }
    }
}

基本节点类型：元素节点、文本节点和属性节点

虽然 XML 可以通过 HTTP 发送，但 XML 是一种数据格式而不是传输协议。
XMLHttpRequest只不过是为客户机代码发送HTTP请求的一种方式，与xml没有太大的实质性关系，当然它可以发送和接受xml数据；

1、这里的另一个问题前面已经提到，即必须手工创建 XML。使用 DOM 不是一种好的选择，因为没有简单易行的办法将 DOM 对象转化成在请求中发送的字符串。
2、除了复杂性的问题之外，和普通文本以及名/值对相比，在请求中使用 XML 实际上没有多少好处（如果有的话）。要注意，本文坚持使用前面用名/值对发送的同一些数据（请参阅清单 1）来用 XML 发送。我没有提什么数据能用 XML 但是不能用普通文本发送，这是因为实际上没有任何东西可用 XML 而不能用普通文本发送。
因此，除非特殊情况，在请求中最好使用普通文本；


转换回字符串：
String new newJSONtext=people.toJSONString();
##重要的是：可以将任何JavaScript对象转换为JSON文本，如：
String newObjectInJSON=myobject.toJSONString();







