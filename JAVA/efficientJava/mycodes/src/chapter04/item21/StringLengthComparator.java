package chapter04.item21;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class StringLengthComparator implements Comparator<String> {
    public int compare(String s1,String s2){
        return s1.length()-s2.length();
    }
}
