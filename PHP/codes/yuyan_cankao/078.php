<?php
$output=` dir `;      //可执行shell命令
var_dump($output);
$cc=shell_exec("dir");
var_dump($cc);