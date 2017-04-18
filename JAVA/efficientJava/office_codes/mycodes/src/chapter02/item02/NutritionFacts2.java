package chapter02.item02;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class NutritionFacts2 {  //使用builder模式,而且类是不可变类
    private final int servingSize;
    private final int servings;
    private final int calories;
    private final int fat;
    private final int sodium;
    private final int carbohydrate;

    public static class Builder{
        //必须参数
        private final int servingSize;
        private final int servings;

        //可选参数
        private int calories=0;
        private int fat=0;
        private int carbohydrate=0;
        private int sodium=0;

        public Builder(int servingSize,int servings){
            this.servingSize=servingSize;
            this.servings=servings;
        }

        public Builder calories(int val){
            calories=val;
            return this;
        }

        public Builder fat(int val){
            fat=val;
            return this;
        }

        public Builder carbohydrate(int val){
            carbohydrate=val;
            return this;
        }

        public Builder sodium(int val){
            sodium=val;
            return this;
        }

        public NutritionFacts2 build(){
            return new NutritionFacts2(this);
        }
    }

    private NutritionFacts2(Builder builder){
        servingSize=builder.servingSize;
        servings=builder.servings;
        calories=builder.calories;
        fat=builder.fat;
        sodium=builder.sodium;
        carbohydrate=builder.carbohydrate;
    }
}

class Client{
    //客户端调用代码
    public void Test(){
        NutritionFacts2 n2=new NutritionFacts2.Builder(100,100)
                .calories(10)
                .sodium(10)
                .carbohydrate(10)
                .build();
    }

}
