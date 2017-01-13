<?php
abstract class ab{
    public $a;
    public $b;
    public function getA(){
        return $this->a;
    }

    abstract protected function setA($a);
}

class a extends ab{
    public function setA($a){
        $this->a=$a;
    }
}

$a=new a;
$a->setA(12);
var_dump($a->getA());


