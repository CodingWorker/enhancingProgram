<?php
$dir=dir("f:/");
var_dump($dir->path);
while($file=$dir->read()){  //读取所有的文件名
    var_dump($file);    //字符串类型
}