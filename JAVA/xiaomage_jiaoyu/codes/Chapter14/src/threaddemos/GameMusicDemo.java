package threaddemos;

/**
 * Created by DaiYan on 2017/9/10.
 */
class GameDemo extends Thread{
    @Override
    public void run(){
        playGame();
    }

    public void playGame(){
        for(int i=0;i<50;i++){
            System.out.println("play-game: "+i);
        }
    }
}

class MusicDemo implements Runnable{
    @Override
    public void run(){
        playMusic();
    }

    public void playMusic(){
        for(int i=0;i<50;i++){
            System.out.println("play-music: "+i);
        }
    }
}
public class GameMusicDemo {
    public static void main(String[] args){
        System.out.println("====main start===");
//        new GameDemo().start();
//        new Thread(new MusicDemo()).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                for(int i=0;i<50;i++){
                    System.out.println("play-game: "+i);
                }
            }
        }).start();

        (new Thread(){
            public void run(){
                for(int i=0;i<50;i++){
                    System.out.println("play-muisc: "+i);
                }
            }
        }).start();

        System.out.println("====main end===");
    }
}
