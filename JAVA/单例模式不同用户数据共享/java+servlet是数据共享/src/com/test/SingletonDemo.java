package com.test;

/**
 * Created by daiya on 2017/8/31.
 */
public class SingletonDemo {
    private int count;
    private static final SingletonDemo SINGLETON_DEMO=new SingletonDemo();
    private SingletonDemo(){
        this.count=0;
    }

    public static SingletonDemo getInstance(){
        return SINGLETON_DEMO;
    }

    public void incrCount(int incr){
        this.count+=incr;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
