package yinzi;

/**
 * Created by DaiYan on 2017/4/23.
 */

/**
 * 如何实现边听歌边打游戏
 */
public class Demo {
    public static void main(String[] args){
        System.out.println("beging:\r\n");
        playGames();
        playMusics();
        System.out.println("end:\r\n");
    }

    public static void playGames(){
        for(int i=0;i<50;i++)
            System.out.println("playing games\r\n");
    }


    public static void playMusics(){
        for(int i=0;i<50;i++)
            System.out.println("playing musics\r\n");
    }

}
