<?php 
/*文件上传
 1 打开上传功能 php.ini中file_uploads=On
 2 上传到哪个目录，上传位置 php.ini中upload_tmp_dir = "D:/wamp/tmp"上传文件只在脚本运行期间存在，之后从临时文件夹中自动删除；所以还要脚本运行期间操作上传文件
 3 限制上传文件的大小 php.ini中设置upload_max_filesize = 64M
 4 考虑到脚本运行的最大时间 php.ini中设定max_execution_time = 120 设置最大运行120秒
 5 脚本运行所占用的内存大小 php.ini中设置memory_limit = 128M 设置为128M

$_FILES()//以数组的形式获得上传文件名称，类型，临时存在文件夹中的名称，是否存在错误以及文件的大小
sleep(5);


*/

echo "<pre>";
//print_r($_POST);//这时访问不到文件
print_r($_FILES);//以数组的形式获得上传文件名称，类型，临时存在文件夹中的名称，是否存在错误以及文件的大小
sleep(5);













 ?>