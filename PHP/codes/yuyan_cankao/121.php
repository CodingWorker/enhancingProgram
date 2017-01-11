<?php
function & a(&$a){
    $a=10;
    return $a;
}

$c=12;
$b=& a($c);
var_dump($b);
var_dump($c);