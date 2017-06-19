<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 12:16
 */

$a = 12;
var_dump(gettype($a));//integer
var_dump(settype($a,"integer"));//true

$c = true;
var_dump(settype($c,"integer"));
var_dump(gettype($c));//integer
var_dump($c);//1

var_dump(settype($c,"resource"));//false