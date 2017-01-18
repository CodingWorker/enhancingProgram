<?php
$url="http://api2.tv.moliv.cn/moli20/moli-tv/videolive?";

$fp=fopen($url,'r');
$meta_data=stream_get_meta_data($fp);
var_dump($meta_data['wrapper_data'][5]);