package chapter02.item01.serviceprovider;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class Services {//和rediswrapper 非常像
    private Services(){}
    private static final Map<String,Provider> providers=new ConcurrentHashMap<>();

    public static final String DEFAULT_PROVIDER_NAME="<def>";

    //注册服务，默认或者指定名字
    public static void registerDefaultProvider(Provider p){
        registerProvider(DEFAULT_PROVIDER_NAME,p);
    }

    public static void registerProvider(String name,Provider p){
        providers.put(name,p);
    }

    //获取服务，默认或者通过名字获取
    public static Service newInstance(){
        return newInstance(DEFAULT_PROVIDER_NAME);
    }

    public static Service newInstance(String name){
        Provider p=providers.get(name);
        if(null==p){
            throw new IllegalArgumentException();
        }

        return p.newService();
    }


}
