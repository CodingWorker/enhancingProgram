package aboutthread.producerandconsumer;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class Consumer implements Runnable{
    private SharedResource consumption;
    public Consumer(SharedResource res){
        this.consumption=res;
    }

    public void run(){
        for (int i = 0; i <50 ; i++) {
            this.consumption.popup();
        }
    }


}
