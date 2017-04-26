package aboutthread.producerandconsumer;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class TestDemo {
    public static void main(String[] args){
        //创建共享的资源对象
        SharedResource res=new SharedResource();

        //启动生产者线程
        new Thread(new Producer(res)).start();

        //启动消费者线程
        new Thread((new Consumer(res))).start();
    }
}
