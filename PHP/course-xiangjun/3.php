<?php
/*
$houdunwang="�������Ƶ������̳";
$bbs=&$houdunwang;
$bbs="dfadads";
echo $houdunwang;
echo $bbs;
*/
// //ħ������
// echo __FILE__;
// echo __LINE__;
// echo __METHOD__;
// function name(){
// 	echo 'hello world';
// }
// $a='name';
// //����һ����
// class Car {
//     var $name = '����';
//     function getName() {
//         return $this->name;
//     }
// }

// //ʵ����һ��car����
// $car = new Car();
// $car->name = '�µ�A6'; //���ö��������ֵ
// echo $car->getName();  //���ö���ķ��� ������������
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
//             self::$_object = new Car(); //�ڲ��������Ե���˽�з��������������Դ�������
//         }
//         return self::$_object;
//     }
// }
// //$car = new Car(); //���ﲻ����ֱ��ʵ��������
// $car = Car::getInstance(); //ͨ����̬���������һ��ʵ��

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
// $str = serialize($a); //�������л����ַ���
// echo $str.'<br>';
// $b = unserialize($str); //�����л�Ϊ����
// var_dump($b);

$value = time();
//����������һ����Ϊtest��Cookie
setcookie('test',$value);
if (isset($_COOKIE['test'])) {
    echo 'success';
}
echo date('Y-m-d h:i:s',1446715450);


/*
//�������Ƿ����
$houdunwang="fdfs";
$f=isset($houdunwang);
var_dump($f);
if ($f){
	echo $houdunwang."<br>";
}else{
	echo "����������<br>";
}
define("URL","www.baidiu.com");
$s=defined("URL");
$ss=defined("URL1");
var_dump($ss);
var_dump($s);
//��������$
*/
?>