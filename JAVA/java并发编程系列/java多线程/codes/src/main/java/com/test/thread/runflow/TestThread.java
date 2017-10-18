package com.test.thread.runflow;


/**
 * Created by daiya on 2017/8/30.
 */
public class TestThread implements Runnable{
    private Object lock=new Object();
    private int count=0;
    @Override
    public void run(){
        System.out.println(Thread.currentThread().getId()+" IN run");
        run1();
    }

    public void run1(){
        System.out.println(Thread.currentThread().getId()+" IN run1");
        synchronized (lock){
            try{
                Thread.sleep(1000);
            }catch(InterruptedException ex){}
        }

        count++;
        run2();
    }

    public void run2(){
        System.out.println(Thread.currentThread().getId()+" IN run2");
        System.out.println(this.count);
        run3();
    }

    public void run3(){
        System.out.println(Thread.currentThread().getId()+" IN run3");
    }
}
