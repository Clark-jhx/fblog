package com.clark.fblog.Presenter;

import com.clark.fblog.mvp.BasePresenter;
import com.clark.fblog.mvp.IView;

public abstract class NewsPresenter<T extends IView> extends BasePresenter {
    public NewsPresenter(){
        super();
    }
    public NewsPresenter(T v){
        super(v);
    }
    public abstract void getHotNews(int pageIndex, int pageSize, String startDate, String endDate);
    public abstract void getRecentNews(int pageIndex, int pageSize);

    public abstract void getRecommendNews(int pageIndex, int pageSize);

    public abstract void getNewBody(int newId);

    public abstract void getNewComments(int newId, int pageIndex, int pageSize);
}
