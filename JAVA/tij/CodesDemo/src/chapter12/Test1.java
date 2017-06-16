package chapter12;

import java.util.Objects;

/**
 * Created by DaiYan on 2017/6/16.
 */
class Temp implements Cloneable{
    public Temp(int a,String name){
        this.a=a;
        this.name=name;
    }
    private  int a;

    public int getA(){return this.a;}
    public void setA(int a){this.a=a;}

    private  String name;
    public String getName(){return this.name;}
    public void setName(String name){this.name=name;}

    //clone在object中是protected的，在子类中覆写时需要改为public的

    @Override
    public Object clone(){
        Object cloneObj=null;
        try {
            cloneObj = super.clone();
        }catch (Exception e){
            e.printStackTrace();
        }

        return cloneObj;
    }

}


public class Test1 {
    public static void main(String[] args){
        Temp t=new Temp(12,"Daniel");
        System.out.println(t);
        System.out.println(t instanceof Cloneable);
        System.out.println(t instanceof Object);
        Temp t2=(Temp) t.clone();
        System.out.println(t2);
        System.out.println(t2.getName());
    }

}
