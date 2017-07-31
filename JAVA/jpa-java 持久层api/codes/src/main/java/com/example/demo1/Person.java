package com.example.demo1;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity//实体类注解，表示一个可以序列化的映射对象
public class Person {
    @Id//配置这个为主键
    private Integer id;
    private String name;
    private Integer age;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
