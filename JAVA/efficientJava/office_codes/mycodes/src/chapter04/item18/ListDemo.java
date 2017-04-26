package chapter04.item18;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.IntArrayData;
import com.sun.xml.internal.ws.api.policy.SourceModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/25.
 */

public class ListDemo {
    public static void main(String[] args){
        int[] arr={1,2,3,4,5};
        List<Integer> test= intArrayList(arr);
        test.set(1,10);
        System.out.println(test.get(1));
        System.out.println(test.size());
    }

    //list的实现
    private static List<Integer> intArrayList(final int a[]){
        if(null==a){
            throw new IllegalArgumentException("参数错误");
        }

        return new ArrayList<Integer>(){
            public Integer get(int i){
                return a[i];
            }

            @Override
            public Integer set(int i,Integer val){
                Integer oldVal=a[i];
                a[i]=val;
                return oldVal;
            }

            public int size(){
                return a.length;
            }
        };
    }
}
