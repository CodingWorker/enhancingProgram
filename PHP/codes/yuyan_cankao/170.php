<?php
class test{
    public $a;
    public $b;
    protected $c;
    public static $d;
    private $f;
    public function getP(){
        foreach($this as $k => $v){
            var_dump("k: " . $k . '  v: ' . $v);   //仍然不能遍历静态属性
        }
    }
}

$test=new test;
foreach($test as $k => $v){
    var_dump("k: " . $k . '  v: ' . $v);
}

echo "类内部" . PHP_EOL;
$test->getP();
