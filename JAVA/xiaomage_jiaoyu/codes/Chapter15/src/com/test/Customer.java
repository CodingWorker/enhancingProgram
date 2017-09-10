package com.test;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Customer implements Runnable {
    @Override
    public void run() {
        while(true){
            try{
                consume();
            }catch(InterruptedException ex){
                ex.printStackTrace();
            }

        }
    }

    private void consume()throws InterruptedException{
        if(Coordinator.getProductCount()>0){
            System.out.println("消费了一个："+Coordinator.getProductCount());
            Thread.sleep(3000);
        }
    }
}
