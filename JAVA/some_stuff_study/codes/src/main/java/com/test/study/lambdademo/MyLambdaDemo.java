package com.test.study.lambdademo;

import jdk.nashorn.internal.objects.annotations.Function;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public interface MyLambdaDemo {
    void test();
//    void test2();//两个方法的话则不能
}

class Main{
    public static void main(String[] args) {
        MyLambdaDemo myLambdaDemo=()-> {
            System.out.println("my lambda demo ok");
        };

        myLambdaDemo.test();
    }
}
