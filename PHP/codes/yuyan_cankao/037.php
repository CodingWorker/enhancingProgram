<?php
function get(){
    return [1,2,3,4,'a'=>'a'];
}

echo get()['a'];