<?php
class a{
    public $a1;
    public $a2;
    public function __construct(){
        $this->a1='a1';
        $this->a2='a2';
    }

    public function canwrite(){
        echo __CLASS__ . '/' . __FUNCTION__;
    }

    public final function nowrite(){
        echo __FUNCTION__;
    }
}

class b extends a{
    public $a1;
    public $a2;
    public $b1;
    public function __construct($c){
        $this->a1='b->a1';
        $this->b1='b1';
    }

    public function canwrite(){
        parent::nowrite();
        parent::canwrite();
        echo __CLASS__ . '/' . __FUNCTION__;
    }

    // public function nowrite(){    //不能重写final关键字修饰的方法
    //     echo __FUNCTION__;
    // }
}

$bo=new b("");
var_dump($bo->a1);
var_dump($bo->a2);
$bo->canwrite();

