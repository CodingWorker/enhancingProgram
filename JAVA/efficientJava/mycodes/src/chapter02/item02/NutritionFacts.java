package chapter02.item02;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class NutritionFacts {//重叠构造器模式
    private final int servingSize;
    private final int servings;
    private final int calories;
    private final int fat;
    private final int sodium;
    private final int carbohydrate;
    public NutritionFacts(int servingSize,int servings){
        this(servingSize,servings,0);
    }
    public NutritionFacts(int servingSize,int servings,int calories){
        this(servingSize,servings,calories,0);
    }
    public NutritionFacts(int servingSize,int servings,int calories,int fat){
        this(servingSize,servings,calories,fat,0);
    }

    public NutritionFacts(int servingSize,int servings,int calories,int fat,int sodium){
        this(servingSize,servings,calories,fat,sodium,0);
    }

    public NutritionFacts(int servingSize,int servings,int calories,int fat,int sodium,int carbohydrate){
        this.servingSize=servingSize;
        this.servings=servings;
        this.calories=calories;
        this.fat=fat;
        this.sodium=sodium;
        this.carbohydrate=carbohydrate;
    }
}
