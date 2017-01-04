<?php 
/*文件处理
disk_total_space(文件路径)，.代表当前目录,..代表上一级目录
disk_free_space(directory)获得路径的剩余空间，别名函数为diskfreespace()
basename(path)获得path路径的文件名,第二个参数可以删掉文件名后面的字符
dirname()得到上一级文件路径，可以多层嵌套
file_exists(filename)判断文件是否存在，存在返回真，否则返回假；省略绝对路径时指当前文件所在的目录；也可以判断文件夹是否存在，省略绝对路径指当前文件所在目录
filetype()获得文件或文件夹类型dir 文件夹  file文件




*/
echo disk_total_space('c:/');//目录的存储空间，
echo "<br/>";
echo disk_total_space('.');//.代表当前目录
echo "<br/>";
echo round(disk_total_space('..')/pow(2,30),3)."GB";//..代表上一级目录,round()四舍五入，pow指数幂
echo "<br/>";
echo round(disk_free_space('.')/pow(1024,3),3)."GB";//获得当前目录的剩余空间
echo "<br/>====================<br/>";
$path=__FILE__;
echo trim(strrchr($path,DIRECTORY_SEPARATOR),DIRECTORY_SEPARATOR);
echo "<br/>====================<br/>";
echo basename(__FILE__,'.php');
echo "<br/>====================<br/>";
echo dirname(__FILE__);
echo "<br/>====================<br/>";
echo dirname(dirname(__FILE__));
echo "<br/>====================<br/>";
echo file_exists('1.php');//当前文件所在目录
echo file_exists('C:\Users\Administrator\Desktop\work.xlsx');//绝对路径判断
echo "<br/>====================<br/>";
echo file_exists('1');//当前文件所在目录下文件夹1是否存在
echo file_exists('C:\Users\Administrator\Desktop');//绝对路径判断,单引号内的\不能转义
echo "<br/>====================<br/>";
echo filetype('65.php');//文件/文件夹必须存在
echo filetype('C:\Users\Administrator\Desktop');

 ?>