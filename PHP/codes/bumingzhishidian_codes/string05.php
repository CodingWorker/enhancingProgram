<?php
$c='a';

var_dump(bin2hex($c));  //61而非97
var_dump(bin2hex('A')); //41
var_dump(chr(97));
var_dump(ord('a'));

$url="http://www.houdunwang.com?uname=zhangsan&age=33&sex=boy";

var_dump(chunk_split($url,2,' '));
