<?php
namespace test;

final class FinalTest{    //不能被继承

}

class Test{
    public function run(){
        echo "run in Test";
    }

    public final function run2(){   //方法不能被重写
        echo "run2 in Test";
    }
}

class SubTest extends Test{
    public function run(){
        echo "run in SubTest";
    }
}

$subTest=new SubTest;
$subTest->run();
(new SubTest())->run2();
