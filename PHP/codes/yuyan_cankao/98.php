<?php
$arr=[1,2,3,4,'a'=>'aa','b'=>'bb'];
foreach($arr as $k => &$v){
    if(is_int($v)){
        $v*=2;
    }

    if(is_string($v)){
        $v .= $v;
    }
}
echo $v;
var_dump($arr);     //在foreach中对数组的改变，原数组不改变
