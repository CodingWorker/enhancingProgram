package chapter11.item75;

import java.io.Serializable;

/**
 * Created by DaiYan on 2017/4/14.
 */

/**
 * Name的实例域精确的反映了它的逻辑内容
 */
public class Name implements Serializable {
    private final String lastName;
    private final String firstName;
    private final String middleName;
    public Name(String lastName, String firstName,String middleName){
        this.lastName=lastName;
        this.firstName=firstName;
        this.middleName=middleName;
    }

    public void readObject() throws Exception{
       if(null==lastName || null==middleName){
           throw new Exception("lastName or middleName can not be null");
       }
    }
}
