package com.test.concurrency.demo0;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by DaiYan on 2017/9/9.
 */
public class AtomicIntegerDemo {
    public static void main(String[] args){
        AtomicInteger atomicInteger=new AtomicInteger();
        System.out.println(atomicInteger.get());//0

        //设置并获取,先加再返回
        System.out.println(atomicInteger.addAndGet(2));//2
        System.out.println(atomicInteger.get());//2

        //如果与期望值相等则更新为目标值，并返回true
        if(atomicInteger.compareAndSet(1,2)){//false
            System.out.println("update to 2");
            System.out.println(atomicInteger.get());
        }

        if(atomicInteger.compareAndSet(2,3)){
            System.out.println("update to 3");//update to 3
            System.out.println(atomicInteger.get());//3
        }

        //减1并返回值,先减后返回
        System.out.println(atomicInteger.decrementAndGet());//2

        //相加,返回的为原值
        System.out.println(atomicInteger.getAndAdd(2));//2

        System.out.println(atomicInteger.get());//4

        //返回原值
        System.out.println(atomicInteger.getAndDecrement());//4
        System.out.println(atomicInteger.get());//3

        //返回原值
        System.out.println(atomicInteger.getAndIncrement());//3
        System.out.println(atomicInteger.get());//4

        //返回原值
        System.out.println(atomicInteger.getAndSet(5));//4
        System.out.println(atomicInteger.get());//5

        System.out.println(atomicInteger.incrementAndGet());//6

        atomicInteger.lazySet(10);
        System.out.println(atomicInteger.get());//10

        atomicInteger.set(12);
        System.out.println(atomicInteger.get());//12
    }
}
