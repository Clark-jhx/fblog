package com.clark.fblog.Presenter;


import com.clark.fblog.model.NewsIModelImple;
import com.clark.fblog.model.TestNewsModelImple;
import com.clark.fblog.mvp.IView;

public class TestPresenterImple extends NewsPresenter {

    private TestNewsModelImple testNewsModelImple;

    public TestPresenterImple(){}

    public TestPresenterImple(IView v){
        super(v);
        testNewsModelImple = new TestNewsModelImple(getView());
    }

    @Override
    public void getHotNews(int itemCount) {

    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize) {

    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize) {

    }

    @Override
    public void getNewBody(int newId) {

    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize) {

    }
}
