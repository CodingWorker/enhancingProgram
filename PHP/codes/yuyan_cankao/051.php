<?php
class MyClass{
    static function mycallbackmethod(){
        echo "myclass-->mycallbackmethod is used";
    }
}

call_user_func(['MyClass','mycallbackmethod']);     #输出 myclass-->mycallbackmethod is used
$myclass=new MyClass;
call_user_func(array($myclass,'mycallbackmethod'));  #输出 myclass-->mycallbackmethod is used,

call_user_func('MyClass::mycallbackmethod');      #输出 myclass-->mycallbackmethod is used

