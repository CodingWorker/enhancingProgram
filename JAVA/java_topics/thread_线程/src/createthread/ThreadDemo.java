package createthread;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Test extends Thread{
    private String Name;
    public Test(String name){
        this.Name=name;
    }
    public void run(){
        for (int i = 0; i <50 ; i++) {
            System.out.println(this.Name+":playMusics..."+i);
        }
    }
}

public class ThreadDemo {
    public static void main(String[] args) {
        //创建线程对象并启动
        Test t = new Test("A");
        Test t2=new Test("B");

        //使用匿名类的方式
        new Thread(){
            @Override
            public void run(){
                for (int i = 0; i <50 ; i++)
                    System.out.println("C:playMusics..."+i);
            }
        }.start();
        t.start();
        t2.start();
    }
}
