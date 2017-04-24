package aboutthread.producerandconsumer;

import com.sun.deploy.association.utility.WinRegistryUtil;
import com.sun.deploy.security.TrustDecider;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class SharedResource {
    private String name;
    private String gender;
    private boolean isEmpty=true;//用来表示对象是否已经被生产或消费

   synchronized public void push(String name,String gender){
       if(!this.isEmpty)
           try {
               this.wait();
           }catch(InterruptedException e){
               e.printStackTrace();
               //log
           }

        this.name=name;
        try{
            Thread.sleep(10);//当前线程等待，其他线程能够操作
        }catch(InterruptedException e){
            e.printStackTrace();
        }
        this.gender=gender;
       this.isEmpty=false;
       this.notify();
    }

   synchronized public void popup(){
       if(isEmpty)
           try {
               this.wait(); //使用同步锁对象来调用，当前线程释放锁，进入到等待池中等待唤醒
           }catch(InterruptedException e){
               e.printStackTrace();
               //log
           }
        try{
            Thread.sleep(10);
        }catch(InterruptedException e){
            e.printStackTrace();
        }
       System.out.println(this.name+"-"+this.gender);
       this.isEmpty=true;
       this.notify();//使用当前同步锁来调用，唤醒其他的锁，当前线程和其他锁进入到锁池中等待jvm调用
    }
}
