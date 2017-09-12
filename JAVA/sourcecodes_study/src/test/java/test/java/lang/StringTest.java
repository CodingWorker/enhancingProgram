package test.java.lang;

import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

/**
 * Created by daiya on 2017/9/11.
 */
public class StringTest {
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

    @Test
    public void run9(){
        java.lang.String str="CodePoints()方法";
        System.out.println(str.indexOf("p"));//-1
        System.out.println(str.indexOf("o",5));//5
        System.out.println(str.indexOf(12,0));//-1

        System.out.println(str.lastIndexOf(12));//-1
        System.out.println(str.lastIndexOf(12,3));//-1
        int index=0;
        label1:for(;;){
            index++;
            label2:for(;;){
                index/=2;
                if(index==10){
                    break label1;
                }
            }
        }

        System.out.println(str.lastIndexOf("o",2));//1
    }


    @Test
    public void run16(){
        java.lang.String str="之线程安全队列Queue多数生产消费模";
        System.out.println(str.substring(3));//安全队列Queue多数生产消费模
        System.out.println(str.substring(3,8));//安全队列Q
        System.out.println(str.subSequence(3,8));//安全队列Q

        System.out.println(str.subSequence(3,8) instanceof java.lang.String);//true
    }

    @Test
    public void run15(){
        java.lang.String str1="之线程安全队列Queue";
        java.lang.String str2="多数生产消费模";
        System.out.println(str1.concat(str2));//之线程安全队列Queue多数生产消费模
    }

    @Test
    public void run14(){
        java.lang.String str="canonical_百度翻译";
        System.out.println(str.split("z",100)[0]);//limit可以随意指定，仅仅是用来判断最后取得的个数
    }

    @Test
    public void run13(){
        System.out.println((int)' ');
    }

    @Test
    public void run12(){
        java.lang.String str="canonical_百度翻译";
        System.out.println(str.trim());
    }

    @Test
    public void run11(){
        java.lang.String str="canonical_百度翻译";
        System.out.println(str.toCharArray());
    }

    @Test
    public void run10(){
        java.lang.String str="canonical_百度翻译";
        System.out.println(str.intern());
    }
}
