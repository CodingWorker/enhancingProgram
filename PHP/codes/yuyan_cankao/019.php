<?php
class foo{
    public $foo;
    public $bar;
    public function foo(){
        $this->foo='foo';
        $this->bar=['bar1', 'bar2', 'bar3'];
    }
}

$foo=new foo();
$name = 'myname';
$str=<<<eof
this is a class and the variatbles are
the first variable:$foo->foo 
the second variale:$foo->bar

the variables in foo class are above!.
eof;
echo $str;