<?php
class p{
    public $a;
    public $b;
    public function pa(){
        echo __CLASS__ . '/' . __FUNCTION__ . PHP_EOL;
    }

    public function pb(){
        echo __CLASS__ . '/' . __FUNCTION__ . PHP_EOL;
    }
}

class c extends p{
    public $a;
    public $c;
    public function pa(){
        echo "this is in child" . PHP_EOL;
    }

    public function pc(){
        echo "this is a method in child" . PHP_EOL;
    }
}

$c=new c;
$c->pa();     //覆盖了父类的方法
$c->pb();
$c->pc();     //子类自己的方法
