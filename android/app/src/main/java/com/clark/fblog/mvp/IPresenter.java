package com.clark.fblog.mvp;

public interface IPresenter {


    interface ResultCallback{
        /**
         * 回调网络请求结果
         * @param result 以json字符串的形式
         */
        public void result(String result);
    }
}
