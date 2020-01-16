package com.clark.fblog.model;

import android.app.Activity;

import com.clark.fblog.mvp.IPresenter;
import com.clark.fblog.mvp.IView;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class TestNewsModelImple implements NewsIModel{
    Activity activity;
    Gson gson = new Gson();

    public TestNewsModelImple(IView view) {
        activity = (Activity)view;
    }

    @Override
    public void getHotNews(int pageIndex, int pageSize, String startDate, String endDate, IPresenter.ResultCallback resultCallback) {
        String newsString = readFromAssets("news.json");
        resultCallback.result(newsString);
    }

    @Override
    public void getRecentNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        String newsString = readFromAssets("news.json");
        resultCallback.result(newsString);
    }

    @Override
    public void getRecommendNews(int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        String newsString = readFromAssets("news.json");
        resultCallback.result(newsString);
    }

    @Override
    public void getNewBody(int newId, IPresenter.ResultCallback resultCallback) {
        String newBodyString = readFromAssets("new_body.txt");
        resultCallback.result(newBodyString);
    }

    @Override
    public void getNewComments(int newId, int pageIndex, int pageSize, IPresenter.ResultCallback resultCallback) {
        String newCommentsString = readFromAssets("new_comments.json");
        resultCallback.result(newCommentsString);
    }

    /**
     * 从assets中读取txt
     */
    private String readFromAssets(String fileName) {
        String result;
        try {
            InputStream is = activity.getAssets().open(fileName);
            String text = readTextFromSDcard(is);
            result = text;
        } catch (Exception e) {
            result = "";
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 按行读取txt
     *解析输入流，返回txt中的字符串
     * @param is
     * @return
     * @throws Exception
     */
    private String readTextFromSDcard(InputStream is) throws Exception {
        InputStreamReader reader = new InputStreamReader(is);
        BufferedReader bufferedReader = new BufferedReader(reader);
        StringBuffer buffer = new StringBuffer("");
        String str;
        while ((str = bufferedReader.readLine()) != null) {
            buffer.append(str);
            buffer.append("\n");
        }
        return buffer.toString();
    }
}
