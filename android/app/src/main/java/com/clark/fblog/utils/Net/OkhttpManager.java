package com.clark.fblog.utils.Net;

import androidx.annotation.RequiresApi;

import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;
import okhttp3.Headers;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class OkhttpManager {

    private static OkHttpClient okHttpClient = new OkHttpClient().newBuilder()
            .callTimeout(10000, TimeUnit.MILLISECONDS)
            .connectTimeout(15000, TimeUnit.MILLISECONDS)
            .addInterceptor(new ApiTokenInterceptor())
            .addInterceptor(new LogInterceptor())
            .build();

    public static OkhttpManager getInstance(){
        return Singleton.okhttpManager;
    }

    private static class Singleton{
        private static final OkhttpManager  okhttpManager = new OkhttpManager();
    }

    //@RequiresApi(api = Build.VERSION_CODES.N)
    public Response snycGet(String url, Map<String, String> params) {
        Headers.Builder builder = new Headers.Builder();

        if (params != null && params.size() > 0){
            //        params.forEach((key, value)->{
//            builder.add(key, value);
//        });
            Set<Map.Entry<String, String>> entries = params.entrySet();
            for (Map.Entry<String, String> entry : entries){
                builder.add(entry.getKey(), entry.getValue());
            }
        }

        Request request = new Request.Builder()
                .method("GET", null)
                .url(url)
                .headers(builder.build())
                .build();
        Call call = okHttpClient.newCall(request);
        try {
            return call.execute();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
