package test.java.lang;

import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;

import javax.print.DocFlavor;

/**
 * Created by daiya on 2017/9/11.
 */
public class String {
    @Test
    public void run(){
        char[] data={'a','b'};
        System.out.println(new java.lang.String(data));//底层实现是一个字符数组
    }

    @Test
    public void run2(){
        int[] intArr={12,3,11,22,111,222,1111,2222,121212};
        java.lang.String str=new java.lang.String(intArr,0,intArr.length);
        System.out.println(str);
        System.out.println(str.length());//10
    }

    @Test
    public void run3(){
        char[] data={'a','b'};

    }
}
