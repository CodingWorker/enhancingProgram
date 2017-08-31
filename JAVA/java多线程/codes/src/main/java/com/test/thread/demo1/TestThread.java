package com.test.thread.demo1;


/**
 * Created by daiya on 2017/8/30.
 */
public class TestThread implements Runnable {
    private String name;
    private int count=4;

    public TestThread(String name){
        this.name=name;
    }

    @Override
    public void run(){
        countToZero();
    }

    public void countToZero(){
        for(;count>=0;){
            System.out.println(this.name+" counting: "+this.count--);
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
