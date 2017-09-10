package applequestion;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by DaiYan on 2017/9/10.
 */
class Eatapple2 implements Runnable {
    private int count = 100;
    //    Object lock=new Object();
    private final Lock lock = new ReentrantLock();

    public Eatapple2() {
    }

    @Override
    public void run() {
        eat();
    }

    private void eat() {
        try {
            for (int i = 0; i < 100; i++) {
//                synchronized (this){
//                    if(count>0){
//                        System.out.println(Thread.currentThread().getName() + " eat No." + count);
//                        count--;
//                    }
//                }

                lock.lock();
                if (count > 0) {
                    System.out.println(Thread.currentThread().getName() + " eat No." + count);
                    count--;
                }

                Thread.sleep(10);
                lock.unlock();
            }
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }
    }
}
public class StaticResource {
    public static void main(String[] args){
        System.out.println("=====main start======");
//        new Eatapple2("A").start();
//        new Eatapple2("B").start();
//        new Eatapple2("C").start();
        Eatapple2 eatapple2=new Eatapple2();
        new Thread(eatapple2,"A").start();
        new Thread(eatapple2,"B").start();
        new Thread(eatapple2,"C").start();
        System.out.println("=====main end======");
    }
}
