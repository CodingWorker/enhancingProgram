<?php
$a=1;
switch($a){
    default:
        echo 'default';
        break;
    case 1:
        echo '1';       //即使default写在了前面也会执行先case，直到所有case后才执行default
}