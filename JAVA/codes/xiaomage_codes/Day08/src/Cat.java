/**
 * Created by DaiYan on 2017/3/24.
 */
public class Cat extends Animal {
    public String name;
    public Cat(String childName,String superName){    //子类的创建时调用构造器，会默认调用父类的无参构造器，否则需要显示
        // 的指明调用有参数构造器
        super(superName);
        this.name=childName;
    }
}
