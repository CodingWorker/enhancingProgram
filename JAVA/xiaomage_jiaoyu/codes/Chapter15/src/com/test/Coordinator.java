package com.test;

/**
 * Created by DaiYan on 2017/9/10.
 */
public class Coordinator {
    private static int productCount;

    public static int getProductCount() {
        return productCount;
    }

    public static void setProductCount(int productCount) {
        Coordinator.productCount = productCount;
    }
}
