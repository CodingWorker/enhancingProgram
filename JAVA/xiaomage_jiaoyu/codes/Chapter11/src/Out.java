/**
 * Created by DaiYan on 2017/3/27.
 */
public class Out {
    public int a=12;
    public class In{
        public int aa=new Out().a;
        public In(){
            System.out.println(this.aa);
            System.out.println(Out.this.a);    //访问外部类成员
        }
    }

    public static class StaticIn{
        public static int aa=new Out().a;
    }
}
