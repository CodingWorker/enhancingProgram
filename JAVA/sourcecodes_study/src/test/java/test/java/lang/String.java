package test.java.lang;

import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

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
        char[] data={'a','b','大','小'};
        System.out.println(new java.lang.String(data).length());//4
    }

    @Test
    public void run4(){
        java.lang.String str="ac大小";
        System.out.println(str.charAt(2));//大
        System.out.println(str.codePointAt(2));//22823
        System.out.println(str.codePointBefore(2));//99
        System.out.println(Character.codePointBefore(str,2));//99，字符串内部就是调用的这个方法获取
        // 指定索引处字符的数字值表示的前一个值
        System.out.println(str.codePointCount(0,str.length()-1));//3
        System.out.println(str.offsetByCodePoints(1,1));//4
    }

    @Test
    public void run5(){
        java.lang.String str="ndexOutOfBound";
        char[] dest=new char[10];
        str.getChars(0,5,dest,3);
        System.out.println(new java.lang.String(dest));//   ndexO
    }

    @Test
    public void run6(){
        java.lang.String str="ndexOutOfBound";
        byte[] bytes=str.getBytes();
        try{
            bytes=str.getBytes("utf-8");
            bytes=str.getBytes("big5");
            Charset charset=Charset.forName("utf-16");
            bytes=str.getBytes(charset);
        }catch(UnsupportedEncodingException ex){
            ex.printStackTrace();
        }

        for(int i=0;i<bytes.length;i++){
            System.out.println((char)bytes[i]);
        }
    }

    @Test
    public void run7(){
        java.lang.String str="CodePoints()方法";
        StringBuilder sb=new StringBuilder("CodePoints()方法");
        System.out.println(str.contentEquals(sb));///true
        StringBuffer sBuffer=new StringBuffer("CodePoints()方法 ");
        System.out.println(str.contentEquals(sBuffer));//false
        System.out.println(str.equals(str));//true
        System.out.println(str.equalsIgnoreCase("codepoInts()方法"));//true
    }

    @Test
    public void run8(){
        java.lang.String str1="CodePoints";
        java.lang.String str2="CodePointsfafadfa";
        System.out.println(str1.compareTo(str2));
    }
}
