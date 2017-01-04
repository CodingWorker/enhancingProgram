<?php

$str = 'abc';
$num = 12;
$nil = null;
var_dump($str);
var_dump($num);
var_dump($nil);
echo gettype($str) . "\n";
echo gettype($num) . "\n";
echo gettype($nil) . "\n";
var_dump(is_int($str)) . "\n";
