<?php
function my_callback_function(){
    echo 'this is a my_callback_function';
}

call_user_func('my_callback_function');   #输出 this is a my_callback_function

function cc($cc){
    $cc();
}

cc('my_callback_function');     #输出 this is a my_callback_function