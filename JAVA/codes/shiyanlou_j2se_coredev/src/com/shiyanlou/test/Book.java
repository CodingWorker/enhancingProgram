package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 * 创建步骤：工程名-->包名-->类名-->属性&访问器+方法
 */
public class Book {
    //成员变量
    private String name;
    private String author;
    private float price;
    private String ISBN;

    //构造方法
    public Book(String name,String author,float price,String isbn){
        this.name=name;
        this.author=author;
        this.price=price;
        this.ISBN=isbn;
    }

    //成员方法-属性访问器和设置器
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name=name;
    }

    public String getAuthor(){
        return this.author;
    }

    public void setAuthor(String author){
        this.author=author;
    }

    public float getPrice(){
        return this.price;
    }

    public void setPrice(float price){
        this.price=price;
    }

    public String getISBN(){
        return this.ISBN;
    }

    public void setISBN(String isbn){
        this.ISBN=isbn;
    }

    public String toString(){
        return "Book\r\n\tname: "+this.getName();
    }

    public Book __clone(){
        return this;
    }

    public Book(){

    }

}
