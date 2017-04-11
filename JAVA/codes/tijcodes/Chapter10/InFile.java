import java.io.*;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class InFile extends DataInputStream{
    public InFile(String fileName) throws FileNotFoundException{
        super(new BufferedInputStream(new FileInputStream(fileName)));
    }

    public InFile(File file)throws FileNotFoundException{
        this(file.getPath());
    }
}
