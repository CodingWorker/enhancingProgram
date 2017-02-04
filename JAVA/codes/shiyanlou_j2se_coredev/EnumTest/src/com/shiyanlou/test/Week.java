package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public enum Week {
    Monday("Mon"),Tuesday("Tue"),Wensiday("Wen"),Thirsday("Thi"),
    Friday("Fri"),Sataurday("Sat"),Sunday("Sun");

    private String abbr;
    private Week(String abbr){
        this.abbr=abbr;
    }

    public String getAbbr(){
        return this.abbr;
    }
}
