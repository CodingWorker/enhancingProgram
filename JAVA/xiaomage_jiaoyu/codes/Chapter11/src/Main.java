/**
 * Created by DaiYan on 2017/3/27.
 */
public class Main {
    public static int a=12;
    public static void main(String[] args){
        int c=12;
        Main m=new Main();
        m.a=12;
        System.out.println(MyInterface.a);
        System.out.println(m.a);
        m.a=23;
        System.out.println(MyInterface.a);
        System.out.println(m.a);
        class LocalInner{
            int cc=c;
            c=2;
        }

    }
}
