import com.test.testcodes.Hello;
import com.test.testcodes.HelloChild;

public class Main {
    //变量定义
    final static double PI=3.14;
    static int cc=12;
    /**
     * 文档注释
     * @param args
     */
    public static void main(String[] args) throws Exception{
        System.out.println("Hello World!");   //单行注释，打印 Hello World!
//        new Hello().hello();    //默认的访问控制只能在本类和同一个包内被访问得到
        String $str="this is a string";
        System.out.println($str);
        System.out.println(PI);
        int num=-129988;
        System.out.println(num<<32);
        System.out.println(num>>3);
        int [ ] arrInt=new int [] {1,2,3,4};
        System.out.println(arrInt[2]);
        int[] arrInt2;
        arrInt2=new int[3];
        arrInt2[0]=12;
        System.out.println(arrInt2[0]);
        String[] strArr;
        strArr=new String[2];
        System.out.println(strArr[1]);
        System.out.println(test());
        Hello h=new Hello();
        int cc=1;
        System.out.println(Main.cc);
        h.test();      //protected 修饰的只能在类内部 同一个保内和子类内才能被访问的到
        System.out.println(h.info);

        Hello.SubHello sh=h.getSubClass();    //获得内部类
        System.out.println(sh);
        Hello.SubHello sh2=h.new SubHello();    //成员内部类属于对象，因此需要对象来实例化
        Hello.SubHello2 sh22=new Hello.SubHello2();    //静态类成员属于类，直接new 即可

        h.helloInfo();
        HelloChild hc=new HelloChild();
        hc.test();
        Hello hcc=new HelloChild();
        hcc.test();     //hcc是Hello的引用，但是调用的是HelloChild的方法
        System.out.println(hcc.getClass());    //输出：class com.test.testcodes.HelloChild
//        hcc.tt();   //父类引用只能调用子类重写的方法不能调用子类独有的方法
    }

    private static int test(){
        return 1;
        //TODO
    }




}
