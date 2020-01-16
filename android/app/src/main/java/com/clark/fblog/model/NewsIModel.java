package com.clark.fblog.model;

import com.clark.fblog.mvp.IModel;
import com.clark.fblog.mvp.IPresenter;

public interface NewsIModel extends IModel {
    void getHotNews(int pageIndex, int pageSize, String startDate, String endDate, IPresenter.ResultCallback resultCallback);
    void getRecentNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback);

    void getRecommendNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback);

    void getNewBody(int newId, IPresenter.ResultCallback resultCallback);

    void getNewComments(int newId, int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback);
}
