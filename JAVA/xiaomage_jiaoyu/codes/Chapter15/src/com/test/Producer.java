package com.test;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Producer implements Runnable{
    @Override
    public void run() {
        while(true){
            try{
                produce();
            }catch(InterruptedException ex){
                ex.printStackTrace();
            }
        }
    }

    public void produce()throws InterruptedException {
        if (Coordinator.getProductCount() < 5) {
            Coordinator.setProductCount(Coordinator.getProductCount() + 1);
            System.out.println("生产了："+Coordinator.getProductCount());
            Thread.sleep(3000);
        }
    }
}
