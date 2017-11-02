package com.test.study.resourcebundle;

import java.util.ResourceBundle;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/2
 * Project: some-stuff-study
 */

/**
 * reosurcebundle 主要用在web项目中
 *
 我的\WEB-INF\classes\com\yaray\tools目录下有config.properties文件,如下使用:
 ResourceBundle resB = ResourceBundle.getBundle("com.yaray.tools.config");
 或:
 ResourceBundle resB = ResourceBundle.getBundle("com/yaray/tools/config");
 */
public class ResourceBundleTest {
    public static void main(String[] args) {
        ResourceBundle bundle = ResourceBundle.getBundle("com.test.study.resourcebundle.mybundle");
        System.out.println(bundle.getString("cancelKey"));
    }


}
