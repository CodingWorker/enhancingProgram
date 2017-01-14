<?php
class a{
    public $a;
    public $b;

}

function test(a $a){
    $a->a="aa";
    $a->b="bb";
}

$a=new a;
$a->a='a';
$a->b='b';
var_dump($a);
test($a);
var_dump($a);