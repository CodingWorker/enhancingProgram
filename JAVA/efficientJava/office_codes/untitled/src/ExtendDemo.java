/**
 * Created by DaiYan on 2017/3/8.
 */
class ExtendBase{
    private  String a;
//    public void aa(String[] arr){

//    }

    public void aa(String... arr){

    }
    public void setA(String a){
        this.a=a;
    }

    public String getA(){
        switch(a){
            case "1":
                break;
        }

        int c=12;
        cc:for (String cc: new String[]{"a","b"}) {
            for(int i=0;i<10;i++){
                for(int j=0;j<10;j++){
                    break cc;
                }
            }
        }

        return this.a;
    }
}
public class ExtendDemo extends ExtendBase{
    public static void main(String[] args){
        ExtendDemo obj=new ExtendDemo();
        obj.setA("aaaaa");
        System.out.println(obj.getA());
    }
}
