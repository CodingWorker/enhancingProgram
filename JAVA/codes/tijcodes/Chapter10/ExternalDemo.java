import java.io.*;

/**
 * Created by DaiYan on 2017/4/12.
 */
class Data2 implements Externalizable{
    public int i;
    public Data2(int i){
        this.i=i;
    }

    @Override
    public String toString(){
        return new Integer(i).toString();
    }

    public void writeExternal(ObjectOutput out){}
    public void readExternal(ObjectInput input){}
}
class Worm2 implements Externalizable{
    public Data[] d={
            new Data(r()),new Data(r()),new Data(r())
    };
    private Worm next;
    private char c;
    public Worm2(int i,char c){
        this.c=c;
        if(--i>0){
            next=new Worm(i,(char)(c+1));
        }
    }

    public void writeExternal(ObjectOutput out){}
    public void readExternal(ObjectInput input){}

    public Worm2(){
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
            ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream("Chapter10/staticfiles/worm2.out"));
            out.writeObject("Worm2 Storage");
            out.writeObject(w);
            out.close();

            ObjectInputStream in=new ObjectInputStream(new FileInputStream("Chapter10/staticfiles/worm2.out"));
            String s=(String)in.readObject();
            Worm w2=(Worm) in.readObject();
            System.out.println(s+"w2= "+w2);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
