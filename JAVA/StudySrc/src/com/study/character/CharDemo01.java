package com.study.character;

/**
 * Created by DaiYan on 2017/3/3.
 */
public class CharDemo01 {
    public static void main(String[] args){
        Character character=new Character('c');
        System.out.println(Character.MIN_RADIX);
        System.out.println((int)Character.MIN_VALUE);
        System.out.println((int)Character.MAX_VALUE);
        System.out.println((char) 12);
        System.out.println(Character.TYPE); //char
    }

}
