<?php
declare (ticks=1);
function tick_handler(){
    echo "tick_handler() called\n";
}

register_tick_function('tick_handler');
$a=1;
if($a>0){
    $a+=2;
    echo $a;
}
