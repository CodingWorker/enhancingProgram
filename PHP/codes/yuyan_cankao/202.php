<?php
namespace a{
    function cc(){
        var_dump("local");
    }
    namespace\cc();
    \cc();
}
namespace{
    function cc(){
        var_dump("global");
    }
}