package Chapter08._8_2;

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
        Vector cats=new Vector();
        for(int i=0;i<7;i++){
            cats.addElement(new Cat(i));
        }

        cats.addElement(new Dog(7));

        for(int i=0;i<cats.size();i++){
            ((Cat)cats.get(i)).print();
        }
    }
}
