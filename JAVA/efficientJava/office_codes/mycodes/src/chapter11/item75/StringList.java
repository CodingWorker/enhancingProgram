package chapter11.item75;

import java.io.Serializable;

/**
 * Created by DaiYan on 2017/4/14.
 */
public final class StringList implements Serializable{
    private int size=0;
    private Entry head=null;
    private static class Entry implements Serializable{
        String data;
        Entry next;
        Entry previous;
    }
}
