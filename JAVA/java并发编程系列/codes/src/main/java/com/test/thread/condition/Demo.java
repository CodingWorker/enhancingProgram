package com.test.thread.condition;

import sun.util.resources.cldr.ka.LocaleNames_ka;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by DaiYan on 2017/9/12.
 */
class ConditionTest{
    private int threadNum;//@@池中线程的数量

    private AtomicInteger threadAlive = new AtomicInteger();//@@活跃的线程数

    private ReentrantLock reentrantLock = new ReentrantLock();

    private Condition condition = reentrantLock.newCondition();

    private ExecutorService executorService;

    public ConditionTest(int threadNum,ExecutorService executorService){
        this.threadNum=threadNum;
        this.executorService=executorService;
    }

    public void execute(final Runnable runnable) {
        if (threadAlive.get() >= threadNum) {
            try {
                reentrantLock.lock();
                while (threadAlive.get() >= threadNum) {
                    try {
                        condition.await();
                    } catch (InterruptedException e) {
                    }
                }
            } finally {
                reentrantLock.unlock();
            }
        }

        threadAlive.incrementAndGet();//增加了一个线程
        executorService.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    runnable.run();
                } finally {
                    try {
                        reentrantLock.lock();
                        threadAlive.decrementAndGet();
                        condition.signal();
                    } finally {
                        reentrantLock.unlock();
                    }
                }
            }
        });
    }

}

public class Demo {

}
