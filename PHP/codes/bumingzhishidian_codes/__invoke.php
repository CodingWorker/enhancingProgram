<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 15:12
 */
class Test{
    public function __invoke()
    {
        // TODO: Implement __invoke() method.
        var_dump("the object can not be called like a funciton");
    }

    public function __clone()
    {
        // TODO: Implement __clone() method.
        var_dump("the object is being cloned");
    }
}

$t=new Test();
$t();
clone($t);