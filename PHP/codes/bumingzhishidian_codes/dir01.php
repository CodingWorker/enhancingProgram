<?php
$dir=dir('F:/');
var_dump(gettype($dir));    //object 
foreach($dir as $k=>$v){
    var_dump($k);
    var_dump($v);
}
var_dump($dir);
var_dump($dir->path);