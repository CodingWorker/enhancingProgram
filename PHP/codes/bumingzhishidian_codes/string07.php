<?php
$str="attachment_name your_attachment_new_name";
var_dump($str,explode('_',$str));

$newArr=explode('_',$str);

var_dump(implode(',',$newArr));

$year=2017;
$month=3;
$day=21;

if (!( $fp  =  fopen ( 'E:\date.txt' ,  'w' ))) {
		    return;
}
fprintf ( $fp ,  "%04d-%02d-%02d" ,  $year ,  $month ,  $day );     //文件获得结果：2017-03-21

$cnStr="不明知识点";
var_dump(chop($cnStr,'adfa知fadf识fad点sfadfa'));  //不明

var_dump(bin2hex('faf'));

var_dump(get_html_translation_table(HTML_SPECIALCHARS));

var_dump(hex2bin('616666'));    //aff

var_dump(get_html_translation_table());

$arr=['a','b','c'];
var_dump($arr);
var_dump(implode($arr,','));
var_dump(join($arr,';'));

var_dump(metaphone('shit'));   //XT
var_dump(metaphone('sheet'));  //XT

$str=<<<EOF
$newArr
adfa知fadf识fad点sfadfa
DD



EOF;
var_dump(nl2br($str));

$url="http://www.houdunwang.com?uname=zhangsan&age=33&sex=boy";;
$query=parse_url($url)['query'];
var_dump($query);

parse_str($query,$arr);

var_dump($arr);

parse_str($query);
var_dump($uname);
var_dump($age);

$encodedStr=quoted_printable_encode('adfa知fadf识fad点sfadfa');

var_dump(quoted_printable_decode($encodedStr));

var_dump(str_word_count("http://www.houdunwang.com?uname=zhangsan&age=33&sex=boy"));

$str=<<<EOF
Metaphone matching is an algorithmicmethod for generating keys based on the phonetic pronunciation of words.
EOF;

var_dump(str_word_count($str));
var_dump('-------------');
$str="<div style='background-color:blue;width:200px;height:50px'><span style='color:yellow'>后盾网</span>视频教<span>程</span></div>";

var_dump(strip_tags($str));

$str='查找字符串首次出现的位置,按字节计';
var_dump(strrev($str));


