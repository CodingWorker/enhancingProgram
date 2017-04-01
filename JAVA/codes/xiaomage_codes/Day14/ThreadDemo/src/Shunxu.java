import com.sun.media.jfxmedia.events.PlayerStateListener;

/**
 * Created by DaiYan on 2017/4/1.
 */
public class Shunxu {
    public static void main(String[] args){
        for(int i=0;i<50;i++){
            playMusic();
        }

        for(int i=0;i<50;i++){
            playGame();
        }
    }

    public static void playMusic(){
        System.out.println("play music");
    }

    public static void playGame(){
        System.out.println("play game");
    }
}
