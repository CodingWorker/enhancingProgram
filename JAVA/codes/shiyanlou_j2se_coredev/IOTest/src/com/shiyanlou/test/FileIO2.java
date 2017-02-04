package com.shiyanlou.test;

import javax.lang.model.element.NestingKind;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class FileIO2 {
    public String readFromFile1(String fileName)throws Exception{
        FileReader fr=new FileReader(fileName);
        int data;
        StringBuilder sbuilder=new StringBuilder();
        while(-1!=(data=fr.read())){
            sbuilder.append((char)data);
        }

        return sbuilder.toString();
    }

    public String readFromFile2(String fileName)throws Exception{
        FileReader fr=new FileReader(fileName);
        char[] data=new char[1024];
        StringBuilder sbuilder=new StringBuilder();
        while(-1!=fr.read(data,0,1024)){
            for(int i=0;i<data.length;i++){
                sbuilder.append(data[i]);
            }
        }

        return sbuilder.toString();
    }

    public String readFromFile3(String fileName)throws Exception{
        BufferedReader br=new BufferedReader(new FileReader(fileName));
        int data;
        StringBuilder sbuilder=new StringBuilder();
        while(-1!=(data=br.read())){
            sbuilder.append((char)data);
        }

        return sbuilder.toString();
    }

    public String readFromFile4(String fileName)throws Exception{
        BufferedReader br=new BufferedReader(new FileReader(fileName));
        char[] data=new char[2048];
        StringBuilder sbuilder=new StringBuilder();
        while(-1!=(br.read(data,0,1024))){
            for(int i=0;i<data.length;i++){
                sbuilder.append(data[i]);
            }
        }

        return sbuilder.toString();
    }

    public String readFromFile5(String fileName) throws Exception{
        BufferedReader br=new BufferedReader(new FileReader(fileName));
        StringBuilder sbuilder=new StringBuilder();
        String data=br.readLine();
        return data;
    }

}
