package file;

import java.io.File;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class DirList {
    public static void main(String[] args) {
        try {
            File path = new File(".");
            String[] list;
            if (args.length == 0) {
                list = path.list();
            } else {
                list = path.list(new DirFilter(args[0]));
                for (int i = 0; i < list.length; i++) {
                    System.out.println(list[i]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
