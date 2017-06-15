package chapter10;

import java.io.File;

/**
 * Created by DaiYan on 2017/6/15.
 */
public class Test1 {
    public static void main(String[] args){
        File file=new File("./CodesDemo.iml");
        String[] fileNames= file.list();
        for(String fileName:fileNames){
            System.out.println(fileName);
        }
    }
}
