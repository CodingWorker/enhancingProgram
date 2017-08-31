package com.test.thread.userun;


/**
 * Created by daiya on 2017/8/30.
 */
public class Demo {
    public static void main(String[] args){
        System.out.println("主线程：ID=>"+Thread.currentThread().getId());
        new Thread(new TestThread("thread1")).start();
        new Thread(new TestThread("thread2")).run();//直接调用
    }
}

class TestThread implements Runnable{
    private String name;
    public TestThread(String name){
        this.name=name;
    }
    @Override
    public void run(){
        System.out.println("子线程：ID=>"+Thread.currentThread().getId()+" name=>"+this.name);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
