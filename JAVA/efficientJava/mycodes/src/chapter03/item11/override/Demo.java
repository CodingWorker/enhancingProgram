package chapter03.item11.override;

/**
 * Created by DaiYan on 2017/4/21.
 */
//子类方法返回父类方法的子类型也属于方法重写
class Super {
    protected Super getNewInstance(){
        return new Super();
    }
}

class Child extends Super{
    @Override
    public Child getNewInstance(){
        return new Child();
    }
}

public class Demo {
}
