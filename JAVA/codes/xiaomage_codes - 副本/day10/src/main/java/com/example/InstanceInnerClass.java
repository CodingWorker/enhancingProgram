package main.java.com.example;

/**
 * Created by DaiYan on 2017/7/5.
 */
public class InstanceInnerClass {
    private String name;
    private int age;
    public InstanceInnerClass(String name,int age){
        this.name=name;
        this.age=age;
    }

    public class InnerInstance{
        public int age;
        @Override
        public String toString(){
            return InstanceInnerClass.this.name+"|"+this.age;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }
    }

    public String getName(){return this.name;}
    public void setName(String name){this.name=name;}

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
