<?php
$arr=[1,2,3,4];
$arr2=['a'=>'aa','B'=>'Bb','cD'=>'cd'];
var_dump($arr);
var_dump(array_change_key_case($arr2,CASE_LOWER));
var_dump(array_change_key_case($arr2,CASE_UPPER));
var_dump(array_change_key_case($arr2));    //默认转换为小写

$arr3=array('key1'=>'后盾网','key2'=>'php视频','key3'=>'div视频','key4'=>'mysql课程','key5'=>'后盾网','key6'=>'php视频','key7'=>'div视频','key8'=>'mysql课程');
var_dump(array_chunk($arr3,5));   //不保存原键名

var_dump(array_chunk($arr3,3,true));    //保存原有的键名

$records  = array(
		    array(
		         'id'  =>  2135 ,
		         'first_name'  =>  'John' ,
		         'last_name'  =>  'Doe' ,
		    ),
		    array(
		         'id'  =>  3245 ,
		         'first_name'  =>  'Sally' ,
		         'last_name'  =>  'Smith' ,
		    ),
		    array(
		         'id'  =>  5342 ,
		         'first_name'  =>  'Jane' ,
		         'last_name'  =>  'Jones' ,
		    ),
		    array(
		         'id'  =>  5623 ,
		         'first_name'  =>  'Peter' ,
		         'last_name'  =>  'Doe' ,
		    )
		);

var_dump(array_column($records,'id'));
var_dump(array_column($records,'first_name'));

$arr1=[1,2,3];
$arr2=['ac','b','c'];
$arr3=['a'=>'Aa','b'=>'b','c'=>'cc','dd'=>'cc'];
var_dump(array_combine($arr1,$arr2));
// var_dump(array_combine($arr2,$arr3));
var_dump(array_count_values($arr3));