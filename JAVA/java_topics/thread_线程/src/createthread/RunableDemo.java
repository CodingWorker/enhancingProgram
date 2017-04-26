package createthread;

import java.rmi.Naming;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Test2 implements Runnable{
    private String Name;
    public Test2(String name){
        this.Name=name;
    }
    public void run(){
        for (int i = 0; i <50 ; i++) {
            System.out.println(this.Name+":playMusics..."+i);
        }
    }
}

public class RunableDemo {
    public static void main(String[] args) {
        //创建线程对象比你执行start方法
        Thread t = new Thread(new Test2("A"));
        Thread t2 = new Thread(new Test2("B"));
        //使用匿名内部类来实现
        Thread t3=new Thread(new Runnable(){
            private String Name="C";

            @Override
            public void run() {
                for (int i = 0; i <50 ; i++)
                    System.out.println(this.Name+":playMuiscs..."+i);
            }
        });
        t.start();
        t2.start();
        t3.start();
    }
}
