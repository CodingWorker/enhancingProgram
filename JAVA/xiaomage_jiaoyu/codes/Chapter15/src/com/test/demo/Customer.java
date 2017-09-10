package com.test.demo;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Customer implements Runnable {
    private SharedResource sharedResource;
    public Customer(SharedResource sharedResource){
        this.sharedResource=sharedResource;
    }

    @Override
    public void run() {
        for (int i = 0; i < 50; i++) {
            sharedResource.pop();
        }
    }
}
