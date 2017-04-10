package day01_why;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class GameDemo {
    public static void main(String[] args){
        System.out.println("begin...");
        /**
         * //========顺序执行======
        //play game
        playGame();

        //have songs
        playMusic();
         //=========================
        解决办法：多进程或者多线程

         */

        System.out.println("end");
    }

    private static void playGame(){
        for(int i=0;i<100;i++){
            System.out.println("打游戏");
        }
    }

    private static void playMusic(){
        for(int i=0;i<100;i++){
            System.out.println("听歌");
        }
    }
}
