public class Main {
    public String getName() {
        this.main(null);
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;

    public Main Main(){
        System.out.println("create the Main");
        return null;
    }

    public static void main(String[] args) {
        Main main=new Main();
        Sub ss=main.new Sub();
        new Main().Main();
       int[] arr=new int[3];
        System.out.println(arr[0]);

        A subA=main.test();


    }

    public SubA test(){
        return new SubA(12);
    }

    abstract class A{
        private int a;
        public A(int a){
            this.a=a;
        }

        public void print(){
            System.out.println(this.a);
        }

    }

    class SubA extends A{
        public SubA(int subA){
            super(subA);
            this.print();
        }
    }


    class Sub{
        public String name;
        public String age;
    }

    static class sub2{
    }


}
