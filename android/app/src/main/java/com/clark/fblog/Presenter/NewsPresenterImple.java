package com.clark.fblog.Presenter;

import com.clark.fblog.view.MainActivity;
import com.clark.fblog.model.NewsIModelImple;
import com.clark.fblog.mvp.IView;

public class NewsPresenterImple extends NewsPresenter{

    private NewsIModelImple newsIModelImple;

    public NewsPresenterImple(){}

    public NewsPresenterImple(IView v){
        super(v);
        newsIModelImple = new NewsIModelImple();
    }

    @Override
    public void getHotNews(int itemCount) {
        newsIModelImple.getHotNews(itemCount, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerHotNews(result);
            }
        });

    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize) {
        newsIModelImple.getRecentNews(pageIndex, pageSize, new ResultCallback() {
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerRecentNews(result);
            }
        });
    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize) {
        newsIModelImple.getRecommendNews(pageIndex, pageSize, new ResultCallback(){
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerRecommendNews(result);
            }
        });
    }

    @Override
    public void getNewBody(int newId) {
        newsIModelImple.getNewBody(newId, new ResultCallback(){
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerNewBody(result);
            }
        });
    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize) {
        newsIModelImple.getNewComments(newId, pageIndex, pageSize, new ResultCallback(){
            @Override
            public void result(String result) {
                ((MainActivity)getView()).triggerNewComments(result);
            }
        });
    }
}
