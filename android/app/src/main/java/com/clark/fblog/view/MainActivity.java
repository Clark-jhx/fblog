package com.clark.fblog.view;

import android.os.Bundle;
import android.support.annotation.NonNull;

import com.clark.fblog.Presenter.NewsPresenterImple;
import com.orhanobut.logger.AndroidLogAdapter;
import com.orhanobut.logger.Logger;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity implements IMainView {

    private static final String NEWS_CHANNEL = "/news";

    private static final String GET_HOT_NEWS = "getHotNews";
    private static final String GET_RECENT_NEWS = "getRecentNews";
    private static final String GET_RECOMMEND_NEWS = "getRecommendNews";
    private static final String GET_NEW_BODY = "getNewBody";
    private static final String GET_NEW_COMMENTS = "getNewComments";

    private static final String TRIGGER_HOT_NEWS = "triggerHotNews";
    private static final String TRIGGER_RECENT_NEWS = "triggerRecentNews";
    private static final String TRIGGER_RECOMMEND_NEWS = "triggerRecommendNews";
    private static final String TRIGGER_NEW_BODY = "triggerNewBody";
    private static final String TRIGGER_NEW_COMMENTS = "triggerNewComments";

    private static final String KEY_COUNT = "count";
    private static final String KEY_PAGE_INDEX = "pageIndex";
    private static final String KEY_PAGE_SIZE = "pageSize";
    private static final String KEY_NEW_ID = "newId";

    private MethodChannel mMethodChannel;
    private MethodCallHandler mNewsMethodCallHandler;
    private NewsPresenterImple mNewsPresenterImple;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        Logger.addLogAdapter(new AndroidLogAdapter());

        mNewsPresenterImple = new NewsPresenterImple(this);
        mNewsMethodCallHandler = new NewsMethodCallHandler();

        mMethodChannel = new MethodChannel(getFlutterView(), NEWS_CHANNEL);
        mMethodChannel.setMethodCallHandler(mNewsMethodCallHandler);

    }

    @Override
    public void triggerHotNews(String news) {
        mMethodChannel.invokeMethod(TRIGGER_HOT_NEWS, news);
    }

    @Override
    public void triggerRecentNews(String news) {
        mMethodChannel.invokeMethod(TRIGGER_RECENT_NEWS, news);
    }

    @Override
    public void triggerRecommendNews(String news) {
        mMethodChannel.invokeMethod(TRIGGER_RECOMMEND_NEWS, news);
    }

    @Override
    public void triggerNewBody(String newBody) {
        mMethodChannel.invokeMethod(TRIGGER_NEW_BODY, newBody);
    }

    @Override
    public void triggerNewComments(String comments) {
        mMethodChannel.invokeMethod(TRIGGER_NEW_COMMENTS, comments);
    }

    /**
     * 接受flutter的调用
     */
    class NewsMethodCallHandler implements MethodChannel.MethodCallHandler {

        @Override
        public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

            if (GET_HOT_NEWS.equals(call.method)) {
                int count = call.argument(KEY_COUNT);
                mNewsPresenterImple.getHotNews(count);
            }
            if (GET_RECENT_NEWS.equals(call.method)) {
                int pageIndex = call.argument(KEY_PAGE_INDEX);
                int pageSize = call.argument(KEY_PAGE_SIZE);

                mNewsPresenterImple.getRecentNews(pageIndex, pageSize);
            }
            if (GET_RECOMMEND_NEWS.equals(call.method)) {
                int pageIndex = call.argument(KEY_PAGE_INDEX);
                int pageSize = call.argument(KEY_PAGE_SIZE);

                mNewsPresenterImple.getRecommendNews(pageIndex, pageSize);
            }
            if (GET_NEW_BODY.equals(call.method)) {
                int newId = call.argument(KEY_NEW_ID);

                mNewsPresenterImple.getNewBody(newId);
            }
            if (GET_NEW_COMMENTS.equals(call.method)) {
                int pageIndex = call.argument(KEY_PAGE_INDEX);
                int pageSize = call.argument(KEY_PAGE_SIZE);
                int newId = call.argument(KEY_NEW_ID);

                mNewsPresenterImple.getNewComments(newId, pageIndex, pageSize);
            }
        }
    }
}