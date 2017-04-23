package chapter03.item11;

import com.sun.javafx.geom.AreaOp;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Test implements Cloneable{
    private int a;
    private String str;
    private boolean isOK;
    private List<Object> elements;
    public Test(int a,String str,boolean isOK){
        if(null==this.elements)
            this.elements=new ArrayList<Object>();
        this.a=a;
        this.elements.add(a);
        this.str=str;
        this.elements.add(str);
        this.isOK=isOK;
        this.elements.add(isOK);
    }

    @Override
    public Test clone(){
        Test newT=null;
        try {
            newT=(Test)super.clone();
            newT.a=this.a;
            newT.str=this.str;
            newT.isOK=this.isOK;
            newT.elements=new ArrayList<>();
        }catch(CloneNotSupportedException ex){
            System.out.println("CloneNotSupportedException:"+ex.getMessage());
        }

        return newT;
    }

    @Override
    public String toString(){
        return String.format(super.toString()+"=>a:%d, str:%s, isOK:%s, elements:%s",
                this.a,this.str,this.isOK,this.elements);
    }
}


public class TestDemo {
    public static void main(String[] args){
        Test t=new Test(12,"clone",true);
        Test newT=t.clone();
        System.out.println("t:\r\n"+t);
        System.out.println("newT:\r\n"+ newT);
    }
}
