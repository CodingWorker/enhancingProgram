<?php
class Foo{
    public $a='a';
    public $b='b';
    public function getA(){
        return $this->a;
    }

    public function getB(){
        return $this->b;
    }

    public function setA($a){
        $this->a=$a;
        return $this;
    }
}

echo (new Foo)
     ->setA(12)
     ->getA();
