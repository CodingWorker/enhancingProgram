<?php
namespace test;
class Test1{

}

$t=new Test1;
$cc=new \stdClass;          #必须指明命名空间，否则只会在当前空间查找
var_dump(get_class($t));     //test\Test1
var_dump(get_class($cc));    //stdClass 表明是全局命名空间