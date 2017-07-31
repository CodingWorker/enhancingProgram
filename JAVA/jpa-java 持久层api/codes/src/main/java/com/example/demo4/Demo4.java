package com.example.demo4;

import com.example.demo3.Address;
import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo4 {
    @Test
    public void run1(){
        String unitName="EmployeeService";
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(unitName);
        EntityManager entityManager=factory.createEntityManager();

        Employee employee=new Employee();
        employee.setId(1);
        employee.setName("Daniel");
        employee.setSalary(10.0);

        Dempartment dempartment=new Dempartment();
        dempartment.setId(1);
        dempartment.setName("up town");
        employee.setDempartment(dempartment);

        entityManager.getTransaction().begin();
        entityManager.persist(employee);
        entityManager.persist(dempartment);
        entityManager.getTransaction().commit();

        entityManager.close();
        factory.close();
    }
}
