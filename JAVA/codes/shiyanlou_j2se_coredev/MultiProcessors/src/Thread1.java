/**
 * Created by DaiYan on 2017/2/4.
 */
public class Thread1 extends Thread {
    public void run(){
        for(int i=0;i<100;i++){
            System.out.println("Thread1: "+i);
            try{
                Thread.sleep(10000);
            }catch(Exception e){
                continue;
            }

        }
    }
}
