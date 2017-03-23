/**
 * Created by DaiYan on 2017/3/7.
 */
class Static{
    public static int i;
    static{
        i=12;
        System.out.println("init i");
    }
    {
        System.out.println("use i");
    }


}
public class StaticDemo {
    public static void main(String[] args){
//        new Static();
//        new StaticDemo();
        Static.i=1;
    }
}
