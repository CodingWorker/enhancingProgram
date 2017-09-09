package com.test.concurrency.demo0;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/**
 * Created by DaiYan on 2017/9/9.
 */
public class FieldUpdaterDemo {
    class DemoData{
        public volatile int value1=1;
        volatile int value2=2;
        protected volatile int value3=3;
        private volatile int value4=4;
    }

    AtomicIntegerFieldUpdater<DemoData> getUpdater(String fieldName){
        return AtomicIntegerFieldUpdater.newUpdater(DemoData.class, fieldName);
    }

    void doIt(){
        DemoData demo=new DemoData();
        //返回原值
        System.out.println("before:1 ==>"+getUpdater("value1").getAndSet(demo,11));
        System.out.println("after:1 ==>"+getUpdater("value1").get(demo));
        System.out.println("before:2 ==>"+getUpdater("value2").getAndSet(demo,12));
        System.out.println("after:2 ==>"+getUpdater("value2").get(demo));
        System.out.println("before：3 ==>"+getUpdater("value3").getAndSet(demo,13));//抛出异常，没有访问权限
        System.out.println("after:3 ==>"+getUpdater("value3").get(demo));
        System.out.println("before：4 ==>"+getUpdater("value4").getAndSet(demo,14));//抛出异常，没有访问权限
        System.out.println("after:4 ==>"+getUpdater("value4").get(demo));
    }

    public static void main(String[] args){
        FieldUpdaterDemo demo=new FieldUpdaterDemo();
        demo.doIt();
    }
}
