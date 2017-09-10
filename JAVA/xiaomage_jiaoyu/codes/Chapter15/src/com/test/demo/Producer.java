package com.test.demo;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Producer implements Runnable {
    private SharedResource sharedResource;

    public Producer(SharedResource sharedResource) {
        this.sharedResource = sharedResource;
    }

    @Override
    public void run() {
        for (int i = 0; i < 50; i++) {
            if (i % 2 == 0) {
                sharedResource.push(i + "=>春哥哥", "男");
            } else {
                sharedResource.push(i + "=>凤姐", "女");
            }
        }
    }
}
