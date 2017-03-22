package Chapter08._8_2;

import com.sun.javafx.geom.transform.CanTransformVec3d;

import java.util.Vector;

/**
 * Created by DaiYan on 2017/3/21.
 */
class Cat{
    private int catNumber;
    Cat(int i){
        catNumber=i;
    }

    void print(){
        System.out.println("cat# "+catNumber);
    }
}

class Dog{
    private int catNumber;
    Dog(int i){
        catNumber=i;
    }

    void print(){
        System.out.println("cat# "+catNumber);
    }
}

public class CatsAndDogs {
    public static void main(String[] args){
        Vector cats=new Vector();    //不指定元素类型时默认为object，调用cat的方法时需要溯型
        for(int i=0;i<7;i++){
            cats.addElement(new Cat(i));
        }

        cats.addElement(new Dog(7));

        for(int i=0;i<cats.size();i++){
            ((Cat)cats.get(i)).print();
        }

        Vector<Cat> catVector=new Vector<>();
        catVector.addElement(new Cat(1));
        //catVector.addElement(Dog(2));  //类型不匹配
        catVector.elementAt(1).print();   //因为catVector限制了元素只能是cat类型，所以访问元素
        // 的时候就是cat不用再次的溯型
    }
}
