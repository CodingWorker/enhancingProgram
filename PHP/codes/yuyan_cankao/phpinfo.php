<?php
$host='192.168.100.249';
$port=11211;
$mem=new Memcache();
$mem->connect($host,$port);
$items=$mem->getExtendedStats ('items');
$items=$items["$host:$port"]['items'];
foreach($items as $key=>$values){
$number=$key;;
$str=$mem->getExtendedStats ("cachedump",$number,0);
$line=$str["$host:$port"];
// var_dump($line);die;
if( is_array($line) && count($line)>0){
    foreach($line as $key=>$value){
        echo $key.'=>';
        echo ($mem->get($key)) . '<br />';
        echo "<br />";
}
}
}