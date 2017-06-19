<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 14:55
 */

$ar=[1,2,34,'a','b'];
//var_dump(each($ar));//each会将数组迭代的解包为索引和关联的键和值

while(list($k,$v)=each($ar)):
    echo '$k=> '.$k.', $v=> '.$v.PHP_EOL;
endwhile;

