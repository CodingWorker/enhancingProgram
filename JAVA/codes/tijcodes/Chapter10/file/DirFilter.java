package file;

import java.io.File;
import java.io.FilenameFilter;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class DirFilter implements FilenameFilter {
    public boolean accept(File f,String fileName){
        return true;
    }
}
