package chapter04.item22;

/**
 * Created by DaiYan on 2017/4/26.
 */
class Person{
    public String Name;
    public int Age;
    private String Address;
    public static String A;

    //静态嵌套类
    public static class Test{
        public String A;
        public String B;
        public static String C;

        public String getOutAddress(){
            return new Person().Address;
        }
    }
}

public class qiantao {
    public static void main(String[] args){
        //public的可以在外围类的外部访问
        Person.Test t=new Person.Test();

        //访问静态嵌套类就与访问成员一样，只是这个静态成员内部的数据需要先创建对象
        System.out.println(new Person.Test().A);
    }
}
