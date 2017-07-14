package chapter04.item22;

import javax.lang.model.SourceVersion;
import javax.lang.model.element.NestingKind;

/**
 * Created by DaiYan on 2017/4/26.
 */
class Test{
    public String A;
    public static String B;
    private String C;
    public class Demo{
        public String aa;
        //public static String bb; //如果这样允许的话可以在外使用Demo来访问但是Demo不是静态类
        private String cc;
        public void out(){
            System.out.println(C);
            System.out.println(this.cc);
            System.out.println(A);
        }
    }
}

public class NoStaticDemo {
    Test.Demo demo=new Test().new Demo();//demo的创建需要Test实例为前提，而且使用Test的实例来new

}
