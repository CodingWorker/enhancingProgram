<?php
class a{
    public static function who(){
        var_dump(__CLASS__);
    }

    public static function test(){
        // self::who();
        static::who();
    }
}

class b extends a{
    public static function who(){
        var_dump(__CLASS__);
    }
}

b::test();     //输出a，这就是self的效果;当将self换为static时则输出b