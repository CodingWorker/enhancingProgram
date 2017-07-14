package chapter04.item17;

import com.sun.xml.internal.ws.api.server.DocumentAddressResolver;
import com.sun.xml.internal.ws.spi.db.DatabindingException;

import java.util.Date;

/**
 * Created by DaiYan on 2017/4/23.
 */
class Super{
    public Super(){
        canOverride();
    }

    public void canOverride(){

    }
}

class Child extends Super{
    public Date date;
    public Child(){
        //默认调用父类的无参构造器，除非显示调用父类的有参构造器
        this.date=new Date();
    }

    @Override
    public void canOverride(){
        System.out.println(this.date);
    }
}

public class BadDemo {
    public static void main(String[] args){
        Child child=new Child();
        child.canOverride();
    }
}
