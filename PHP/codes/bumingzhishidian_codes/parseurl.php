<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/3/30
 * Time: 9:28
 */

var_dump(http_build_query([
    1,
    'AB',
    "a"=>1,
    "b"=>'bb'
],'num','#',PHP_URL_QUERY));
