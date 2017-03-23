<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/3/5
 * Time: 18:51
 */
var_dump(get_headers("http://www.baidu.com"));
var_dump(http_build_query([
    1,
    'AB',
    "a"=>1,
    "b"=>'bb'
],'num','#',PHP_URL_QUERY));
var_dump(parse_url("http://www.baidu.com/?a=1&c=2"));
var_dump(urlencode("http //www.baidu.com"));
var_dump(rawurlencode("http //www.baidu.com"));