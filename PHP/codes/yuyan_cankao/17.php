<?php
$a='abc';
$b='def';

var_dump($a);
var_dump('\t');    #这里的\t被当做两个字符
var_dump("\t");    #这里的\t被当做一个字符-制表符

var_dump('$b');    #这里直接输出$b
var_dump("$b");    #这里输出def