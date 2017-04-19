package chapter02.item06;

/**
 * Created by DaiYan on 2017/4/19.
 */

import javax.lang.model.element.Element;
import java.io.ObjectInput;
import java.util.WeakHashMap;

/**
 * 模拟实现stack
 */
class Stack{
    private Object[] elements;
    private int size=0;
    private final int CAPABILTY;
    public Stack(int capability){
        this.CAPABILTY=capability;
    }

    /**
     * push
     */

    public void push(Object element){
        if(!this.isFull())
            elements[size++]=element;
    }

    /**
     * pop
     * @return
     */
    public Object pop()throws Exception{
        if(!this.isEmpty()) {


//        return elements[size--];//bad
            Object temp = elements[size--];
            elements[size + 1] = null; //good
            return temp;
        }else{
            throw new Exception("stack is empty");
        }
    }

    public boolean isFull(){
        return size>=CAPABILTY;
    }

    public boolean isEmpty(){
        return size<0;
    }
}

public class StackDemo {
    public static void main(String[] args){

    }
}
