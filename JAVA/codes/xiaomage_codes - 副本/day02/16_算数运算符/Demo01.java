public class Demo01
{
	public static void main(String[] args){
		System.out.println('a' + 'b');    //195
		System.out.println(1.0/0);    //正穷大
		System.out.println(-1.0 / 0);  //负无穷大
		System.out.println(0.0 / 0.0);  //NaN
		System.out.println(Math.NaN == Math.NaN);
	}
}