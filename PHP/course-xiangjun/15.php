<style>
.bd{border:1px solid red;}




</style>




<?php
/*
ѭ�����
while(){
    ����Σ�
}

$houdunwang=1;
while($houdunwang<100){
    echo $houdunwang++."<br/>";
	}
set_time_limit(1); >
*/
$i=1;
echo "<table>";
while($i<=9){
    $j=1;
	echo "<tr>";
	while($j<=$i){
		echo "<td class='bd'>";
	    echo $i."*".$j."=".$i*$j;
		$j++;
		echo "</td>";
	}
	$i++;
	echo "</tr>";
	}
echo "</table>";

?>