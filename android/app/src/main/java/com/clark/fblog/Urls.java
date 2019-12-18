package com.clark.fblog;

public class Urls {

    /**
     * 新闻
     */
    public static final String BASE = "http://wcf.open.cnblogs.com/";
    public static final String NEWS_BASE = BASE + "news/";
    public static final String HOT = NEWS_BASE + "hot/";
    public static final String RECENT = NEWS_BASE + "recent/";
    public static final String RECENT_PAGE = NEWS_BASE + "recent/paged/";
    public static final String RECOMMEND_PAGE = NEWS_BASE + "recommend/paged/";
    public static final String ITEM = NEWS_BASE + "item/";

    /**
     * 热门新闻列表hot/{itemcount}
     *
     * @param itemCount
     * @return
     */
    public static String getHOT(int itemCount) {
        return HOT + itemCount;
    }

    /**
     * 最新新闻列表recent/{itemcount}
     *
     * @param itemCount
     * @return
     */
    public static String getRECENT(int itemCount) {
        return RECENT + itemCount;
    }

    /**
     * 分页获取最新新闻列表recent/paged/{pageIndex}/{pageSize}
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public static String getRecentPage(int pageIndex, int pageSize) {
        return RECENT_PAGE + pageIndex + "/" + pageSize;
    }

    /**
     * 分页获取推荐新闻列表recommend/paged/{pageIndex}/{pageSize}
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public static String getRecommendPage(int pageIndex, int pageSize) {
        return RECOMMEND_PAGE + pageIndex + "/" + pageSize;
    }

    /**
     * 获取新闻内容item/{contentId}
     *
     * @param contentId
     * @return
     */
    public static String getNewBody(int contentId) {
        return ITEM + contentId;
    }

    /**
     * item/{contentId}/comments/{pageIndex}/{pageSize}
     *
     * @param contentId
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public static String getNewCOMMENTS(int contentId, int pageIndex, int pageSize) {
        return ITEM + contentId + "/comments/" + pageIndex + "/" + pageSize;
    }


}
