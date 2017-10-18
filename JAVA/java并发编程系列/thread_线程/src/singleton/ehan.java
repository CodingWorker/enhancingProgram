package singleton;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Test2{
    private static Test2 _instance=new Test2();

    public static Test2 getInstance(){
        return _instance;
    }
}

public class ehan {
}
