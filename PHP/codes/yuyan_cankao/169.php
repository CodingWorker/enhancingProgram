<?php
class test{
    public $a;
    public $b;
    protected $c;
    private $d;
    public static $f;
    public function aa(){

    }
}

$test=new test;
var_dump($test::$f);     //随然能够访问但是并不能遍历出来
foreach($test as $k => $v){
    var_dump("k: " . $k . "  v: " . $v);    //只能遍历public的
}