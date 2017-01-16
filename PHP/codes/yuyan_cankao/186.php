<?php
namespace foo;
function bar(){
    echo __NAMESPACE__ . '\\' . "methods: " . __FUNCTION__;
}

\foo\bar();    //不能使用foo\bar,会将foo\bar附属到当前的命名空间下，即foo\foo\bar
               //这个foo是属于全局命名空间的，在开始加上\