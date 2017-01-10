<?php
$arr=[
    [1,2,'a'],
    [3,4,'b'],
    [5,6,'c']
];

foreach($arr as list($a,$b)){       //a和b临时解析为数组元素中的元素，可以比数组元素的个数少但是不能多
    // echo '$a: ' . $a . ' | ' . '$b: ' . $b . '<br />';
    $a .=$b;
}

// echo $a;
var_dump($arr);
