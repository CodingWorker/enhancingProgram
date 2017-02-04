package com.shiyanlou.test;

import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;

import java.io.*;
import java.util.concurrent.ExecutionException;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class FileIO {
    //字节流操作
    public String readFromFile(String fileName) throws Exception{
        if(null==fileName){
            throw new Exception("fileName is null");
        }

        File file=new File(fileName);
        if(!file.exists()){
            throw new Exception("文件不存在");
        }

        FileInputStream fis=null;
        try {
            fis=new FileInputStream(file);
        }catch(IOException e){
            e.printStackTrace();
            return null;
        }

        StringBuilder sbuilder=new StringBuilder();
        int a;
        while(-1!=(a=fis.read())){
            char c=(char)a;
            sbuilder.append(c);
        }

        fis.close();

        return sbuilder.toString();
    }

    public String readFromFile2(String fileName) throws Exception{
        if(null==fileName){
            return null;
        }

        File file=new File(fileName);

        BufferedInputStream bis=null;
        try {
            bis=new BufferedInputStream(new FileInputStream(file));
        }catch(FileNotFoundException e){
            throw new FileNotFoundException("文件不存在"+e);
        }

        StringBuilder sbuilder=new StringBuilder();
        int data;
        while(-1!=(data=bis.read())){
            char c=(char)data;
            sbuilder.append(c);
        }


        bis.close();
        return sbuilder.toString();
    }

    public String readFromFile3(String fileName)throws Exception{
        if(null==fileName){
            throw new Exception("fileName is null");
        }

        File file=new File(fileName);
        FileInputStream fis=new FileInputStream(file);
        byte[] data=new byte[1024];
        StringBuilder sbuilder=new StringBuilder();
        while(-1!=(fis.read(data,0,1024))){
            for(int i=0;i<data.length;i++){
                sbuilder.append((char)data[i]);
            }
        }

        fis.close();
        return sbuilder.toString();
    }

    public String readFromFile4(String fileName) throws Exception{
        if(null==fileName){
            throw new Exception("fileName is null");
        }

        File file=new File(fileName);
        BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
        StringBuilder sbuilder=new StringBuilder();
        byte[] data=new byte[1024];
        while(-1!=(bis.read(data,0,1024))){
            for(int i=0;i<data.length;i++){
                sbuilder.append((char)data[i]);
            }
        }

        bis.close();
        return sbuilder.toString();
    }

}
