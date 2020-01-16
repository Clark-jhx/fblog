package com.clark.fblog;

import com.clark.fblog.mvp.BasePresenter;

public class Urls {

    public static final String BASE = "https://api.cnblogs.com/api";
    public static final String HOT = BASE + "/newsitems/@hot";
    public static final String RECENT = BASE + "/NewsItems";
    public static final String RECOMMEND = BASE + "/newsitems/@recommended";
    public static final String API_TOKEN = "https://api.cnblogs.com/token";

    public static String getApiToken(){
        return API_TOKEN;
    }

    public static String getHot(){
        return HOT;
    }

    public static String getRecent(){
        return RECENT;
    }

    public static String getRecommend(){
        return RECOMMEND;
    }

    public static String getNewBody(int id){
        return BASE + "/newsitems/" + id + "/body";
    }

    public static String getNewComments(int id){
        return BASE + "/news/" + id + "/comments";
    }
}
