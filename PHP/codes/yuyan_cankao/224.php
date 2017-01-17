<?php
file_get_contents('http://www.baidu.com');
var_dump($http_response_header);    //此时此函数包含的是baidu网响应的头部