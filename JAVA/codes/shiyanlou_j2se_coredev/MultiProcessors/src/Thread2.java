/**
 * Created by DaiYan on 2017/2/4.
 */
public class Thread2 implements Runnable {
    public void run(){
        for(int i=0;i<100;i++){
            System.out.println("Thread2: "+i);
            if(i%10==0){
                try{
                    this.wait(10);
                }catch(Exception e){

                }
            }
        }
    }
}
