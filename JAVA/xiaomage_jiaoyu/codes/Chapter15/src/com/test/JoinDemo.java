package com.test;

/**
 * Created by DaiYan on 2017/9/11.
 */
class Join extends Thread{
    @Override
    public void run() {
        for(int i=0;i<50;i++){
            System.out.println("join"+i);
        }
    }
}
public class JoinDemo {
    public static void main(String[] args)throws Exception{
        Thread join=new Join();
        for(int i=0;i<50;i++){
            System.out.println("main"+i);
            if(i==10){
                join.start();
            }

            if(i==20){
                join.join();
            }
        }
    }
}
