package com.example.demo5;

import javax.naming.Name;
import javax.persistence.*;
import javax.xml.stream.events.StartDocument;
import java.util.List;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity
@Table(name="Department")
public class Department {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name")
    private String name;

    @OneToMany(cascade =CascadeType.ALL,fetch=FetchType.LAZY)
    @JoinColumn(name="department_id")
    private List<Employee> employees;

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

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }
}
