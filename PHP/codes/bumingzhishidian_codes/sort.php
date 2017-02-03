<?php
$arr=['a'=>1,'g'=>2,3,2,'f'=>12,23,42,1,2,3];

// sort($arr);
// asort($arr);
ksort($arr);
var_dump($arr);