package chapter03.item11;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.ConsoleHandler;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class CopyConstructor {
    private int a;
    private String str;
    private boolean isOK;
    private List<Object> elements;
    public CopyConstructor(int a,String str,boolean isOK){
        if(null==this.elements)
            this.elements=new ArrayList<Object>();
        this.a=a;
        this.elements.add(a);
        this.str=str;
        this.elements.add(str);
        this.isOK=isOK;
        this.elements.add(isOK);
    }

    /**
     * 提供一个复制的方法而不是覆盖clone方法
     * @param origin
     * @return
     */
    public CopyConstructor copy(CopyConstructor origin){
        return new CopyConstructor(origin.a,origin.str,origin.isOK){

        };
    }

    /**
     * 拷贝工厂。提供一个静态的拷贝方法
     * @param origin
     * @return
     */
    public static CopyConstructor newInstance(CopyConstructor origin){
        return new CopyConstructor(origin.a,origin.str,origin.isOK){

        };
    }
}
