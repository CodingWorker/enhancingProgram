<?php
namespace myproject\sub_pro\a\b;
class a{}
function aa(){}
const THECONST=12;
$constName=__NAMESPACE__ . '\THECONST';
var_dump(constant($constName));        //输出12