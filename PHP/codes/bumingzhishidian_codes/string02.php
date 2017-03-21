<?php

$str="abc*?\d'\\e']f[g\h.inull";
var_dump(addcslashes($str,"'[]\\"));
echo  "\n";
var_dump(addslashes($str));