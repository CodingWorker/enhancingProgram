package com.test.study;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEa
 * User:    DaiYan
 * Date:    2017/11/3
 * Project: some-stuff-study
 */
public class KuaiJieJian {
    public static void main(String[] args) {
        //Ctrl+Shift + Enter，语句完成
        String name = new String("Name");

        //“！”，否定完成，输入表达式时按 “！”键
        //Ctrl+E，最近的文件
        //Ctrl+Shift+E，最近更改的文件
        //Shift+Click，可以关闭文件,点击关闭指定文件
        //Ctrl+[ OR ]，可以跑到大括号的开头与结尾
        {
            int a;
            int b;
            synchronized (KuaiJieJian.class) {
                a = 1;
                b = 2;
            }
            System.out.println(a+b);
            System.out.println(a);
            System.out.println(b);
        }

        //Ctrl+F12，可以显示当前文件的结构
        Runnable run=new Runnable() {
            public void run() {
                System.out.println(123);
            }
        };

        //Ctrl+F7，可以查询当前元素在当前文件中的引用，然后按 F3 可以选择
        //Ctrl+N，可以快速打开类
        //Ctrl+Shift+N，可以快速打开文件
        //alt+Q，可以看到当前方法的声明
        //Ctrl+P，可以显示参数信息
        //Ctrl+Shift+Insert，可以选择剪贴板内容并插入
        //alt+Insert，可以生成构造器/Getter/Setter等
        //Ctrl+alt+V，可以引入变量。例如：new String(); 自动导入变量定义
        String s = new String();

        //Ctrl+alt+T，可以把代码包在一个块内，例如：try/catch
        try {
            int a=10,b=12;
            int c=a/b;
        } catch (Exception e) {
            e.printStackTrace();
        }

        //Ctrl+Enter，或者alt+Enter导入包，自动修正
        List < String> strings = new ArrayList < String>();

        //Ctrl+alt+L，格式化代码


        //Ctrl+alt+I，将选中的代码进行自动缩进编排，这个功能在编辑 JSP 文件时也可以工作
 int a=1;
                     int b=2;
      if(a < b) System.out.println(a+b);

        //Ctrl+alt+O，优化导入的类和包，这样就不需要在import处使用alt+enter了，直接在任何的位置使用都行

        //Ctrl+R，替换文本
        //Ctrl+F，查找文本

        //Ctrl+Shift+Space，自动补全代码,有了.自动提示
        String str="";

        //Ctrl+空格，代码提示（与系统输入法快捷键冲突）

        //Ctrl+Shift+Alt+N，查找类中的方法或变量

        //Alt+Shift+C，查看最近的更改

        //Alt+Shift+Up/Down，当前代码上/下移一行

        //Shift+F6，重构 – 重命名当前变量/类/文件等

        //Ctrl+X，删除行,相当于剪切

        //Ctrl+D，复制并在下面粘贴本行

        //Ctrl+/或Ctrl+Shift+/，注释（//或者/**/），ctrl+/为单行注释，ctrl+shift+/为多行注释

        //Ctrl+J，自动代码（例如：serr）

        //Ctrl+Alt+J，用动态模板环绕
        a=12;

        //Ctrl+H，显示类结构图（类的继承层次）

        //Ctrl+Q，显示注释文档


    }
}
