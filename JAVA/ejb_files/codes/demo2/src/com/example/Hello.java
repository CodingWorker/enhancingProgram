package com.example;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;

/**
 * Created by daiya on 2017/7/10.
 */
@Stateless
@Remote
@Local
public class Hello implements Greeting {
    public String sayHello(String name){
        return "hello "+name+" !";
    }
}
