package chapter03.item09.mapdemo;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import javax.management.openmbean.OpenMBeanConstructorInfo;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by DaiYan on 2017/4/20.
 */
class PhoneNumber{
    private final int x;
    private final int y;
    public PhoneNumber(int x,int y){
        this.x=x;
        this.y=y;
    }

    @Override
    public boolean equals(Object o){
        if(!(o instanceof PhoneNumber))
            return false;

        PhoneNumber pn=(PhoneNumber)o;
        return this.x==pn.x && this.y==pn.y;
    }

    @Override
    public int hashCode(){
        int result=31;
        result+=this.x^2+this.y^2;
        return result;
    }
}


public class HashCodeDemo {
    public static void main(String[] args){
        Map<PhoneNumber,String> map=new HashMap<>();
        map.put(new PhoneNumber(1,2),"abc");

        String val=map.get(new PhoneNumber(1,2));//没有覆盖hashCode方法返回null,覆盖之后返回abc
        System.out.println(val);

        long a=5L;
        System.out.println(a^(a>>>32));
    }
}
