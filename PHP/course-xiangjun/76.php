<?php 
/*文件处理
file(filepath)将文件里的内容以数组的形式返回(索引数组)，每一行代表一个元素,包括空行;若指定第二个参数，当第二个参数为1表示当指定的filepath不存在时，将首先在当前更改的路径里查找（如下更改路径的方法），然后在当前页面所在路径下查找，最后在php.ini中的配置文件include path的路径下查找
set_include_path(new_include_path)更改当前脚本的默认载入路径
copy(source, dest)复制文件，source指定待复制的文件，dest指定复制文件路径及名称,如果指定的文件中存在同名同类型的文件，则替换
rename(oldname, newname)既可以改文件名也可以改文件夹名,也可以执行相当于剪切的操作，只需要将newname设定为指定的路径及名即可


*/
/*
echo "<pre>";
$arr=file('a.txt');
//print_r($arr);
foreach ($arr as $k => $v) {
	if ($k%2==0){
		echo "<p style='color:red'>{$v}</p>";
	}else{
		echo "<p style='color:blue'>{$v}</p>";
	}
	
}
*/
/*
set_include_path('123');//设置新的路径
$file=file('haha.txt',1);//只有指定1才include才起作用
print_r($file);
*/
//copy('a.txt','123\a-copy.txt');
rename('new1233', 'new123\new1233');

 ?>