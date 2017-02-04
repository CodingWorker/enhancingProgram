/**
 * Created by DaiYan on 2017/2/4.
 */
public class Main {
    public static void main(String[] args){
        Thread1 t1=new Thread1();
        Thread2 t2=new Thread2();
        Thread t=new Thread(new Thread2());

        //启动线程
//        t.start();
        t1.start();
        t2.run();     //这样也是一个线程，交替执行

    }

}
