<?php
class t{
    public static $_instance=null;
    final public static function getInstance(){
        // if(null !== static::$_instance){
        //     return static::$_instance;
        // }                                        #注释后$b才得到tt的对象
        static::$_instance = new self();            #使用new self得到的永远是t，self强制代表当前类
        return static::$_instance;
    }
}
class tt extends t{

}
$a=t::getInstance();
var_dump($a);    //得到的都是t
$b=tt::getInstance();
var_dump($b);    //得到的都是t
