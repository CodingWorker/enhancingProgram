<?php
namespace test;
class a{
    public function __construct(){
        var_dump(__CLASS__);
    }
}
new a;
var_dump(a::class);
