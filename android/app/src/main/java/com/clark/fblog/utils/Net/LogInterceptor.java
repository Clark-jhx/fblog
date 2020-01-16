package com.clark.fblog.utils.Net;

import com.orhanobut.logger.Logger;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;

import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public class LogInterceptor implements Interceptor {
    private static final String TAG = LogInterceptor.class.getSimpleName();

    /**
     * 打印请求/响应信息
     * @param chain
     * @return
     * @throws IOException
     */
    @NotNull
    @Override
    public Response intercept(@NotNull Chain chain) throws IOException {
        Request request = chain.request();
        Logger.t(TAG).i("method: %s%n地址: %s%n请求头:%s", request.method(), request.url(), request.headers());

        Response response = chain.proceed(request);
        //这里不能直接使用response.body().string()的方式输出日志
        //因为response.body().string()之后，response中的流会被关闭，程序会报错，我们需要创建出一个新的response给应用层处理
        ResponseBody responseBody = response.peekBody(1024);
        String bodyString = responseBody.string();
        Logger.t(TAG).i("响应码: %d%n响应头：%s%n响应体：%s", response.code(), response.headers(), bodyString);
        return response;
    }
}
