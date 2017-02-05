package com.shiyanlou.test;

import com.shiyanlou.test.test.Human;
import com.shiyanlou.test.test.Man;

/**
 * Created by Administrator on 2017/2/5.
 */
public class ManFactory extends HumanFactory2 {
    public Human createHuman(){
        return getMan();
    }

    private Man getMan(){
        return new Man();
    }
}
