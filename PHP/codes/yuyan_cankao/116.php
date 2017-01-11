<?php
function foo(){
    echo "foo";
    function bar(){
        echo "bar";
    }
}

foo();   //只有调用了foo函数之后，bar函数才被定义，从而才能调用
bar();