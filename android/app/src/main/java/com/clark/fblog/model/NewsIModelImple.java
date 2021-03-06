package com.clark.fblog.model;

import com.clark.fblog.Urls;
import com.clark.fblog.bean.IHtmlToObject;
import com.clark.fblog.bean.NewBody;
import com.clark.fblog.bean.NewComments;
import com.clark.fblog.bean.News;
import com.clark.fblog.mvp.IPresenter;
import com.clark.fblog.utils.ToJson;
import com.google.gson.Gson;
import com.orhanobut.logger.Logger;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import io.reactivex.Flowable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class NewsIModelImple implements NewsIModel {

    private String TAG = "NewsIModelImple";
    private static final int NET_TIMEOUT = 5000;

    @Override
    public void getHotNews(int itemCount, IPresenter.ResultCallback resultCallback) {

        commonGetNews(Urls.getHOT(itemCount), News.class, resultCallback);
    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        commonGetNews(Urls.getRecentPage(pageIndex, pageSize), News.class, resultCallback);
    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        commonGetNews(Urls.getRecommendPage(pageIndex, pageSize), News.class, resultCallback);
    }

    @Override
    public void getNewBody(int newId, IPresenter.ResultCallback resultCallback) {
        commonGetNews(Urls.getNewBody(newId), NewBody.class, resultCallback);
    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        commonGetNews(Urls.getNewCOMMENTS(newId, pageIndex, pageSize), NewComments.class, resultCallback);
    }

    private <T extends IHtmlToObject> void commonGetNews(String url, Class<T> c, IPresenter.ResultCallback resultCallback){

        Flowable.just(url)
                .subscribeOn(Schedulers.io())
                .map(new Function<String, String>() {
                    @Override
                    public String apply(String url) throws Exception {
                        return netGetNews(url, c);
                    }
                })
                .timeout(NET_TIMEOUT, TimeUnit.MILLISECONDS)
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<String>() {
                    @Override
                    public void accept(String s) throws Exception {
                        resultCallback.result(s);
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(Throwable throwable) throws Exception {
                        Logger.e(throwable.getMessage());
                        resultCallback.result("");
                    }
                });
    }

    private <T extends IHtmlToObject> String netGetNews(String url, Class<T> c) throws IOException, InstantiationException, IllegalAccessException {
        News news;
        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder().url(url).build();
        Call call = client.newCall(request);
        Response response = call.execute();
        String bodyString = response.body().string();
        //Logger.xml(bodyString);
        T object = c.newInstance();
        IHtmlToObject IHtmlToObject = object.fromHtml(bodyString);
        Gson gson = new Gson();
        String result = gson.toJson(IHtmlToObject);
        Logger.json(result);
        return result;
    }

    private String netGetNews(String url) throws IOException {
        News news;
        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder().url(url).build();
        Call call = client.newCall(request);
        Response response = call.execute();
        String bodyString = response.body().string();
        //Logger.xml(bodyString);
        news = ToJson.xmlToObject(bodyString);
        Gson gson = new Gson();
        String result = gson.toJson(news);
        //Logger.json(result);
        return result;
    }

}

