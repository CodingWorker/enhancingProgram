<?php

class beers{
    const softdrink='rootbeer';
    public $ale='ipa';

}

$rootbeer='A & W';
$ipa='alexander keith\'s';
$cc=new beers();
echo "i'd like an {${beers::softdrink}} \n";      //可变变量
echo "i'd like an {$cc->ale}"; 
 
