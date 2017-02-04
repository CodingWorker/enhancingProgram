package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public enum Country {
    China("中国","China","北京"),
    USA("美国","America","华盛顿"),
    UK("英国","Britan","伦敦");
    //上面内容是调用下面的构造方法来对类Country的实例化
    private String zhName;
    private String enName;
    private String capital;

    private Country(String zhName,String enName,String capital){
        this.zhName=zhName;
        this.enName=enName;
        this.capital=capital;
    }

    public String getZhName(){
        return this.zhName;
    }

    public String getEnName(){
        return this.enName;
    }

    public String getCapital(){
        return this.capital;
    }
}
