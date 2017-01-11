<?php
class A{

}

$clsName="A";
$a=new $clsName;     //这样也能创建一个类
var_dump($a);
$ab=new A;
var_dump($ab);       //A的第二个示例
