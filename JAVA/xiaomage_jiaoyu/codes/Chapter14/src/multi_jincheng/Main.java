package multi_jincheng;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Main {
    public static void main(String[] args)throws Exception{
        //创建多进程,使用runtime
        Runtime runtime=Runtime.getRuntime();
        runtime.exec("notepad");

        //使用ProcessBuilder
        ProcessBuilder pb=new ProcessBuilder("notepad");
        pb.start();
    }
}
