package com.test.thread.compare;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * Created by daiya on 2017/8/30.
 */
public class Demo {
    public static void main(String[] args){
        Demo demo=new Demo();

//        sleep不会释放锁,调用后当前线程进入休眠状态，如果没有占用锁的话由其他线程占用CPU
//        TestThread1 testThread=demo.new TestThread1();
//        new Thread(testThread).start();
//        new Thread(testThread).start();

//        TestThread2 testThread2=demo.new TestThread2();
//        new Thread(testThread2).start();
//        new Thread(testThread2).start();

        TestThread3 testThread3=demo.new TestThread3();
        new Thread(testThread3).start();
        new Thread(testThread3).start();
    }

//    class TestThread1 implements Runnable{
//        private int count=0;
//        private Object lock=new Object();
//        @Override
//        public void run(){
//            synchronized (lock){
//                lock.notifyAll();//第二个执行的线程到此会唤醒第一个线程的wait，从而进入就绪状态
//                count++;
//                System.out.println("current thread id: "+Thread.currentThread().getName()+ ", count: "+count);
//                try{
////                    Thread.currentThread().sleep(100);
//                    lock.wait();//当前线程处于等待状态，等待被唤醒，如果美有唤醒的线程那么主进程不会停止
//                }catch(InterruptedException ex){}
//
//                count++;
//                System.out.println("current thread id: "+Thread.currentThread().getName()+", count: "+count);
//            }
//        }
//    }

//    class TestThread2 implements Runnable{
//        private int count=0;
//        @Override
//        public void run(){
//            System.out.println("Thread-name: "+Thread.currentThread().getName()+", count: "+this.count++);
//            try{
//                System.out.println("Thread-name: "+Thread.currentThread().getName()+", count: "+this.count++);
//                Thread.currentThread().sleep(100);
//                System.out.println("Thread-name: "+Thread.currentThread().getName()+", count: "+this.count++);
//            }catch(InterruptedException ex){}
//            System.out.println("Thread-name: "+Thread.currentThread().getName()+", count: "+this.count++);
//        }
//    }

    class TestThread3 implements Runnable{
        public List<String> list=new ArrayList<>();
        @Override
        public void run(){
            list.add("1");
            System.out.println(list.size());
            for(String str:list){
                System.out.println(str);
            }
        }
    }
}
