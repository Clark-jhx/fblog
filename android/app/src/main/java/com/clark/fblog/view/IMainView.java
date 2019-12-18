package com.clark.fblog.view;

import com.clark.fblog.mvp.IView;

public interface IMainView extends IView {
    public void triggerHotNews(String news);
    public void triggerRecentNews(String news);
    public void triggerRecommendNews(String news);
    public void triggerNewBody(String newBody);
    public void triggerNewComments(String comments);
}
