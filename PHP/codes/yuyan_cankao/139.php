<?php
class a{
    public function __construct(){
        echo "this is __construct" . PHP_EOL;
    }

    public function test(){
        echo "this is test" . PHP_EOL;
    }

    public function __destruct(){
        echo "this is destruct" . PHP_EOL;
    }
}

(new a)->test();

