import com.sun.xml.internal.org.jvnet.fastinfoset.sax.PrimitiveTypeContentHandler;

import java.io.Console;
import java.sql.Time;
import java.text.DateFormat;
import java.util.*;
import java.util.function.IntConsumer;
import java.util.spi.CalendarDataProvider;

interface a{

}

interface b{

}

abstract class c{

}

class abc extends c
        implements a,b

{

}

public class Main {
    public String getName() {
        this.main(null);
        return name;
    }

    public static void aa(String... arr){
        System.out.println(arr.length);
    }


    public void setName(String name) {
        this.name = name;
    }

    private String name;

    public Main Main(){
        System.out.println("create the Main");
        return null;
    }

    /**
     * java main method
     *
     * @param  args The system console, if any, otherwise <tt>null</tt>.
     * <strong>none</strong>
     */
    public static void main(String[] args) {
        //多态



        //可变参数是语法糖，实际参数是数组
        aa("c","a","b");
        System.exit(0);
        //foreach是for的语法糖
        int[] arrNum={1,2,3};
        for(int i:arrNum){
            i+=i;
        }

        for(int i :arrNum){
            System.out.println(i);
        }

        System.exit(0);


        //数组操作
        A[] numArr=new A[2];
        numArr=new A[3];
        System.out.println(null==numArr);
        Main main=new Main();
        Sub ss=main.new Sub();
        new Main().Main();
       int[] arr=new int[3];
        System.out.println(arr[0]);

        A subA=main.test();
        int a=1;
        int b=2;
        {

            int c=3;
        }
        System.out.println(a);
        ArrayList<StringIndexOutOfBoundsException> e=new ArrayList<>();
        HashMap<String,IntConsumer> w=new HashMap<>();
        System.out.print(Runtime.getRuntime().totalMemory());
        System.out.println("//====================");
        System.out.println(3^3);
        System.out.println(2^3^3);
        StringBuilder sb=new StringBuilder();
        long t1=Calendar.getInstance().getTimeInMillis();
        int j=0;
        outer:for(int i=0;i<10000000;){
            inner:while(j<1000){
                sb.append(i);
                if(i==100)
                    break outer;
                i++;
            }

        }

        System.out.println("outer");
        switch(""){
            case "a":
                break;
            case "b":
                break;
            default:

        }

        ArrayList<String> li=new ArrayList<>(2);
        li.add("a");
        li.add("b");
        String[] arrStr=li.toArray(new String[2]);
        System.out.println(arrStr.length);

    }

    public void tt(){
    }




    public static void prtChar(char c){
        System.out.println(c);
    }

    public SubA test(){
        return new SubA(12);
    }

    abstract class A{
        private int a;
        public A(int a){
            this.a=a;
        }
        public A(){

        }

        public A(String s){
            this(1);
            //this("a");
        }

        public void print(){

            System.out.println(this.a);
        }

    }

    class SubA extends A{
        public SubA(int subA){
            super(subA);
            this.print();
        }
    }


    class Sub{
        public String name;
        public String age;
    }

    static class sub2{
    }


}