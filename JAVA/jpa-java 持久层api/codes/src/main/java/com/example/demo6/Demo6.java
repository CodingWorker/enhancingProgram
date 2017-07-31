package com.example.demo6;

import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo6 {
    @Test
    public void run1(){
        String unitName="StudentService";
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(unitName);
        EntityManager entityManager=factory.createEntityManager();

        Student student=new Student();
        student.setId(1);
        student.setName("Daniel");

        Department department=new Department();
        department.setId(1);
        department.setName("up town");
        student.addDepartment(department);

        entityManager.getTransaction().begin();
        entityManager.persist(student);
        entityManager.persist(department);
        entityManager.getTransaction().commit();

        entityManager.close();
        factory.close();
    }
}
