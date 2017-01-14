<?php
namespace a\b\c;
class a{
    public function __construct(){
        var_dump(__CLASS__);
        var_dump(__FUNCTION__);
    }
}

function aa(){
    var_dump(__FUNCTION__);
}

new a;
aa();