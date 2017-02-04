import com.shiyanlou.test.Book;

import java.io.Serializable;
import java.lang.reflect.Constructor;

public class Main {

    public static void main(String[] args) throws Exception{
        System.out.println("Hello World!");
        Book book=new Book("java开发","Daniel",123,"209102012001");
        System.out.println(book.toString());
        Book book2=book.__clone();    //book2与book指向同一个实例
        book2.setName("java核心开发");
        System.out.println(book.toString());
        Book book3=book.getClass().newInstance();    //会调用空的参数的构造方法,book3是不同的实例
        System.out.println(book3.toString());

        Constructor<Book> constructor=Book.class.getDeclaredConstructor(String.class,String.class,float.class,String.class);
        Book book4=constructor.newInstance("java 动态类开发","Daniel",123,"1232222333");
        System.out.println(book4.toString());
    }
}
