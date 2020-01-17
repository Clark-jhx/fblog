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

    public static String getHot(int pageIndex, int pageSize, String startDate, String endDate){
        StringBuffer buffer = new StringBuffer();
        return buffer.append(HOT)
            .append("?")
            .append("pageIndex=")
            .append(pageIndex)
            .append("&pageSize=")
            .append(pageSize)
            .append("&startDate=")
            .append(startDate)
            .append("&endDate=")
            .append(endDate)
            .toString();
    }

    public static String getRecent(int pageIndex, int pageSize){
        StringBuffer buffer = new StringBuffer();
        return buffer.append(RECENT)
            .append("?")
            .append("pageIndex=")
            .append(pageIndex)
            .append("&pageSize=")
            .append(pageSize)
            .toString();
    }

    public static String getRecommend(int pageIndex, int pageSize){
        StringBuffer buffer = new StringBuffer();
        return buffer.append(RECOMMEND)
            .append("?")
            .append("pageIndex=")
            .append(pageIndex)
            .append("&pageSize=")
            .append(pageSize)
            .toString();
    }

    public static String getNewBody(int id){
        return BASE + "/newsitems/" + id + "/body";
    }

    public static String getNewComments(int id, int pageIndex, int pageSize){
        StringBuffer buffer = new StringBuffer();
        return buffer.append(BASE + "/news/" + id + "/comments")
            .append("?")
            .append("pageIndex=")
            .append(pageIndex)
            .append("&pageSize=")
            .append(pageSize)
            .toString();
    }
}
