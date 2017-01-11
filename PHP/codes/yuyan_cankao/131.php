<?php
class A{

}

class B extends A{
    public static $b;
    public function ba(){
        $this->b=new self;
        $pa=new parent;
        var_dump($this->b);
        var_dump($pa);
    }
}

$bo=new B;
$bo->ba();
