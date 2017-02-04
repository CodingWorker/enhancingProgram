package com.shiyanlou.test;

import java.sql.Time;
import java.util.Date;
import java.util.Scanner;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class Main {
    public static void main(String args[]) throws Exception {
        Scanner scan = new Scanner(System.in);
        int i = 0;
        /*
        while(true){
            System.out.println("please input some words: \r");
            System.out.println(scan.nextLine());
            i++;
            if(i>10){
                break;
            }
        }
        */
        String fileName = "C:\\Users\\daiyan\\Desktop\\io.txt";
        long date_start = new Date().getTime();

//        String content = new FileIO().readFromFile(fileName);
//        String content = new FileIO().readFromFile2(fileName);
//        String content = new FileIO().readFromFile3(fileName);
//        String content = new FileIO().readFromFile4(fileName);
//          String content=new FileIO2().readFromFile1(fileName);
//        String content=new FileIO2().readFromFile2(fileName);
//        String content=new FileIO2().readFromFile3(fileName);
//        String content=new FileIO2().readFromFile4(fileName);
        String content=new FileIO2().readFromFile5(fileName);


        System.out.println(content);


        long date_end = new Date().getTime();
        System.out.println((date_end - date_start) + " ms");

        String str="fadfaffadfafafafaa";
        byte[] data=new byte[1024];
        data=str.getBytes();
        for(i=0;i<data.length;i++){
            System.out.println((char)data[i]);
        }

        System.out.println(data);

    }
}
