package aboutthread.lockdemo.producerandconsumer;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class Producer implements Runnable{
    private SharedResource product;
    public Producer(SharedResource res){
        this.product=res;
    }

    public void run(){
        for (int i = 0; i <50 ; i++) {
            if(i%2==0)
                product.push("春哥哥","男");
            else
                product.push("凤姐","女");
        }
    }
}
