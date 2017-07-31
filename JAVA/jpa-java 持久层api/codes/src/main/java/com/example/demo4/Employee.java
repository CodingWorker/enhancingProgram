package com.example.demo4;

import javax.persistence.*;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity
@Table(name="Employee")
public class Employee {

    public Employee(){}
    public Employee(int id){this.id=id;}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="salary")
    private Double salary;

    @ManyToOne
    @JoinColumn(name="department_id")
    private  Dempartment dempartment;

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

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Dempartment getDempartment() {
        return dempartment;
    }

    public void setDempartment(Dempartment dempartment) {
        this.dempartment = dempartment;
    }
}
