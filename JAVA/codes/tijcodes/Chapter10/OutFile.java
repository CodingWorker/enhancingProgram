import java.io.*;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class OutFile extends DataOutputStream {
    public OutFile(String fileName) throws FileNotFoundException {
        super(new BufferedOutputStream(new FileOutputStream(fileName)));
    }

    public OutFile(File file) throws FileNotFoundException{
        this(file.getPath());
    }
}
