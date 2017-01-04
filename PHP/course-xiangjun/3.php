<?php
/*
$houdunwang="后盾网视频发布论坛";
$bbs=&$houdunwang;
$bbs="dfadads";
echo $houdunwang;
echo $bbs;
*/
// //魔术常量
// echo __FILE__;
// echo __LINE__;
// echo __METHOD__;
// function name(){
// 	echo 'hello world';
// }
// $a='name';
// //定义一个类
// class Car {
//     var $name = '汽车';
//     function getName() {
//         return $this->name;
//     }
// }

// //实例化一个car对象
// $car = new Car();
// $car->name = '奥迪A6'; //设置对象的属性值
// echo $car->getName();  //调用对象的方法 输出对象的名字
// class Car {
//     private static $speed = 10;
    
//     public static function getSpeed() {
//         return self::$speed;
//     }
    
//     public static function speedUp() {
//         return self::$speed+=10;
//     }
// }
// class BigCar extends Car {
//     public static function start() {
//         parent::speedUp();
//     }
// }

// BigCar::start();
// echo BigCar::getSpeed();
// class Car {
//     private function __construct() {
//         echo 'object create';
//     }

//     private static $_object = null;
//     public static function getInstance() {
//         if (empty(self::$_object)) {
//             self::$_object = new Car(); //内部方法可以调用私有方法，因此这里可以创建对象
//         }
//         return self::$_object;
//     }
// }
// //$car = new Car(); //这里不允许直接实例化对象
// $car = Car::getInstance(); //通过静态方法来获得一个实例

// class Car {
//     public $name = 'car';
    
//     public function __clone() {
//         $obj = new Car();
//         $obj->name = $this->name;
//     }
// }
// $a = new Car();
// $a->name = 'new car';
// $b = clone $a;
// var_dump($b);
// class Car {
//     public $name = 'car';
// }
// $a = new Car();
// $str = serialize($a); //对象序列化成字符串
// echo $str.'<br>';
// $b = unserialize($str); //反序列化为对象
// var_dump($b);

$value = time();
//在这里设置一个名为test的Cookie
setcookie('test',$value);
if (isset($_COOKIE['test'])) {
    echo 'success';
}
echo date('Y-m-d h:i:s',1446715450);


/*
//检测变量是否存在
$houdunwang="fdfs";
$f=isset($houdunwang);
var_dump($f);
if ($f){
	echo $houdunwang."<br>";
}else{
	echo "变量不存在<br>";
}
define("URL","www.baidiu.com");
$s=defined("URL");
$ss=defined("URL1");
var_dump($ss);
var_dump($s);
//常量不用$
*/
?>