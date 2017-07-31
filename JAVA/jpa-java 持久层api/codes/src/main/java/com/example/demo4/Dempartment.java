package com.example.demo4;

import org.eclipse.persistence.annotations.ClassExtractor;

import javax.persistence.*;

/**
 * Created by daiya on 2017/7/31.
 */
@Entity
@Table(name="Department")
public class Dempartment {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

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
}
