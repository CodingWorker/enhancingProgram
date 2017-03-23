package Chapter08;

/**
 * Created by DaiYan on 2017/3/21.
 */
public class Main {
    public static void main(String[] args){
        int[] a={1,2};
        int[] b={1,2,3};
        a=b;

        int[] ac;//没有被初始化，则ac为null
        int[] c=new int[5];   //c被初始化了，已经不是null。可以有length
        String[] d=new String[5];  //每一个元素被初始化为null
        for(String s:d){
            System.out.println(s);
        }
        System.out.println(d.length);
        for(int i:c){
            System.out.println(i);
        }

    }
}
