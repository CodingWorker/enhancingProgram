<?php
$str="abc";
var_dump((object)$str);/*输出：
                        class stdClass#1 (1) {
                        public $scalar =>
                        string(3) "abc"
                        }
                        */

$num = 12;
var_dump((object)$num);/*
                        class stdClass#1 (1) {
                        public $scalar =>
                        int(12)
                        }
                        */
$arr=[1,2,4,'a','b','c','d'=>'dd'];
var_dump((object)$arr);/*
                        class stdClass#1 (7) {
                        public ${0} =>
                        int(1)
                        public ${1} =>
                        int(2)
                        public ${2} =>
                        int(4)
                        public ${3} =>
                        string(1) "a"
                        public ${4} =>
                        string(1) "b"
                        public ${5} =>
                        string(1) "c"
                        public $d =>
                        string(2) "dd"
                        }*/

