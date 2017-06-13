package Chapter07.innerscopes;

/**
 * Created by DaiYan on 2017/3/20.
 */
public class Parcel5 {
    public void main(){
        Parcel5 p=new Parcel5();
        p.track();
    }

    private void track(){
        this.internalTracking(true);
    }

    private void internalTracking(boolean b){
        if(b){
            class TrackingSlip{  //除此if分支块外不能访问此类
                private String id;
                TrackingSlip(String s){
                    id=s;
                }

                String getSlip(){
                    return id;
                }
            }
            TrackingSlip ts=new TrackingSlip("slip");
            String s=ts.getSlip();
        }
    }

}
