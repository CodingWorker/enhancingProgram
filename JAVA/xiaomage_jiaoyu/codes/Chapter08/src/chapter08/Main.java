package chapter08;

/**
 * Created by DaiYan on 2017/3/24.
 */
public class Main {

    public static void main(String[] args){
        //System.out.println("aa");
        Animal a=new Animal();
        //chapter08.Dog dog=(chapter08.Dog) a;    //不能将运行类型为子类型实例转换为父类型，强制转换也不可以
        Animal aa=new Dog();
        Dog dog2=(Dog)aa;   //aa的运行类型或者真实是Dog所以可以强制转换

        if(dog2 instanceof Eat){
            System.out.println("dog2 instance of chapter08.Eat");
        }else{
            System.out.println("不实现接口");
        }

        System.out.println(dog2 instanceof Animal);

        //判断准确的类型，使用字节码
        //System.out.println(dog2.getClass()==Dog.class);    //true
        //System.out.println(dog2.getClass()==Animal.class); //error，编译不通过





    }
}
