<?php
class a{
    const CONSTANT='NOT CHANGED';
    public $a='a';
}

var_dump(a::CONSTANT);
$clasName="a";
var_dump($clasName::CONSTANT);     #这也可以

