<?php
namespace test;
class A{

}

$clsName="\\test\A";
$a=new $clsName;      //必须使用完整而名称，带命名空间
var_dump($a);