package chapter04.item13;

import com.sun.xml.internal.fastinfoset.util.StringArray;

import javax.lang.model.element.NestingKind;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class Demo1 {
    //私有化静态不可变数组，因为长度非0的数组中是可变的
    private static final String[] strArr={};
    //为此数组提供一个不可变的列表
    public List<String> strList= Collections.unmodifiableList(Arrays.asList(strArr));
}
