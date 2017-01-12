<?php
class Foo{
    protected $bar;
    public function __construct(){
        $this->bar=null;
        var_dump($this->bar);
        unset($this->bar);
        var_dump($this->bar);

    }

    public function __get($var){
        echo "GET " . $var;
    }
}

new Foo;
