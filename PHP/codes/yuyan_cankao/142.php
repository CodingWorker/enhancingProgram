<?php
class a{
    private $a;
    public function setA($var){
        $this->a=$var;
    }

    public function getA(){
        return $this->a;
    }
}

$a1=new a;
$a2=new a;
$a1->setA(12);
var_dump($a1->getA());    //12
var_dump($a2->getA());    //null
