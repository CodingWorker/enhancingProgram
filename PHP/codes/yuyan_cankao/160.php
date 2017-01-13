<?php
trait A{
    public $a;
}

class ca{
    use A;
    public $a;      //定义同名属性会报错
}