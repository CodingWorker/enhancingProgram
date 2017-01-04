#json 对象 

- 自PHP5.2.0开始，json扩展就默认内置并编译进了PHP

##Json 函数

1. json_decode 对 JSON 格式的字符串进行编码

		mixed  json_decode  ( string $json  [, bool $assoc  = false  [, int $depth  = 512  [, int $options  = 0  ]]] )
		接受一个 JSON 格式的字符串并且把它转换为 PHP 变量 
		第二个参数如果为true则返回数组，否则是一个对象
		第三个参数自定递归调用的深度
		该函数返回json对象，或者false或者null

		$json  =  '{"a":1,"b":2,"c":3,"d":4,"e":5}' ;
		print_r(json_decode ( $json ));
		// print_r ( json_decode ( $json )->{'d'});
		print_r(json_decode ( $json, true ));
		print_r ( json_decode ( $json ,  true )['d']);

2. json_encode — 对变量进行 JSON 编码  

		string json_encode  ( mixed  $value  [, int $options  = 0  ] )
		返回 value  值的 JSON 形式 
		该函数只能接受 UTF-8 编码的数据.,第二个参数为二进制掩码的类型
		编码成功则返回一个以 JSON 形式表示的 string  或者在失败时返回 FALSE  

		$arr  = array ( 'a' => 1 , 'b' => 2 , 'c' => 3 , 'd' => 4 , 'e' => 5 );
		echo  json_encode ( $arr );

		PHP_EOL是换行符的意思，可以兼容多种操作系统，类似于DIRECTORY_SEPRATORY

3. json_last_error_msg — Returns the error string of the last json_encode() or json_decode() call

		string json_last_error_msg  ( void )
		成功返回错误信息，检测出现错误则返回null
		
		$arr  = '{"a" : , "b" : 2 , "c" : 3 , "d" : 4 , "e" : 5 }';
		print_r( json_decode ( $arr ) );
		echo json_last_error_msg();
		echo JSON_ERROR_NONE;

4. json_last_error — 返回最后发生的错误

		string json_last_error_msg  ( void )
		如果有，返回 JSON 编码解码时最后发生的错误。 
		返回一个整型（integer）

		$arr  = '{"a" : 1 , "b" : 2 , "c" : 3 , "d" : 4 , "e" : 5 }';
		print_r( json_decode ( $arr ) );
		echo json_last_error();
		echo JSON_ERROR_NONE;

json 必须要单引号将其括起来，里面用双引号；如果外面为双引号里面为单引号则是错误的
即：
	
	'{"a":1,"b":2}'是正确的格式，至少在PHP里是这样
	"{'a':1,'b':2}"是错误的格式