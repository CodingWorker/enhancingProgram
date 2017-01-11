<?php
function a($a,$b,$c){
    var_dump(func_num_args());
    var_dump(func_get_args());     //返回所有参数组成的索引数组，下表从0开始
    var_dump(func_get_arg(2));     //输出下表为2的参数
    var_dump($a);
}

a(1,2,3,4,5,6,7);