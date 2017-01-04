<?php 

/*
is_file()判断是否是一个文件，首先判断文件是否存在
dirname()取得文件的目录
file_exists()检测文件或者文件夹是否存在
is_reaable()判断文件或文件夹是否可读，首先判断文件或文件夹是否存在
is_writeable()判断文件或文件夹是否可写，首先判断文件或文件夹是否存在
fopen(filename, mode)	以指定模式打开文件，返回文件句柄
fread(handle, length)第一个参数是要读取的文件句柄，第二个参数是要读取的长度(字节数)，读取开始时文件指针在文件的开头
opendir()返回的也是文件夹句柄
fclose()关闭文件，节省内存资源
fwrite(handle, content);//第一个参数是文件句柄，第二个参数是写入的内容;当以w的模式打开时写入时会将原内容全部删除，当以r+的内容打开时会替换源文件光标后面与写入文件大小的内容

*/
/*
echo is_executable('aa.exe')?"这个文件是一个可执行文件，它的大小是".(filesize('aa.exe')/1024).'kb':"这不是一个可执行文件";
echo is_file(__FILE__);
echo is_file('2.php');
echo dirname(__FILE__);//获取文件路径
echo is_dir(dirname(__FILE__));//判断是否是文件夹
echo file_exists('34.php');
if(is_readable('123d')) echo "文件可读";
if(is_writeable('1.php.bak')) echo "文件可写";
*/
$file=fopen('a.txt','r');//以读取模式打开文件，不许写入;返回文件句柄
echo fread($file,100);//读取10个字节，此时文件指针在第100个字符后面
echo fread($file,10);//从文件指针继续向后读取10个字节，当遇到文件末尾时就返回从文件指针到末尾的所有内容
fclose($file);//打开的文件不使用时要关闭以节省内存空间
//echo fread($file,10);//关闭文件后就不能读取了
$file1=fopen('aa.txt','r+');//写入模式打开文件
fwrite($file1,'123afafafafa');//第一个参数是文件句柄，第二个参数是写入的内容
fclose($file1);



 ?>