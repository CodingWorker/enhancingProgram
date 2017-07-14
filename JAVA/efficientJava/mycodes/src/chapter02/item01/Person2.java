package chapter02.item01;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class Person2 implements IPerson{
    private static Person2 _instance;
    private String Name;
    private int Age;
    public void setName(String name){this.Name=name;}
    public void setAge(int age){this.Age=age;}

    /*
    使用静态工厂代替构造器
        优势2：不必创建一个新对象
     */

    public static Person2 getPerson2() {
        if(null==_instance){
            _instance=new Person2();
        }

        return _instance;
    }
}
