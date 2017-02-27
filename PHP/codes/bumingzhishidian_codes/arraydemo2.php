<?php
$arr1 = array( 
		    "a" => "first", 
		    "b" => "second", 
		    "c" => "something", 
		    "red"
		); 
		
$arr2 = array( 
    "a" => "first", 
    "b" => "something",
    1=>'red'
);

var_dump(array_diff($arr1,$arr2));   //仅仅比较值

var_dump(array_diff_key($arr1,$arr2));  //仅仅比较键值，以第一个数组为准，找所有的在第二个数组中找不到的键

var_dump(array_diff_assoc($arr1,$arr2));   //带索引同时比较键名和键值

var_dump(array_diff_ukey($arr1,$arr2,function(){
    return false;
}));

var_dump(array_fill_keys($arr1,$arr2));

$v=new \stdClass();
$obj=array_fill(12,3,$v);
$obj[12]->total=1;

var_dump($obj);
