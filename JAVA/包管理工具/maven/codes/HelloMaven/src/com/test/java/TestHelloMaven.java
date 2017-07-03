package com.test.java;

import com.main.java.HelloMaven;
import org.junit.Test;
import static junit.framework.Assert.*;

public class TestHelloMaven{
	@Test
	public void testSayHello(){
		HelloMaven hm=new HelloMaven();
		String result=hm.sayHello();

		assert.assertEquals(result,"Hello Maven");
	}
}