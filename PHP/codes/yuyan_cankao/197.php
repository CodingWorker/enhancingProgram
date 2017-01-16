<?php
namespace {
    const constName="global";
}
namespace t{
    class cls{
        function __construct(){
            var_dump(__METHOD__);
        }
    }

    function funcname(){
        var_dump(__FUNCTION__);
    }
    const constName="local";
    $a="t\cls";      #可以不用加全局反斜杠，\t\cls
    $cls=new $a;
    $fname="t\\funcname";
    $fname();
    echo constant('constName');  #访问全局
    echo constant('t\constName');   #访问local
}
