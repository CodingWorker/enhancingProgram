<?php
/*
循环语句
do-while语句
do{
    代码段
}while(表达式);

for 语句
for(表达式1;条件判断语句;表达式增量){
    代码段
}


*/
$i=1;
$sum=0;
do{
    $sum+=$i;
	$i++;
	}while($i<100);
echo $sum."<br/>";
for($i=1;$i<100;$i++){
    echo $i."<br/>";
	}

?>