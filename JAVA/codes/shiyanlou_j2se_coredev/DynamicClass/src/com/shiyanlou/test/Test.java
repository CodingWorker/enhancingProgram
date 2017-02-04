package com.shiyanlou.test;

import java.io.File;
import java.lang.reflect.Constructor;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class Test {
    public static void main(String[] args){
        try{
            Constructor<File> constructor=File.class.getDeclaredConstructor(String.class);
            System.out.println("create file object with reflection");
            File file=constructor.newInstance("C:\\Users\\daiyan\\Desktop\\tt.txt");
            System.out.println("use file object to create tt.txt on desktop");
            file.createNewFile();    //创建新的文件
            System.out.println("file is created?"+file.exists());  //验证文件是否创建成功
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
