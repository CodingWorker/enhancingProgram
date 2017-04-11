import java.io.*;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class PrintFile extends PrintStream {
    public PrintFile(String fileName) throws FileNotFoundException{
        super(new BufferedOutputStream(new FileOutputStream(fileName)));
    }

    public PrintFile(File file) throws FileNotFoundException{
        this(file.getPath());
    }
}
