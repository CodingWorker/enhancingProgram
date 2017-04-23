package chapter04.item16;

import java.util.*;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class InstrumentedHashSet<E> extends HashSet<E>{
    private int setCount=0;
    public InstrumentedHashSet(){

    }

    public InstrumentedHashSet(int gap,float loadFactor){
        super(gap,loadFactor);
    }

    @Override
    public boolean add(E el){
        setCount++;
        return super.add(el);
    }

    @Override
    public boolean addAll(Collection<? extends E> c){
        setCount+=c.size();
        return super.addAll(c);
    }

    public int getSetCount(){
        return this.setCount;
    }
}

class Test{
    public static void main(String[] args){
        InstrumentedHashSet<String> iHash=new InstrumentedHashSet<String>();
        iHash.addAll(Arrays.asList("a","b","c"));

        System.out.println(iHash.getSetCount());//it is 6,not 3
    }
}
