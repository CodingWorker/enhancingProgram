package Chapter07;

/**
 * Created by DaiYan on 2017/6/13.
 */

interface IIf{
    String toString();
}

public class Test2 {
    public static void main(String[] args){
        boolean flag=false;
        IIf iIf=null;
        if(flag) {
            //可以在任何位置创建一个内部类
            class InnerIfTrue{
                public int a;
                public int b;

                public InnerIfTrue(int a,int b){
                    this.a=a;
                    this.b=b;
                }

                @Override
                public String toString(){
                    return String.format("a: %d, b:%d",this.a,this.b);
                }
            }

            InnerIfTrue innerIf=new InnerIfTrue(10,12);
            System.out.println(innerIf.toString());
        }else{
            class InnerIfFalse implements IIf{
                public String Name;
                public int Age;

                public InnerIfFalse(String name,int age){
                    this.Name=name;
                    this.Age=age;
                }

                @Override
                public String toString(){
                    return String.format("Name: %s, Age: %d",this.Name,this.Age);
                }
            }

            iIf=new InnerIfFalse("Daniel",12);
        }

        //出了块作用域就不能直接访问到内部类了
        if(null!=iIf){
            System.out.println(iIf.toString());
        }else{
            System.out.println("the iIf is null");
        }

    }

}
