package com.clark.fblog.Presenter;

import com.clark.fblog.model.NewsIModel;
import com.clark.fblog.model.NewsIModelImple_;
import com.clark.fblog.model.NewsModelImple;
import com.clark.fblog.mvp.IView;
import com.clark.fblog.view.MainActivity;

public class NewsPresenterImple_ extends NewsPresenter{

    private NewsIModel newsIModelImple;

    public NewsPresenterImple_(){}

    public NewsPresenterImple_(IView v){
        super(v);
        newsIModelImple = new NewsIModelImple_();
    }

    @Override
    public void getHotNews(int pageIndex, int pageSize, String startDate, String endDate) {
        newsIModelImple.getHotNews(pageIndex, pageSize, startDate, endDate, new ResultCallback() {
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
