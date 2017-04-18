package chapter02.item01;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class Person implements IPerson{
    private String Name;
    private int Age;
    public void setName(String name){this.Name=name;}
    public void setAge(int age){this.Age=age;}

    /*
    使用静态工厂代替构造器
        优势1：方法可以有名称
     */
    public static Person getPerson(String name,int age){
        Person p=new Person();
        p.Name=name;
        p.Age=age;

        return p;
    }

    /*
    使用静态工厂代替构造器
        优势3：返回返回类型的子类对象
     */
    public static IPerson getInstance(){
        return new Person();
    }

}
