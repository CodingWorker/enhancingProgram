package com.test.testcodes;

/**
 * Created by Administrator on 2017/2/3.
 */
public class HelloChild extends Hello {
    public final static int c=12;
    public HelloChild(){
        System.out.println("hello child");
        super.test();
    }

    public void test(){
        System.out.println("test is been overrided");
    }

    public void tt(){
        System.out.println("tt is been called");
    }
}
