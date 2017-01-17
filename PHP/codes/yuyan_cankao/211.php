<?php
class a{
    public $a=12;
    function __construct(){
        var_dump($this->a);
        $that=$this;
        unset($this);    //取消了$this到对象的引用
        var_dump($that);
    }
}

new a;
