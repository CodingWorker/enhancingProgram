<?php
// current directory
	echo  getcwd () .  "\n" ;
	 chdir ( 'f:/' );
	 // current new directory
	 echo  getcwd () .  "\n" ;
     
     var_dump(file_get_contents('test.txt'));