package chapter02.item02.builder;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class Node2 {
    private int var1;
    private int var2;

    private int var3 = 0;
    private int var4 = 0;

    public static class Builder2 implements IBuilder {
        private int var1;
        private int var2;

        private int var3 = 0;
        private int var4 = 0;

        public Builder2(int var1, int var2) {
            this.var1 = var1;
            this.var2 = var2;
        }

        public Builder2 var3(int var3) {
            this.var3 = var3;
            return this;
        }

        public Builder2 var4(int var4) {
            this.var4 = var4;
            return this;
        }

        public Node2 build() {
            return new Node2(this);
        }
    }

    private Node2(Builder2 builder) {
        this.var1 = builder.var1;
        this.var2 = builder.var2;
        this.var3 = builder.var3;
        this.var4 = builder.var4;
    }
}

class Test2 {
    public void test() {
        chapter02.item02.builder.Node1 node = new chapter02.item02.builder.Node1.Builder(1, 2).var3(12).build();
    }
}
