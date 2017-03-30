package classload;

/**
 * Created by DaiYan on 2017/3/30.
 */
public class Candy {//类是在需要的时候才载入到jvm的，也可能编译期代码的检查而提前载入类
    static{//static 初始化工作是在类载入的时候执行的
        System.out.println("Candy loaded");
    }

}
