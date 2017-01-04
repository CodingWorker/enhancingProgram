<?php 
//接受session传递的数据
session_start();
$ss=$_SESSION['arr_str'];
echo $ss;
print_r(unserialize($ss));
















 ?>