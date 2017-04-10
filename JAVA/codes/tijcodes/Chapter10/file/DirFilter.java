package file;

import java.io.File;
import java.io.FilenameFilter;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class DirFilter implements FilenameFilter {
    public String FilterName;
    public DirFilter(String filterName){
        this.FilterName=filterName;
    }
    public boolean accept(File f,String filterName){
        // use the FilterName
        return true;
    }
}
