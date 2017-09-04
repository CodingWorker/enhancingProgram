<?php 
class Person{
	public $name;
	public $age;
	public $score;

	public static $msg;
	const TERM = 'this is a test';

	public function __construct($name,$age,$score){
		$this->name=$name;
		$this->age=$age;
		$this->score=$score;

		self::$msg='name: ' . $this->name . ', age: ' . $this->age . ', score: ' . $this->score;
	}

	public function toString(){
		return json_encode($this);
	}

	public function getMsg(){
		return self::$msg;
	}
}

$person=new Person('Daniel',12,100);
var_dump($person->getMsg());
var_dump($person->toString());
var_dump(Person::$msg);
var_dump(Person::TERM);
var_dump(get_defined_constants());

