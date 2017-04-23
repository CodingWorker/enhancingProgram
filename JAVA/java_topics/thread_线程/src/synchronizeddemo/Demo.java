package synchronizeddemo;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Apple1 implements Runnable{
    private int num=150;
    @Override
    public void run(){
        synchronized (this){ //这里将导致第一个到达这里的一直执行这个循环直到同步代码块的结尾
            for (;num>=0;) {
                try {
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    //log
                }

                //同步代码代码块
                //synchronized (this){//同步这里导致只要拿到的num>0就会进来，最后会出现-1 -2的消费，应为只有在
                //执行到这里时才由一个线程执行
                //锁可以理解为在对象上标记了一下，如果其他线程看到该锁有标记就等待直到锁释放标记消
                System.out.println(Thread.currentThread() + "吃了第 " + this.num-- + "苹果");
            }
        }
    }
}

public class Demo {
    public static void main(String[] args){
        //创建三个线程吃苹果，三个线程共享一个线程对象
        //A B C为线程的名字而不吃苹果的人
        //如果分别用对象来创建thread就使得各个对象使用自己的num
        Apple1 a=new Apple1();
        new Thread(a,"A").start();
        new Thread(a,"B").start();
        new Thread(a,"C").start();
    }

}
