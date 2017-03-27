/**
 * Created by DaiYan on 2017/3/24.
 */
public class Cat extends Animal {
    public int name;
    public Cat(){    //子类的创建时调用构造器，会默认调用父类的无参构造器，否则需要显示
        // 的指明调用有参数构造器
        super("");
    }
}
