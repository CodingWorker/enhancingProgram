<?php
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
// $str=" CURRENT output";
// echo convert_uudecode(convert_uuencode($str));
$text  =  "The quick brown fox jumped over the lazy dog." ;
 $newtext  =  wordwrap ( $text ,  20 ,  "<br />" );
echo  $newtext ;








?>