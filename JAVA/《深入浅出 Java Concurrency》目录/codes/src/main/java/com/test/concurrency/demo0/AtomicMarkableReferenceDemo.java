package com.test.concurrency.demo0;

import java.lang.ref.Reference;
import java.sql.Ref;
import java.util.concurrent.atomic.AtomicMarkableReference;

/**
 * Created by DaiYan on 2017/9/9.
 */
public class AtomicMarkableReferenceDemo {
    public static AtomicMarkableReference reference=new AtomicMarkableReference(new Object(),false);
    public static void main(String[] args){
        System.out.println(reference);
        reference.set(new AtomicMarkableReferenceDemo(),true);
        System.out.println(reference.get(new boolean[]{true}));
    }
}
