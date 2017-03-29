package common;

import java.io.Serializable;

/**
 * Created by DaiYan on 2017/3/29.
 */
public class User implements Serializable{   //序列化必须实现此接口，
    // 底层序列化的时候会做instance判断
    private String name;
    private int age;
    private String country;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
