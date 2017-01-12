<?php
class a{
    public $a;
    public $b;
    protected $pa;
    protected $pb;
    private $ppa;
    private $ppb;
}

class b extends a{
    public function getApa(){
        return (new a)->pa;
    }

    public function getAppa(){
        return parent::ppa;
    }
}
$a=new a;

$b=new b;
var_dump($b);    //貌似从类a继承了私有和保护属性但是不能访问
// var_dump($a->ppa);   //对象不能在外部访问私有属性ppa
var_dump($b->getApa());  //可以访问父类的protected属性
// var_dump($b->getAppa());    //父类私有属性不能再类外部访问
