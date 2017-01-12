<?php
$cc=` php 75.php`;     #执行75.php，执行结果复制到$cc
var_dump($cc);
var_dump(gettype($cc));  #string
var_dump(shell_exec("dir"));