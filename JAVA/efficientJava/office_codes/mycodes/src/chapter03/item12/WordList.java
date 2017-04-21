package chapter03.item12;

import javax.swing.plaf.synth.SynthUI;
import java.util.Collections;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

/**
 * Created by DaiYan on 2017/4/21.
 */
public class WordList {
    public static void main(String[] args)throws Exception{
        String[] readIn=new String[20];
        int index=0;
        Scanner sc=new Scanner(System.in);
        while (sc.hasNextLine()){
            readIn[index]=sc.next();
            System.out.println(readIn[index]);
            if(index>=20 || readIn[index].equals("eof")){ //字符串引用类型比较使用equals
                break;
            }

            index++;
        }
        Set<String> s=new TreeSet<>();
        Collections.addAll(s,readIn);
        System.out.println(s);
    }
}
