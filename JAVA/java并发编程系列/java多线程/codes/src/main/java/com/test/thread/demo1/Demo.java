package com.test.thread.demo1;


/**
 * Created by daiya on 2017/8/30.
 */
public class Demo {
    public static void main(String[] args){
        //每次实例化，独享自己的数据空间
        Thread t1=new Thread(new TestThread("A"));
        Thread t2=new Thread(new TestThread("B"));

        t1.start();
        t2.start();
    }
}
