<?php 
/**
 * 
{2}两个
{1，4}1-4个
{2，}至少两个


 */
$str="houddunwang.com";
$preg="/houd{2}un/is";//必须是两个d
preg_match_all($preg,$str,$arr);
var_dump($arr);







 ?>