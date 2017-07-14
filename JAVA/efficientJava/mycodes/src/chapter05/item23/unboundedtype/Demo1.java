package chapter05.item23.unboundedtype;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/27.
 */
public class Demo1 {
    public static void main(String[] args){
        List<String> strList=new ArrayList<>();
        List<Object> objList=new ArrayList<>();

        test(strList);
        test(objList);
    }

    /**
     * 不关心list元素类型的话可以使用?通配符
     * 尽量不要使用接口List来作为形参，虽然这样可以编译运行
     * @param li
     */
    public static void test(List<?> li){

    }
}
