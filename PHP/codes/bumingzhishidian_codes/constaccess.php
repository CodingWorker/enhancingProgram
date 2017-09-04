<?php 

class Test{
	const TERM = 'this is a test';
}

$test=new Test;
var_dump($test::TERM);
var_dump($test->TERM);//null
var_dump(Test::TERM);

