package chapter04.item13;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class Demo2 {
    //私有化静态不可变数组，因为长度非0的数组中是可变的
    private static final String[] strArr={};
    //也可以提供一个方法返回私有数组的一个备份
    public static final String[] values(){
        return strArr.clone();
    }
}
