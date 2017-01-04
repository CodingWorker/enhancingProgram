##预定义常量

下列常量由此扩展定义，且仅在此扩展编译入 PHP 或在运行时动态载入时可用。

MB_OVERLOAD_MAIL  ( integer )  

MB_OVERLOAD_STRING  ( integer ) 

MB_OVERLOAD_REGEX  ( integer )  

MB_CASE_UPPER  ( integer )  

MB_CASE_LOWER  ( integer )  

MB_CASE_TITLE  ( integer ) 

##多字节字符串函数

1. mb_check_encoding — 检查字符串在指定的编码里是否有效

		语法：bool mb_check_encoding  ([ string $var  = NULL    [, string $encoding  = mb_internal_encoding()  ]] )

		检查指定的字节流在指定的编码里是否有效。它能有效避免所谓的“无效编码攻击（Invalid Encoding Attack）”。
		成功返回true，失败返回false

		$str="检查指定的字节流在指定的编码里是否有效。它";

		var_dump(mb_check_encoding($str,'utf-8'));//true

检查指定的字节流在指定的编码里是否有效。它能有效避免所谓的“无效编码攻击（Invalid Encoding Attack）”。

2. mb_convert_case — 对字符串进行大小写转换

		string mb_convert_case  ( string $str  , int $mode  [, string $encoding  = mb_internal_encoding()  ] )
		转换模式由mod指定，可取的值为： MB_CASE_UPPER 、 MB_CASE_LOWER  和 MB_CASE_TITLE  的其中一个。
		encoding  参数为字符编码。如果省略，则使用内部字符编码。

		$str="http://wwwODE.ORG/UNICODEde.orgODE.ORG/UNICODE/reports/tr21/";

		echo mb_convert_case($str,MB_CASE_LOWER)."<br/>";
		echo mb_convert_case($str,MB_CASE_UPPER)."<br/>";
		echo mb_convert_case($str,MB_CASE_LOWER,"GB2312");
				
3. mb_convert_encoding — 转换字符的编码

		语法：string mb_convert_encoding  ( string $str  , string $to_encoding  [, mixed  $from_encoding  = mb_internal_encoding()  ] )
		将 string  类型 str  的字符编码从可选的 from_encoding  转换到 to_encoding 。

		$str="遍历目录下的所有文件";

		echo mb_convert_encoding($str, "UTF-8","UTF-8")."<br/>";
		echo mb_convert_encoding($str,"UTF-8")."<br/>";
		echo mb_convert_encoding($str,"UTF-8","GB2312");
		echo mb_convert_encoding($str,"UTF-8","BIG-5");
		输出：
		遍历目录下的所有文件
		éåç®å½ä¸çæææä»¶
		???????涓?????????浠

4. mb_convert_kana — Convert "kana" one from another ("zen-kaku", "han-kaku" and more)
		
		仅用于日文

5. mb_convert_variables — 转换一个或多个变量的字符编码

		string mb_convert_variables  ( string $to_encoding  , mixed  $from_encoding  , mixed  &$vars  [, mixed  &$...  ] )
		将变量 vars  的编码从 from_encoding  转换成编码 to_encoding 。 
		mb_convert_variables()  会拼接变量数组或对象中的字符串来检测编码，因为短字符串的检测往往会失败。因此，不能在一个数组或对象中混合使用编码。 
		成功时返回转换前的字符编码，失败时返回 FALSE 。
		
		$str="遍历目录下的所有文件";
		echo mb_convert_variables("UTF-8", "GBK", $str);//CP936
		echo mb_convert_variables("UTF-8", "GB2312", $str);//EUC-CN

6. mb_decode_mimeheader — 解码 MIME 头字段中的字符串

		string mb_decode_mimeheader  ( string $str  )
		返回以内部（internal）字符编码解码的 string 。

7. mb_decode_numericentity — 根据 HTML 数字字符串解码成字符

		string mb_decode_numericentity  ( string $str  , array $convmap  [, string $encoding  = mb_internal_encoding()  ] )
		将数字 字符串 的引用 str  按指定的字符块转换成字符串。
		返回值：转换后的 字符串 。 
 
8. mb_detect_encoding — 检测字符的编码

		string mb_detect_encoding  ( string $str  [, mixed  $encoding_list  = mb_detect_order()  [, bool $strict  = false  ]] )
		检测 字符串  str  的编码。 
		返回值为检测到的字符编码，或者无法检测指定字符串的编码时返回 FALSE 。 
		
		$str="使用print_r带文件路径";
		$str2="\u8fd9\u662f\u4e00\u4e2a\u4f8b\u5b50,this is a example";
		echo mb_detect_encoding($str);//UTF-8
		echo mb_detect_encoding($str2);//ASCII

9. mb_detect_order — 设置/获取 字符编码的检测顺序

		mixed  mb_detect_order  ([ mixed  $encoding_list  = mb_detect_order()  ] )
		为编码列表 encoding_list  设置自动检测字符编码的顺序。
		成功返回true，失败返回false,不指定参数返回检测顺序数组
		
		print_r(mb_detect_order());//Array ( [0] => ASCII [1] => UTF-8 )

10. mb_encode_mimeheader — 为 MIME 头编码字符串

		string mb_encode_mimeheader  ( string $str  [, string $charset  = mb_internal_encoding()  [, string $transfer_encoding  = "B"  [, string $linefeed  = "\r\n"  [, int $indent  = 0  ]]]] )	
		按 MIME 头编码方案将指定的 字符串  str  进行编码。 
		返回值：转换后的 字符串 版本以 ASCII 形式表达。 

11. mb_encode_numericentity — Encode character to HTML numeric string reference
12. mb_encoding_aliases — Get aliases of a known encoding type

13. mb_ereg_match — 多字节字符串的正则匹配

		bool mb_ereg_match  ( string $pattern  , string $string  [, string $option  = "msr"  ] )
		A regular expression match for a multibyte string 
		匹配到返回true，否则返回false
		mb_regex_encoding()  指定的内部编码或字符编码将会当作此函数用的字符编码。
		Note that this function matches a string from the beginning only (though not necessarily till the end)
		即这个函数只从开始匹配，开始如果不匹配就false

		$str="从print_r带文件路径";
		$str2="pringt发发发";
		$pattern="p";
		
		var_dump(mb_ereg_match($pattern, $str));//false
		var_dump(mb_ereg_match($pattern, $str2));//true
		var_dump(mb_ereg_match("从", $str));//false

14. mb_ereg_replace_callback — 对多字节字符串采用回调函数执行正则查找和替换
		
		string mb_ereg_replace_callback  ( string $pattern  , callable  $callback  , string $string  [, string $option  = "msr"  ] )
		成功返回替换操作完成的字符串，否则返回false

		$text  =  "April fools day is 04/01/2002\n" ;
		 $text .=  "Last christmas was 12/24/2001\n" ;
		 // the callback function
		 function  next_year ( $matches )
		{
		   // as usual: $matches[0] 是整个匹配
		  // $matches[1] 时匹配的第一个子组
		  // enclosed in '(...)' 其他一次类推
		   return  $matches [ 1 ].( $matches [ 2 ]+ 1 );
		}
		echo  mb_ereg_replace_callback (
		             "(\d{2}/\d{2}/)(\d{4})" ,
		             "next_year" ,
		             $text );
		

15. mb_ereg_replace — 对多字节字符串的查找和替换,正则匹配但不加两侧的定界符/

		string mb_ereg_replace  ( string $pattern  , string $replacement  , string $string  [, string $option  = "msr"  ] )
		成功返回替换完成的字符串，失败返回false
		
		$str="Content-type:text/html;";
		$replace="哈哈哈";
		$pattern="type";
		echo mb_ereg_replace($pattern,$replace,$str);// Content-哈哈哈:text/html;

16. mb_ereg_search_getpos — 返回下一个匹配点的起始位置

		int mb_ereg_search_getpos  ( void )
		此函数没有参数
		要用在mb_ereg_search() , mb_ereg_search_pos() , mb_ereg_search_regs() 这几个函数之后

17. mb_ereg_search_getregs — 获得最近一次多字节匹配的结果

		array mb_ereg_search_getregs  ( void )
		此函数没有参数
		要用在 mb_ereg_search() , mb_ereg_search_pos() , mb_ereg_search_regs() 这几个函数之后

		mb_regex_encoding("UTF-8");
		mb_ereg_search_init("12345=asdfa????????");
		var_dump(mb_ereg_search("=(\w+)"));
		$match = mb_ereg_search_getregs();
		
		print_r($match[1]); //asdfa

18. mb_ereg_search_init — 为一个多字节匹配设置字符串和匹配表达式

		bool mb_ereg_search_init  ( string $string  [, string $pattern  [, string $option  = "msr"  ]] )
		mb_ereg_search_init()   These values are used for mb_ereg_search() , mb_ereg_search_pos() , and mb_ereg_search_regs() . 
		成功时返回 TRUE ， 或者在失败时返回 FALSE 。 

		mb_regex_encoding("UTF-8");
		mb_ereg_search_init("12345=?????????????????");
		mb_ereg_search("=(\w+)");//这个表示匹配的就是上面设置的字符串
		$match = mb_ereg_search_getregs();
		
		print($match[1]); //?????????????????

19. mb_ereg_search_pos — 返回给定字符串匹配表达式的位置和长度
		
		The string for match is specified by mb_ereg_search_init() . If it is not specified, the previous one will be used. 这个字符串匹配必须是由mb_ereg_search_init()函数指定的，否则之前的会被使用
		成功返回两个元素的数组，失败返回false

20. mb_ereg_search_regs — 返回字符串中匹配的部分

		array mb_ereg_search_regs  ([ string $pattern  [, string $option  = "ms"  ]] )
		此函数只要匹配到一个即返回，可能不会匹配完整个字符串

		$str="在线编码type:text/h转换";
		$pattern="t[ye]";
		mb_ereg_search_init($str,$pattern);
		print_r(mb_ereg_search_regs());//Array ( [0] => ty )


21. mb_ereg_search_setpos — 设定下一次匹配的起始位置

		bool mb_ereg_search_setpos  ( int $position  )
		mb_ereg_search_setpos()  sets the starting point of a match for mb_ereg_search() . 
		成功返回true，失败返回false

		$str="在线编码type:text/h转换";
		$pattern="t[ye]";
		mb_ereg_search_init($str);
		mb_ereg_search_setpos(5);
		var_dump(mb_ereg_search($pattern));//true
		mb_ereg_search_setpos(25);
		var_dump(mb_ereg_search($pattern));// false

22. mb_ereg_search — 给定多字节字符串的匹配查找

		bool mb_ereg_search  ([ string $pattern  [, string $option  = "ms"  ]] )
		The string  for matching is set by mb_ereg_search_init() . If pattern  is not specified, the previous one is used. 在使用之前要先用mb_ereg_seatch_init设定字符串

		见上一个函数

23. mb_ereg — 多字节字符串的正则匹配

		int mb_ereg  ( string $pattern  , string $string  [, array $regs  ] )
		如果没有指定第三个参数则匹配大返回1否则返回false,如果指定了第三个参数返回匹配到字符串的长度，第三个参数则存有匹配的字符串，也即返回的是第三个数组中字符串的长度
		该函数一旦匹配到就停止匹配
		
		$str="在线编码tepe:text/h转换";
		$pattern="t[ye]";
		echo mb_ereg($pattern, $str);//1
		var_dump(mb_ereg($pattern,$str,$arr));//2
		var_dump($arr);
		输出：
		array (size=1)
  			0 => string 'te' (length=2)


24. mb_eregi_replace — 忽略大小写
	
		string mb_eregi_replace  ( string $pattern  , string $replace  , string $string  [, string $option  = "msri"  ] )
		用法参见mb_ereg_replace

25. mb_eregi — 忽略大小写

		int mb_eregi  ( string $pattern  , string $string  [, array $regs  ] )
		用法参见mb_ereg

26. mb_get_info — 获取 mbstring 的内部设置

		mixed  mb_get_info  ([ string $type  = "all"  ]
		mb_get_info()  返回 mbstring 参数的内部设定。 

		print_r(mb_get_info());
		输出：
		Array
		(
	    [internal_encoding] => ISO-8859-1
	    [http_output] => pass
	    [http_output_conv_mimetypes] => ^(text/|application/xhtml\+xml)
	    [func_overload] => 0
	    [func_overload_list] => no overload
		...

27. mb_http_input — 检测 HTTP 输入字符编码

		mixed  mb_http_input  ([ string $type  = ""  ] )
		type:设置的字符串指定了输入类型。 "G" 是 GET，"P" 是 POST，"C" 是 COOKIE，"S" 是 string，"L" 是 list，以及 "I" 是整个列表（将会返回 array ）。 如果省略了 type，它将返回最后处理的一种输入类型。 
		返回每个 type  的字符编码名称。 如果 mb_http_input()  没有处理过任何指定的 HTTP 输入，它将返回 FALSE 。 
		该函数返回的是在配置文件中设置的值
		
		echo $_GET["aid"];
		var_dump(mb_http_input("l"));// pass

28. mb_http_output — 设置/获取 HTTP 输出字符编码

		mixed  mb_http_output  ([ string $encoding  = mb_http_output()  ] )
		设置/获取 HTTP 输出字符编码。此函数之后输出的内容会被转换成 encoding 。 

		$str="在线编码tepe:text/h转换";
		$pattern="t[ye]";
		echo $_GET["aid"];
		mb_http_output("gbk");
		echo mb_ereg_replace($pattern,"haha",$str);//输出: 在线编码hahape:hahaxt/h转换

29. mb_internal_encoding — 设置/获取内部字符编码
		
		mixed  mb_internal_encoding  ([ string $encoding  = mb_internal_encoding()  ] )
	
		echo mb_internal_encoding();//输出：ISO-8859-1

30. mb_language — 设置/获取当前的语言

		mixed  mb_language  ([ string $language  = mb_language()  ] )

		echo mb_language();// neutral

31. mb_list_encodings — 返回所有支持编码的数组

		array mb_list_encodings  ( void )

		var_dump(mb_list_encodings());
		输出：
		array (size=87)
		  0 => string 'pass' (length=4)
		  1 => string 'auto' (length=4)
		  2 => string 'wchar' (length=5)
		  3 => string 'byte2be' (length=7)
		  4 => string 'byte2le' (length=7)
		  5 => string 'byte4be' (length=7)
		...

32. mb_output_handler — 在输出缓冲中转换字符编码的回调函数
33. mb_parse_str — 解析 GET/POST/COOKIE 数据并设置全局变量
34. mb_preferred_mime_name — 获取 MIME 字符串
35. mb_regex_encoding — Set/Get character encoding for multibyte regex
36. mb_regex_set_options — Set/Get the default options for mbregex functions
37. mb_send_mail — 发送编码过的邮件
38. mb_split — 使用正则表达式分割多字节字符串
39. mb_strcut — 获取字符的一部分
40. mb_strimwidth — 获取按指定宽度截断的字符串
41. mb_stripos — 大小写不敏感地查找字符串在另一个字符串中首次出现的位置
42. mb_stristr — 大小写不敏感地查找字符串在另一个字符串里的首次出现
43. mb_strlen — 获取字符串的长度
44. mb_strpos — 查找字符串在另一个字符串中首次出现的位置
45. mb_strrchr — 查找指定字符在另一个字符串中最后一次的出现
46. mb_strrichr — 大小写不敏感地查找指定字符在另一个字符串中最后一次的出现
47. mb_strripos — 大小写不敏感地在字符串中查找一个字符串最后出现的位置
48. mb_strrpos — 查找字符串在一个字符串中最后出现的位置
49. mb_strstr — 查找字符串在另一个字符串里的首次出现
50. mb_strtolower — 使字符串小写
51. mb_strtoupper — 使字符串大写
52. mb_strwidth — 返回字符串的宽度
53. mb_substitute_character — 设置/获取替代字符
54. mb_substr_count — 统计字符串出现的次数
55. mb_substr — 获取字符串的部分
