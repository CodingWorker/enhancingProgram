package com.shiyanlou.test;

import com.shiyanlou.test.test.Human;
import com.shiyanlou.test.test.Woman;

/**
 * Created by Administrator on 2017/2/5.
 */
public class WomanFactory extends HumanFactory2 {
    public Human createHuman(){
        return getWoman();
    }

    private Woman getWoman(){
        return new Woman();
    }
}
