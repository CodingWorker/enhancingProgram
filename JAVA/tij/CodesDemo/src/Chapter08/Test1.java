package Chapter08;

import java.awt.print.PrinterGraphics;
import java.util.Vector;

/**
 * Created by DaiYan on 2017/6/13.
 */

class Demo{

}

public class Test1 {
    public static void main(String[] args){
        Vector cat=new Vector();//不指定泛型类型则默认为object，从而集合里的元素都当做object来看待
        cat.add(1);
        cat.add("");

        Vector<Integer> i=new Vector<>();
        i.add(12);

        test(cat.elementAt(0));
        new Test1().outputThis();
    }

    public static void test(Object demo){}

    public void outputThis(){
        System.out.println(this);//Chapter08.Test1@1b6d3586
    }

}
