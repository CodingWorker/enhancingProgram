package applequestion;

/**
 * Created by DaiYan on 2017/9/10.
 */
class EatApple extends Thread{
    private int count=100;
    public EatApple(String name){
        super(name);
    }
    public EatApple(){}
    @Override
    public void run(){
        try{
            eat();
        }catch(InterruptedException ex){
            ex.printStackTrace();
        }
    }

    public synchronized void eat()throws InterruptedException {
        for (; count > 0; ) {
            System.out.println(Thread.currentThread().getName() + " :apple left: " + count);
            count--;
            sleep(10);
        }
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}

public class Main {
    public static void main(String[] args){
        EatApple eatApple=new EatApple();
        new Thread(eatApple).start();
        new Thread(eatApple).start();
        new Thread(eatApple).start();
    }
}
