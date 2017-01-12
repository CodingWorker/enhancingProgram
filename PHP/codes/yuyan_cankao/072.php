<?php
function a(){
    echo 'a';
}
function b(){
    echo 'b';
}
var_dump(a()==b());    //输出abbool(true),相等判断时并不一定由右至左