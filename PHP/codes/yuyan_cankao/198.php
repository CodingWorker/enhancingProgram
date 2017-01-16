<?php
namespace cc\aa{
    var_dump(__NAMESPACE__);   //输出 ""
    function ac(){
        var_dump("namespace:aa");
    }
}

namespace cc{
    use aa;
    var_dump(__NAMESPACE__);    //输出cc
    function ac(){
        var_dump("namespace:cc");
    }

    namespace\aa\ac();
}
namespace {

}
