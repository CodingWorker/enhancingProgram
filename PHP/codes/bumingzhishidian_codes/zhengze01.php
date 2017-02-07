<?php
/*
preg_quote
$str="ab.d*ef[]c";
var_dump(preg_quote($str));

$str="there is a word in the sentence";

$pattern="/\w+?\b/";
preg_match_all($pattern,$str,$matches);
var_dump($matches);

$str="计模式结合起来成为新的设计模式(例如著名的MVC模式)，作者称其为复合设计模式(这是作者自创的名称，";
$pattern="/(?<=成)(为.+)(?=，)/";
preg_match_all($pattern,$str,$matches);
var_dump($matches);
*/
$str="abcgsfgdsgsgfsfgsabcfadfafabcd";
$pattern="/(\w{3})(.+)\1/";
preg_match_all($pattern,$str,$matches);
var_dump($matches);

