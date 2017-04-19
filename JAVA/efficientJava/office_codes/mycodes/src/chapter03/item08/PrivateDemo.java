package chapter03.item08;

import java.io.ObjectInput;
import java.rmi.AccessException;

/**
 * Created by DaiYan on 2017/4/19.
 */

public class PrivateDemo {
    private class Test{
        //私有类不使用equals方法，最好覆盖equals方法以防被调用
        @Override
        public boolean equals(Object t){
            throw new AssertionError("cannot access");
        }
    }
}
