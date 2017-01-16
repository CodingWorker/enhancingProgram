<?php
namespace pa;
class a{};
function aa(){}
const MYCONST="CLASS_pa";

namespace pb;  //之后书写的多有代码如果没有新的命名空间定义，将都属于pb
class a{}
function aa(){}
const MYCONST="CLASS_pb";
var_dump(MYCONST);     //输出pb
var_dump(\pa\MYCONST); //pa
var_dump(\pb\MYCONST); //pb