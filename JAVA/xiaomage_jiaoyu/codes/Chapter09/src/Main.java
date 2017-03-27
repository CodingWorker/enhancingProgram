/**
 * Created by DaiYan on 2017/3/25.
 */
public class Main {
    public static void main(String[] args) {
        Super clz=new Sub();
        clz.doWork();
        System.out.println(clz.name);

    }
}
