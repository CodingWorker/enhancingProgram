package chapter04.item21;

import com.sun.deploy.util.ArrayUtil;

import java.util.*;
import java.util.Comparator;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class Demo {
    public static void main(String[] args){
        //具体的策略类往往使用匿名类实现接口
        String[] arr={};
        //匿名类实现的是接口并覆盖方法
        Arrays.sort(arr, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.length()-o2.length();
            }
        });
    }
}
