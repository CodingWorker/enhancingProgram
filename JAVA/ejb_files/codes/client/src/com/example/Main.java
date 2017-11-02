package com.example;

import javax.naming.InitialContext;

/**
 * Created by daiya on 2017/7/10.
 */
public class Main {
    public static void main(String[] args)throws Exception{
        //获取上下文对象
        InitialContext context=new InitialContext();

        //获取远程对象
        hello=(Hello)context.lookup("/com/example/remote");
        System.out.println(hello.sayHello());

    }
}
