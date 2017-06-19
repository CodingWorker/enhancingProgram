<?php
$path='E:/SimulatedVideoEdit.aspx';
var_dump(is_writable($path));
var_dump(is_readable($path));
var_dump(file("E:/temp.txt"));