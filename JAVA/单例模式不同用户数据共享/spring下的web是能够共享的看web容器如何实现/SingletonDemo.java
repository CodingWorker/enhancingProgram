package com.htiiot.resources.portal.controller;

/**
 * Created by daiya on 2017/8/31.
 */
public class SingletonDemo {
    private static final SingletonDemo SINGLETON_DEMO=new SingletonDemo();
    private int count;

    private SingletonDemo(){this.count=0;}

    public static SingletonDemo getInstance(){return SINGLETON_DEMO;}

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
