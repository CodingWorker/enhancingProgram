package chapter06.item32;

/**
 * Created by DaiYan on 2017/4/13.
 */
public class BitField {
    //这样定义方便使用位操作：求并和交集
    public static final int STYLE_BOLD=1<<0;
    public static final int STYLE_ITALIC=1<<2;
    public static final int STYLE_UNDERLINE=1<<3;
    public static final int STYLE_STRICHTHROUGH=1<<4;

    public void add(){

    }
}
