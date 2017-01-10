<?php
class A{
    public static function who(){
        echo "A\n";
    }
}

class B extends A{
    public static function who(){
        echo "B\n";
    }
}

call_user_func(['B','parent::who']);      //输出 A
