package chapter04.item21;

/**
 * Created by DaiYan on 2017/4/26.
 */

//定义一个策略接口
public interface Comparator<T> {
    int compare(T t1,T t2);
}
