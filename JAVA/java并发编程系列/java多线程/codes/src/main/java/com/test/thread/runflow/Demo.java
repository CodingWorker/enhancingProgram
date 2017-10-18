package com.test.thread.runflow;

/**
 * Created by daiya on 2017/8/30.
 */
public class Demo {
    public static void main(String[] args){
        //即使是共享资源(改对象的所有资源被由它产生的线程共享），他们每个线程的执行也是按照线程对象的run方法依次执行的
        TestThread testThread=new TestThread();
        new Thread(testThread).start();
        new Thread(testThread).start();
        new Thread(testThread).start();
        new Thread(testThread).start();
    }
}
