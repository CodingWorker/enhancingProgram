<?php
class foo{
    public $value=42;
    public function & getValue(){   //返回引用&
        return $this->value;
    }
}

$foo=new foo;
$myValue=&$foo->getValue();   //调用的时候也要加，表示为myValue赋值了一个引用
$foo->value=12;
echo $myValue;     //输出12
