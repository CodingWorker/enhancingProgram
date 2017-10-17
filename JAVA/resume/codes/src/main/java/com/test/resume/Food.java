package com.test.resume;

/**
 * Created by IntelliJ IDEA
 * Project: resume-app
 * User: DaiYan
 * Date: 2017/10/18
 */
public interface Food {
    enum Coffee implements Food{
        BLACK_COFFEE,DECAF_COFFEE,LATTE,CAPPUCCINO
    }

    enum Dessert implements Food{
        FRUIT,CAKE,GELATO
    }
}

