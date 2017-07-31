package com.example.demo6;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity
@Table(name="department")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @ManyToMany(mappedBy="departments")
    private List<Student> students;

    public Department(){
        this.students=new ArrayList<>();
    }

    public void addStudent(Student student){
        if(!getStudents().contains(student)){
            getStudents().add(student);
        }

        if(!student.getDepartments().contains(this)){
            student.getDepartments().add(this);
        }
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

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
