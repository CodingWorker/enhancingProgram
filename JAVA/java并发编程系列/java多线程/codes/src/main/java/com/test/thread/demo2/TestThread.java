package com.test.thread.demo2;

/**
 * Created by daiya on 2017/8/30.
 */
public class TestThread implements Runnable{
    private Object lock=new Object();
    private int count=20;

    @Override
    public void run(){
        for(;count>=0;){
            countToZero();
        }
    }

    public void countToZero() {
        try{
            Thread.sleep(100);
        }catch(InterruptedException ex){}
        System.out.println(Thread.currentThread()+"FUNC : countToZero => " + count--);

        sout(count);
    }

    public void sout(int index){
        System.out.println(Thread.currentThread()+"FUNC : sout => "+index);
    }
}
