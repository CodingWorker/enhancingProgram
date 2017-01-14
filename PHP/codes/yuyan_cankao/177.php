<?php
class base{
    final public function a(){

    }
}

final class child extends base{
    public function a(){     //会报错

    }
}

class cc extends child{    //不能继承final类

}