package file;

import java.io.File;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class FileDemo {
    public static void main(String[] args){
        File f=new File("D:/");
        String[] files=f.list();
        for(String fileName:files){
            System.out.println(fileName);
        }
    }
}
