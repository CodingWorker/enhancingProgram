package com.example.demo6;

import com.example.demo4.Dempartment;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity
@Table(name="student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="Student_Dept",
            joinColumns=@JoinColumn(name="Stut_Id"),
            inverseJoinColumns =@JoinColumn(name= "Dept_Id"))
    private List<Department> departments;

    public Student(){
        this.departments=new ArrayList<>();
    }

    public void addDepartment(Department dempartment){
        if(!getDepartments().contains(dempartment)){
            getDepartments().add(dempartment);
        }

        if(!dempartment.getStudents().contains(this)){
            dempartment.getStudents().add(this);
        }
    }

    @Override
    public String toString(){
        return "Id "+this.id+", name: "+this.name;
    }

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

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }
}
