<?php
class test{
    public $a;
    public function __isset($name){
        var_dump("检查不可访问的变量: " . $name);
        return 0;
    }
}

$test=new test;
// if(isset($test->b)){
$c=isset($test->b);
var_dump($c);
if(!$c){
    echo "__isset返回了true";
}else{
    echo "没有定义__isset方法或者__isset返回了false";
}