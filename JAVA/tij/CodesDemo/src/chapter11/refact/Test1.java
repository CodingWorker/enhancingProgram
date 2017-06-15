package chapter11.refact;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/**
 * Created by DaiYan on 2017/6/15.
 */
class Temp{
    private int a;
    public Temp(){}
    public Temp(int a){
        this.a=a;
    }
    public int getA(){
        return this.a;
    }

    public void setA(int a){
        this.a=a;
    }

    public void increA(int addNum){
        this.a+=addNum;
    }

    @Override
    public String toString(){
        return ""+this.a;
    }



}

public class Test1 {
    public static void main(String[] args){
        System.out.println(Temp.class.getName());
        try {
            Class tClz=Class.forName("chapter11.refact.Temp");
            Constructor[] cs=tClz.getConstructors();
            Method[] ms=tClz.getMethods();
            Class superClzs= tClz.getSuperclass();
            Class[] interfaceClzs= tClz.getInterfaces();
            System.out.println(cs.length);
            System.out.println(ms.length);
            System.out.println(superClzs.getName());
            System.out.println(interfaceClzs.length);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }

    }

}
