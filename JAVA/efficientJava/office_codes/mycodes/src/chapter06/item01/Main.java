package chapter06.item01;

/**
 * Created by DaiYan on 2017/4/13.
 */
public class Main {
    public static void main(String[] args){
        double x=1;
        double y=2;
        for(Operation op:Operation.values()){
            System.out.printf("%s %s %s = %s\n",x,op,y,op.apply(x,y));
        }

        //test get enum from string
        String symble="+";
        Operation op=Operation.getFromString(symble);
        System.out.println(op);
    }
}
