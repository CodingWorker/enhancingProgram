package simple;

import java.util.*;

/**
 * Created by DaiYan on 2017/6/16.
 */
public class Demo {
    public static void main(String[] args){
        //collection接口下，抽象类为list set 和 queue
        listDemo();
        mapDemo();
    }

    private static void listDemo(){
        //arrayList适合查找操作，插入和删除操作较慢
        List<String> li=new ArrayList<>();
        li.add("a");
        li.add("b");
        li.add("c");

        System.out.println(li.size());
        Iterator liIterator=li.iterator();
        while(liIterator.hasNext()){
            System.out.println(liIterator.next());
        }

        //linkedList适合插入和删除操作，查找操作较arraylist慢
        List<String> li2=new LinkedList<String>();
        li2.add("aa");
        li2.add("bb");
        li2.add("cc");

    }

    private static void mapDemo(){
        //hashmap
        Map<String,String> map=new HashMap<>();
        map.put("a","aa");
        map.put("b","bb");

        Iterator mi=map.keySet().iterator();
        while(mi.hasNext()){
            System.out.println(map.get(mi.next()));
        }
    }
}
