<?php
namespace test;
class a{
    private $a;
    private function __construct($var){
        $this->a=$var;
    }

    public function get(){
        return $this->a;
    }

    public static function getInstance($v){
        return new self($v);
    }
}

$obj=a::getInstance("aa");
var_dump($obj);
var_dump($obj->get());
