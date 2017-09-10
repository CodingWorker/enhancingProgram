package com.test;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class Main {
    public static void main(String[] args){
        System.out.println("=====main start====");
        new Thread(new Producer()).start();
        new Thread(new Customer()).start();
        System.out.println("=====main end====");
    }
}
