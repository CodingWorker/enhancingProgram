package com.test.study.lambdademo;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class AnonymousClassDemo {
    public static void main(String[] args) {
        //lambda替换匿名类
        //1.语句
        new Thread(()-> System.out.println("hello")).start();
        new Thread(()->{
            int i=1;
            for(;;){
                if(i++>10){
                    break;
                }

                try{
                    Thread.sleep(500);
                }catch(InterruptedException ex){
                    ex.printStackTrace();
                }

                System.out.println(i);
            }
        }).start();
    }
}
