package chapter04.item19;

/**
 * 使用静态导入
 */
import static chapter04.item19.ToolsContstant.A;
/**
 * Created by DaiYan on 2017/4/26.
 */

public class StaticImport {
    public String test(String prefix){
        return prefix+"_"+A;
    }

}
