package chapter04.item16.gooddemo;

import chapter04.item16.InstrumentedHashSet;

import java.beans.IntrospectionException;
import java.util.Collection;
import java.util.Set;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class InstrumentSet<E> extends ForwardingSet<E> {
    private int addCount=0;
    public InstrumentSet(Set<E> c){
        super(c);
    }

    public boolean add(E e){
        addCount++;
        return super.add(e);
    }

    public boolean addAll(Collection<? extends E> c){
        addCount+=c.size();
        return super.addAll(c);
    }

    public int getAddCount(){
        return this.addCount;
    }

}
