package test.java.lang;

import org.junit.Test;

import javax.security.auth.callback.CallbackHandler;

/**
 * Created by daiya on 2017/9/12.
 */
public class CharacterTest {
    @Test
    public void run0(){
        char ch='a';
        Character character=Character.valueOf(ch);
        System.out.println(character);
        System.out.println(character.charValue());
    }

    @Test
    public void run1(){
        Character ch1='a';
        Character ch2='a';
        Character ch3=new Character((char)97);
        System.out.println(ch1.equals(ch2));//true
        System.out.println(ch1.equals(ch3));
        System.out.println((int)'a');
    }
}
