<?php
// $a=1.23456781230;
// $b = 1.23456781230;
// var_dump($a==$b);


$a=1.23456781230;
$b = 1.23456781231;
var_dump(abs($a-$b)<0.001);