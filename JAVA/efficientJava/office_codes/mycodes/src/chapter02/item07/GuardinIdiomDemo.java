package chapter02.item07;

/**
 * Created by DaiYan on 2017/4/19.
 */
class Super{
    @Override
    public void finalize(){
        System.out.println("Super.finalize is called");
    }
}

class Child extends Super {
    private Object finalizerGuardin = new Object() {
        @Override
        protected void finalize() throws Throwable{
            super.finalize();
            try {
                //finalize the outter object
                System.out.println("Child.finalize is called");
                super.finalize();
            } finally {

            }
        }
    };

    @Override
    public void finalize(){
        System.out.println("Child is being finalized");
    }

}

public class GuardinIdiomDemo {
    public static void main(String[] args){
        Child c=new Child();
        c.finalize();
    }
}
