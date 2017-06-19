<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 15:01
 */

//不支持重载
function test($a){
    var_dump($argc);
    var_dump($argv);
}

//function test(){}
test(1,2,3);