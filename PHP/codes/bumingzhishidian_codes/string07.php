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