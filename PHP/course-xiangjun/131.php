<?php 
/**
 * 正则表达式
 * 匹配边界
 * /^   $/
 \b 	边界符，是边界（如单词边界,或者是其他非字母数字字符）
\B 		上边的反，不要有边界（即后边要有字母或数字字符）


 */
/*
$str="66";
$preg="/^-?\d+/is";
preg_match($preg,$str,$arr);
var_dump($arr);
*/
$str="hello world\my name is hahaha";
$preg="/world\b/is";//\b表示右边不能有其他字母，单词是独立的
preg_match($preg,$str,$arr);
var_dump($arr);








 ?>