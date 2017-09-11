package com.test.demo;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class SharedResource {
    private String name;
    private String gender;
    private boolean notEmpty=false;

    synchronized public void push(String name,String gender) {
        try {
            if (!notEmpty) {
                this.name = name;
                Thread.sleep(10);
                this.gender = gender;
                this.notEmpty = true;
                this.notify();
                this.wait();
            }
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }
    }

    synchronized public void pop() {
        try {
            if (notEmpty) {
                Thread.sleep(10);
                System.out.println(this.name + "-" + this.gender);
                this.notEmpty = false;
                this.notify();
                this.wait();
            }
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
