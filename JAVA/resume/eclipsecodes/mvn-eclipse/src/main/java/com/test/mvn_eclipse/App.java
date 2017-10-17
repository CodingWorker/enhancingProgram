package com.test.mvn_eclipse;

//import com.fasterxml.jackson.core.JsonProcessingException;//如果引入失败则可能是版本的不一致
import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.mvn_eclipse.model.Person;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )throws Exception
    {
        System.out.println( "Hello World!" );
        
        Person person=new Person();
        person.setName("Daniel");
        person.setAge(12);
        person.setScore(100);
        
        try {
            System.out.println(person);
        }catch(Exception ex){
        	ex.printStackTrace();
        }
    }
}
