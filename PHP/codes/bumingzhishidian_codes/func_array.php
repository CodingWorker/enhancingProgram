<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 13:19
 */

function changeValue(Array $arr){
    $arr[0]=12;
}

$arr=[1,2,3];
changeValue($arr);
var_dump($arr);//并未改变，可见在php中的数组并未看做引用类型