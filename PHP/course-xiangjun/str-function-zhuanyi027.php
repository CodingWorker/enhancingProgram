<?php
/*




*/
//addslashes()  在预定义字符串前添加反斜杠,包括单引号\'，双引号\",反斜线\\,与null字符
echo addslashes("ffaf“’adfa''adfa''\'nuklfd");


//stripslashes()  addslashes转义的反函数，将转义之前的反斜杠删除
echo stripslashes(addslashes("afafdfd'as'\'a\'/aaf.\asdf'af"));//输出 afafdfd'as'\'a\'/aaf.\asdf'af

//get_magic_quotes_gpc()   获取PHP.ini中是否开启自动转义
var_dump(get_magic_quotes_gpc());//返回false,说明没有开启






















?>