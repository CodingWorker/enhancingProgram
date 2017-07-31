package com.example.demo1;

import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo1 {

    @Test
    public void run1(){
        //持久化单元名
        String persistenceUnitName="PersonService";

        //由Persistence构造实体管理工厂类
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(persistenceUnitName);
        //由工厂类构建实体管理类
        EntityManager entityManager=factory.createEntityManager();
        //开启事务
        entityManager.getTransaction().begin();
        Person person=new Person();
        person.setId(1);
        person.setName("Daniel");
        person.setAge(12);

        entityManager.persist(person);
        //提交事务
        entityManager.getTransaction().commit();

        //关闭资源
        entityManager.close();
        factory.close();
    }
}
