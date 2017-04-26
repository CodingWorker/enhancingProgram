package threadsafe;

import java.io.StringBufferInputStream;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Test implements Runnable{
//    private StringBuilder sb=new StringBuilder("");//stringbuilder不是线程安全的
    private StringBuffer sb=new StringBuffer("");//stringbuffer是线程安全的
    private int sum=117;
    @Override
    public void run(){
        for (;sum>=0;) {
            strAppend();
        }
    }

    public void strAppend(){
        if(sum>=0)
            System.out.println(Thread.currentThread()+this.sb.append((char)sum--).toString());
    }

}

public class StringBuilderDemo {
    public static void main(String[] args){
        Test t=new Test();
        new Thread(t,"A").start();
        new Thread(t,"B").start();
        new Thread(t,"C").start();
    }
}
