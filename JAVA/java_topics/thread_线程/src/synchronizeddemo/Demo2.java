package synchronizeddemo;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Apple2 implements Runnable {
    private int num = 150;

    /**
     * 同步方法
     * 对于非静态方法此时的同步锁是当前对象
     * 对于静态方法此时的同步锁是当前类的字节码
     */
    @Override
    public void run() {
        for (; num >= 0; ) {
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
                //log
            }
            eat();
        }
    }

    synchronized public void eat(){//这将导致第一个执行到这里的线程执行此方法直到退出
        if(this.num>=0)
            System.out.println(Thread.currentThread() + "吃了第 " + this.num-- + "苹果");
    }
}

public class Demo2 {
    public static void main(String[] args) {
        //创建三个线程吃苹果，三个线程共享一个线程对象
        //A B C为线程的名字而不吃苹果的人
        //如果分别用对象来创建thread就使得各个对象使用自己的num
        Apple2 a = new Apple2();
        new Thread(a, "A").start();
        new Thread(a, "B").start();
        new Thread(a, "C").start();
    }
}
