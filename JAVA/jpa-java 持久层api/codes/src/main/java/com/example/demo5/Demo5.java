package com.example.demo5;

import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo5 {
    @Test
    public void run1(){
        String unitName="DempartmentService";
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(unitName);
        EntityManager entityManager=factory.createEntityManager();

        Employee employee=new Employee();
        employee.setId(1);
        employee.setName("Daniel");
        employee.setSalary(120.0);

        Department department=new Department();
        department.setId(1);
        department.setName("up town");

        List<Employee> li=new ArrayList<>();
        li.add(employee);
        department.setEmployees(li);

        entityManager.getTransaction().begin();
        entityManager.persist(department);
        entityManager.persist(employee);
        entityManager.getTransaction().commit();

        entityManager.close();
        factory.close();

    }

}
