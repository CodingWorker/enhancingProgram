package chapter05.item24.notion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/28.
 */
public class Demo{
    public static void main(String[] args){
        List<String> strList=new ArrayList<>();
        strList.add("a");
        strList.add("b");
//        toArray(strList,2);
    }

    @SuppressWarnings("unchecked")
    public static <T> T[] toArray(T[] a,int size){
        if(a.length<size)
            return (T[])Arrays.copyOf(a,size,a.getClass());
        System.arraycopy(a,0,a,0,size);
        if(a.length>size)
            a[size]=null;

        return a;
    }
}
