<?php
$a=12;
echo $a;
goto a;
echo 'a';
a:{
    $b='b';
    echo $b;
    goto b;
    echo 'bb';
    b:{
        echo 'c';
        goto c;
        echo 'cc';
    }
    c:
    goto d;   //只能是a b c 但不能是a外面的
    d:{
        
    }
}
