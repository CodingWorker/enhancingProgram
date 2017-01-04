<?php 
/**
 * 正则表达式
 * 边界匹配
 * m 	模式修饰符（能够影响^和$），将字符串视为多行，并将每一行视为一个按行进行匹配
 * ^ 	有开始标志时，被匹配的字符串必须由此开始，否则不能匹配 
 * $ 	有结束标志时，被匹配的字符串必须由此结束，否则不匹配
 * /^ $/同时又开始和结束时，将匹配整个字符串，必须有此开始有此结束，否则不能匹配 
 * \A	只匹配这个文本的开头，多行修饰时也是如此，不受m的影响
 *
 */
/*
$str="h1111\nh2222\nh3333";
echo $str;
$preg="/^h\d+$/m";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
\A	只匹配这个文本的开头，多行修饰时也是如此，不受m的影响
$str="h1111\nh2222\nh3333";
$preg="/\Ah\d+$/ism";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/
/*
\Z	只匹配这个文本的结尾，多行修饰时也是如此，不受m的影响
\A 和\Z都不受\n的影响
$str="h1111\nh2222\nh3333\n";
$preg="/h\d+\Z/ism";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/ 
/*
//   \z 会受到\n的影响
$str="h1111\nh2222\nh3333";
$preg="/h\d+\z/ism";
preg_match_all($preg,$str,$arr);
var_dump($arr);
*/






 ?>