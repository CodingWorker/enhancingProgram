<?php
$str="abc";
var_dump(bin2hex($str));

var_dump(rtrim($str,'bc'));

$cnStr="不明知识点";

var_dump(chop($cnStr,'知识点'));