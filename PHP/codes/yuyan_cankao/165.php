<?php
$trace  =  debug_backtrace ();
trigger_error ("1",E_USER_NOTICE );

var_dump(debug_backtrace());