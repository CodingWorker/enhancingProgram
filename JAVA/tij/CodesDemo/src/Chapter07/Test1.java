package Chapter07;

/**
 * Created by DaiYan on 2017/6/12.
 */

interface A{

}

interface B{}

class Super{}

//支持接口多继承,先继承在实现接口
class Demo extends Super
            implements A,B{}



public class Test1 {
}
