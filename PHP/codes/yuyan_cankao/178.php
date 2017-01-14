<?php
class test{
    public $a;
    public function __construct($a){
        $this->a=$a;
    }

    public function __clone(){
        var_dump("clone one object");
    }
}

$test=new test("12");
$test2=clone($test);

$test2->a="aa";
var_dump($test);
var_dump($test2);
