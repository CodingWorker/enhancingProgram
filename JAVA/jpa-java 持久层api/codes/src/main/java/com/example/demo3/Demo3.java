package com.example.demo3;

import com.sun.corba.se.spi.ior.iiop.AlternateIIOPAddressComponent;
import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by daiya on 2017/7/31.
 */
public class Demo3 {
    @Test
    public void run1(){
        String unitName="EmployeeService";
        EntityManagerFactory factory= Persistence.createEntityManagerFactory(unitName);
        EntityManager entityManager=factory.createEntityManager();

        Employee employee=new Employee();
        employee.setId(1);
        employee.setName("Daniel");
        employee.setSalary(12);

        Address address=new Address();
        address.setId(1);
        address.setState("Tex");
        address.setStreet("New York street");
        address.setZipCode("10000");

        employee.setAddress(address);

        entityManager.getTransaction().begin();
        entityManager.persist(employee);
        entityManager.persist(address);
        entityManager.getTransaction().commit();

        entityManager.close();
        factory.close();
    }
}
