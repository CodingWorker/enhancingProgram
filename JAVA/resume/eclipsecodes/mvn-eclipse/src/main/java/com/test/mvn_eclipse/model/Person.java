package com.test.mvn_eclipse.model;

public class Person {
	private String name;
	private int age;
	private int score;
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setAge(int age) {
		this.age=age;
	}
	
	public int getScore() {
		return this.score;
	}
	
	public void setScore(int score) {
		this.score=score;
	}
	
	@Override
	public String toString() {
		return "{\"name\":\""+this.name+"\",\"age\":"+this.age+",\"score\":"+this.score+"}";
	}
}
