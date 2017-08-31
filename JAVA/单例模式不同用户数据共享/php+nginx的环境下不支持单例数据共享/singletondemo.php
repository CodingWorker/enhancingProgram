<?php

namespace demo;

class SingletonDemo{
	private $count;
	private static $__instance;
	private function __construct(){
		$this->count = 0;
	}

	public static function getInstance(){
		if(self::$__instance == null || !isset(self::$__instance)){
			self::$__instance = new SingletonDemo();
		}

		return self::$__instance;
	}

	public function incrCount($incr){
		$this->count+=$incr;
	}

	public function getCount(){
		return $this->count;
	}
}

