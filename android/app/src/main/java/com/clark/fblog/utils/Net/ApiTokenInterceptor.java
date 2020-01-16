package com.clark.fblog.utils.Net;

import com.clark.fblog.Constants;
import com.clark.fblog.Urls;
import com.clark.fblog.bean.ApiToken;
import com.google.gson.Gson;
import com.orhanobut.logger.Logger;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;

import okhttp3.FormBody;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

// TODO: 2020/1/16
//   1.处理api token过期 2.使用sp保存token
public class ApiTokenInterceptor implements Interceptor {
    private static final String TAG = ApiTokenInterceptor.class.getSimpleName();
    private static final String apiToken = "api_token";
    private String token = "";

    @NotNull
    @Override
    public Response intercept(@NotNull Chain chain) throws IOException {
        Response response;
        Request originRequest = chain.request();
        // 1. 检查sp是否存在api token
        if (token.length() == 0){
            // 2. 没有api token， 获取新api token，并缓存到本地
            token = getNewApiToken(chain);
        }
        Logger.t(TAG).i("api token：" + token);
        // 3. 存在api token，塞入请求头中
        Request.Builder builder = originRequest.newBuilder();
        Request newRequest = builder.addHeader("Authorization", "Bearer " + token).build();
        response = chain.proceed(newRequest);

        return response;
    }

    public String getNewApiToken(Chain chain){
        Gson gson = new Gson();
        String result = "";
        FormBody formBody = new FormBody.Builder()
                .add("client_id", Constants.clientId)
                .add("client_secret", Constants.clientSecret)
                .add("grant_type", "client_credentials")
                .build();
        Request request = new Request.Builder()
                .url(Urls.getApiToken())
                .method("POST", formBody)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        try {
            Response response = chain.proceed(request);
            String bodyString = response.body().string();
            ApiToken apiToken = gson.fromJson(bodyString, ApiToken.class);
            result = apiToken.getAccess_token();
        } catch (IOException e) {
            Logger.t(TAG).e("", e);
            e.printStackTrace();
        } catch (Exception e){
            Logger.t(TAG).e("", e);
            e.printStackTrace();
        }
        Logger.t(TAG).i("获取到新api token：" + result);
        return result;
    }
}
