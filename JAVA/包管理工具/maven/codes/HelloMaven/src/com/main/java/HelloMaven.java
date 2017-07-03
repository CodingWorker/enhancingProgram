package com.main.java;

import org.junit.Test;
import static junit.framework.Assert.*;

public class HelloMaven{
	public static void main(String[] args){
		System.out.println(sayHello());
	}

	public static String sayHello(){
		return "Hello maven";
	}
}
