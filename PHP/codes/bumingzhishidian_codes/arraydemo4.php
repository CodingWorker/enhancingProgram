<?php
$arr=['a'=>'aa','b'=>'b','c'=>'cc','d'=>'cc'];

$start=time();
// for($i=0;$i<1000000;$i++){
//     // $cc=array_key_exists('aa',$arr);    //5s
//     $cc=isset($array['aa']);      //1s
// }
$end=time();
var_dump($end-$start);

var_dump(array_keys($arr));
var_dump(array_keys($arr,'cc'));

