<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 15:17
 */
class Test{
    public $str;
    public $arr;
}

$t=new Test();
$t->str="this is a test";
$t->arr=[1,2,3];
$t2=clone($t);
$t->arr[0]='abc';
var_dump($t);
var_dump($t2);


//参数类型限制
function test2(array $a){

}
test2(12);