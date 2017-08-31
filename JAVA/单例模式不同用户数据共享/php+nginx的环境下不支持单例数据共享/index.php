<?php 	
namespace index;
require_once './singletondemo.php';
use \demo\SingletonDemo;

$incr = 0;

if(!empty($_GET['incr'])){
	$incr = intval($_GET['incr']);
}

$singletondemo = \demo\SingletonDemo::getInstance();

$singletondemo->incrCount($incr);
echo $singletondemo->getCount();







