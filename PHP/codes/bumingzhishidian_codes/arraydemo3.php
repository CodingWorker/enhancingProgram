<?php
$arr1=array('class1'=>'PHP课程','index_arr'=>['a','课程','cc'=>'Cc'],'class2'=>'mysql课程','webname'=>'后盾网','weburl'=>'houdunwang.com');

var_dump(array_filter($arr1,function($a){
    if(is_array($a)){
        return array_key_exists('cc',$a) ? true:false;
    }

     if(strpos($a,'课程') !==false){
        return true;
    }else{
     return false;
    }
}));

@var_dump(array_flip($arr1));    //只能够交换字符串和数字类型的值Can only flip STRING and INTEGER values!
 