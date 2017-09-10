package com.test.demo;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Main {
    public static void main(String[] args){
        SharedResource sharedResource=new SharedResource();
        new Thread(new Producer(sharedResource)).start();
        new Thread(new Customer(sharedResource)).start();
    }
}
