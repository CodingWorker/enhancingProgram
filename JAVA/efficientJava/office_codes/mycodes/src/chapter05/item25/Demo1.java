package chapter05.item25;

import com.sun.org.apache.xpath.internal.SourceTree;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by DaiYan on 2017/4/28.
 */
public class Demo1 {
    public static void main(String[] args){
        /**
         * 数组是协变的而泛型不是
         * 所以从某方面来说数组是有缺陷的
         */
        Object[] objArr=new Object[10];
        objArr[0]="i do not fit in";

//        List<Object> objList=new ArrayList<long>();//非法
        String[] st=new String[10];
        List<String> strList=new ArrayList<>();

        List<String[]> li1=new ArrayList<String[]>();
        li1.add(new String[]{"A","b"});

        /**
         * 由于泛型和数组的关系，以下表达式都是非法的
         */
        li1.forEach(i-> System.out.println(i[0]));
//        List<String>[] li2=new ArrayList<String>[10];//产生一个泛型数组创建的错误
    }
}
