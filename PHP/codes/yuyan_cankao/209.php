<?php
function foo(&$var){
    $var++;
}

$a=12;
foo($a);
var_dump($a);  //13
foo(12);    //会导致错误