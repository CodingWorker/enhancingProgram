import java.io.*;
import java.util.Random;

/**
 * Created by DaiYan on 2017/4/12.
 */
class Data implements Serializable{
    public int i;
    public Data(int i){
        this.i=i;
    }

    @Override
    public String toString(){
        return new Integer(i).toString();
    }
}
public class Worm implements Serializable{
    public Data[] d={
            new Data(r()),new Data(r()),new Data(r())
    };
    private Worm next;
    private char c;
    public Worm(int i,char c){
        this.c=c;
        if(--i>0){
            next=new Worm(i,(char)(c+1));
        }
    }

    public Worm(){
        System.out.println("default constructor");
    }

    public static int r(){
        return (int)(Math.random()*10);
    }

    @Override
    public String toString(){
        String s=":"+c+"(";
        for(int i=0;i<d.length;i++){
            s+="{"+d[i].toString()+"}";
        }

        s+=")";

        if(next!=null){
            s+=next.toString();
        }

        return s;
    }

    public static void main(String[] args){
        Worm w=new Worm(6,'a');
        System.out.println("w= "+w);

        try {
            ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream("Chapter10/staticfiles/worm.out"));
            out.writeObject("Worm Storage");
            out.writeObject(w);
            out.close();

            ObjectInputStream in=new ObjectInputStream(new FileInputStream("Chapter10/staticfiles/worm.out"));
            String s=(String)in.readObject();
            Worm w2=(Worm) in.readObject();
            System.out.println(s+"w2= "+w2);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
