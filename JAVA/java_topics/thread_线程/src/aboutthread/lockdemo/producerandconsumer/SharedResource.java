package aboutthread.lockdemo.producerandconsumer;

import sun.misc.Lock;

import java.util.concurrent.locks.AbstractQueuedLongSynchronizer;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class SharedResource {
    private String name;
    private String gender;
    private boolean isEmpty = true;
    private final java.util.concurrent.locks.Lock lock = new ReentrantLock();//使用锁机制
    private Condition condition = lock.newCondition();

    public void push(String name, String gender) {
        lock.lock();//获取锁
        try {
            //代码块
            while (!isEmpty) {//isEmpty会在线程等待期间被其他的共享此资源的线程更改，所以不需要break
                condition.await();
            }
            this.name = name;
            Thread.sleep(10);//当前线程等待，其他线程能够操作
            this.gender = gender;
            isEmpty = false;
            condition.signalAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();//释放锁
        }
    }

    public void popup() {
        lock.lock();
        try {
            //代码块
            while (isEmpty) {
                condition.await();
            }
            Thread.sleep(10);
            System.out.println(this.name + "-" + this.gender);
            isEmpty = true;
            condition.signalAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
            //log
        } finally {
            lock.unlock();
        }
    }
}
