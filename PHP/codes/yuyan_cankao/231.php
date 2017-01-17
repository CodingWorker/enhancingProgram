<?php
$ops=[
    'socket'=>[
        'bindto'=>'192.168.0.100:0'    //系统自己决定端口
    ]
];

$opts=[
    'socket'=>[
        'bindto'=>'192.168.0.100:7000'   //同时设置了ip和端口
    ]
];

$ops=[
    'socket'=>[
        'bindto'=>'0:7000'     //系统自己决定ip
    ]
];

$context=stream_context_create($ops);
var_dump($context);    //resource(4) of type (stream-context)
echo file_get_contents("http://www.baidu.com",false,$context);