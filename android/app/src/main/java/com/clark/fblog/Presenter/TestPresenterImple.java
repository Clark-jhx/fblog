package com.clark.fblog.Presenter;

import com.clark.fblog.model.TestNewsModelImple;
import com.clark.fblog.view.IMainView;
import com.clark.fblog.view.MainActivity;

public class TestPresenterImple extends NewsPresenter {

    private TestNewsModelImple testNewsModelImple;

    public TestPresenterImple(){}

    public TestPresenterImple(IMainView v){
        super(v);
        testNewsModelImple = new TestNewsModelImple(getView());
    }

    @Override
    public void getHotNews(int itemCount) {
        testNewsModelImple.getHotNews(itemCount, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerHotNews(result);
            }
        });
    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize) {
        testNewsModelImple.getRecentNews(pageIndex, pageSize, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerRecentNews(result);
            }
        });
    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize) {
        testNewsModelImple.getRecommendNews(pageIndex, pageSize, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerRecommendNews(result);
            }
        });
    }

    @Override
    public void getNewBody(int newId) {
        testNewsModelImple.getNewBody(newId, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerNewBody(result);
            }
        });
    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize) {
        testNewsModelImple.getNewComments(newId, pageIndex, pageSize, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerNewComments(result);
            }
        });
    }
}
