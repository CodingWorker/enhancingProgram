<?php
$a='fantastic';
echo "this is $a bcd\n";       #有效
echo "this is ${a} bcd\n";     #有效
echo "this is {$a} bcd\n";     #有效

$fantastic='haha';
echo "this is ${$a}";       //可变变量
$arr=['cc' => [1,2,3]];
echo "there is an item of array in this string {$arr['cc'][1]}";    #有效，字符串key要用单引号括起来

