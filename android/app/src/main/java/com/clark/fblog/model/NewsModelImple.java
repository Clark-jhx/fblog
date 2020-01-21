package com.clark.fblog.model;

import com.clark.fblog.Urls;
import com.clark.fblog.mvp.IPresenter;
import com.clark.fblog.utils.Net.OkhttpManager;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import io.reactivex.Flowable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import okhttp3.Response;

public class NewsModelImple implements NewsIModel {

    private static final String TAG = NewsModelImple.class.getSimpleName();

    private static final int NET_TIMEOUT = 50000;

    @Override
    public void getHotNews(int pageIndex, int pageSize, String startDate, String endDate,
        IPresenter.ResultCallback resultCallback) {
        //startDate_ = "2018-01-16T16:01:34.62";
        //endDate_ = "2018-10-26T15:33:50.587";
        String url = Urls.getHot(pageIndex, pageSize, startDate, endDate);
        commonGetNews(url, () -> {
            Response response = OkhttpManager.getInstance().snycGet(url, null);
            if (response == null) {
                return "";
            } else {
                try {
                    return "{\"News\":" + response.body().string() + "}";
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }, resultCallback);
    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize,
        IPresenter.ResultCallback resultCallback) {
        String url = Urls.getRecent(pageIndex, pageSize);
        commonGetNews(url, () -> {
            Response response = OkhttpManager.getInstance().snycGet(url, null);
            if (response == null) {
                return "";
            } else {
                try {
                    return "{\"News\":" + response.body().string() + "}";
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }, resultCallback);
    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize,
        IPresenter.ResultCallback resultCallback) {
        String url = Urls.getRecommend(pageIndex, pageSize);
        commonGetNews(url, () -> {
            Response response = OkhttpManager.getInstance().snycGet(url, null);
            if (response == null) {
                return "";
            } else {
                try {
                    return "{\"News\":" + response.body().string() + "}";
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }, resultCallback);
    }

    @Override
    public void getNewBody(int newId, IPresenter.ResultCallback resultCallback) {
        String url = Urls.getNewBody(newId);
        commonGetNews(url, () -> {
            Response response = OkhttpManager.getInstance().snycGet(url, null);
            if (response == null) {
                return "";
            } else {
                try {
                    String bodyString = response.body().string();
                    bodyString = bodyString.replace("\\r\\n", " ")
                        .replace("img src=\\\"", "img src=")
                        .replace(".png\\\"", ".png")
                        .replace(".jpg\\\"", ".jpg")
                        .replace(".bmp\\\"", ".bmp")
                        .replace(".jpeg\\\"", ".jpeg")
                        .replace(".gif\\\"", ".gif");
                    char temp = '"';
                    bodyString = trimFirstAndLastChar(bodyString, temp);
                    return bodyString;
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }, resultCallback);
    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize,
        IPresenter.ResultCallback resultCallback) {
        String url = Urls.getNewComments(newId, pageIndex, pageSize);
        commonGetNews(url, () -> {
            Response response = OkhttpManager.getInstance().snycGet(url, null);
            if (response == null) {
                return "";
            } else {
                try {
                    return "{\"NewComments\":" + response.body().string() + "}";
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }, resultCallback);
    }

    private <T> void commonGetNews(String url, NetGet netGet,
        IPresenter.ResultCallback resultCallback) {

        Flowable.just(url)
            .subscribeOn(Schedulers.io())
            .map(new Function<String, String>() {
                @Override
                public String apply(String url) throws Exception {
                    // 联网获取数据
                    return netGet.netGet();
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
                    //Logger.e(throwable.getMessage());
                    resultCallback.result("");
                }
            });
    }

    @FunctionalInterface
    interface NetGet {

        /**
         * 网络获取数据
         */
        String netGet();
    }

    /**
     * 去掉字符串头尾指定字符
     *
     * @param source 需要处理的字符串
     * @param element 指定字符
     */
    public static String trimFirstAndLastChar(String source, char element) {
        //判断指定字符是否出现在该字符串的第一位  是--返回下标1   否--返回下标0
        int beginIndex = source.indexOf(element) == 0 ? 1 : 0;
        //判断指定字符是否出现在该字符串的最后一位  是--返回出现的位置   否--返回字符长度
        int endIndex =
            source.lastIndexOf(element) + 1 == source.length() ? source.lastIndexOf(element)
                : source.length();
        //开始截取字符串
        source = source.substring(beginIndex, endIndex);
        return source;
    }
}
