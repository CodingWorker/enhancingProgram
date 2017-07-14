package chapter06.item31;

import java.util.HashMap;

/**
 * Created by DaiYan on 2017/4/13.
 */
public enum Operation {
    PLUS("+"){
        double apply(double x,double y){return x+y;}
    },
    MINUS("-"){
        double apply(double x,double y){return x-y;}
    },
    TIMES("*"){
        double apply(double x,double y){return x*y;}
    },
    DIVIDE("/"){
        double apply(double x,double y){return x/y;}
    };

    private String symble;
    Operation(String symble){
        this.symble=symble;
    }

    abstract double apply(double x,double y);

    @Override
    public String toString(){
        return this.symble;
    }

    private static final HashMap<String,Operation> stringToEnum=new HashMap<>();
    static{
        for(Operation op:Operation.values()){
            stringToEnum.put(op.toString(),op);
        }
    }

    public static Operation getFromString(String symble){
        return stringToEnum.get(symble);
    }
}
