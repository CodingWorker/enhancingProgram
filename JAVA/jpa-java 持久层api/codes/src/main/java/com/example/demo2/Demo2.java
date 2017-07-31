package com.example.demo2;

import com.example.demo1.Person;
import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo2 {
    @Test
    public void run1(){
        String unitName="PersonService";
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(unitName);
        EntityManager entityManager=factory.createEntityManager();

        Person2 person=new Person2();
        person.setId(1);
        person.setName("Daniel");
        person.setAge(12);

        entityManager.getTransaction().begin();
        entityManager.persist(person);
        entityManager.getTransaction().commit();

        entityManager.close();
        factory.close();
    }
}
