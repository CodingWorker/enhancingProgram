<?php
class test{
    public $a=1;
}

function changeVal(test $t){
    $t->a=12;
}

$tt=new test;
changeVal($tt);
var_dump($tt->a);

