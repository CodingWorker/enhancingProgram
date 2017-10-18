package eatapple;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Person extends Thread{
    private int num=50;//苹果总数,非静态时则每个对象都有,造成重复吃苹果
    public Person(String name){
        super(name);
    }

    public void run(){
        for (;num>=0;) {
                System.out.println(this.getName()+" 吃了编号为 "+num--+"的苹果");
        }
    }
}


public class ExtendDemo {
    public static void main(String[] args){
        Person p1=new Person("A");
        Person p2=new Person("B");
        Person p3=new Person("C");

        p1.start();
        p2.start();
        p3.start();
    }
}
