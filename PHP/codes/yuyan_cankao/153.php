<?php
interface a{
    const a=12;
    public function getClas();
    public function echoStr($a);
}

interface b{
    const b=13;
}

interface c extends a,b{
    const c=14;
}

interface d{
    const d=15;
}

class ca implements c,d{
    public function getClas(){
        return __CLASS__;
    }

    public function echoStr($var){
        var_dump($var);     //没有返回值默认返回null
    }
}

$ca=new ca;
var_dump($ca::a);
var_dump($ca::b);
var_dump($ca::c);
var_dump($ca::d);
var_dump($ca->getClas());
var_dump($ca->echoStr("output this"));
