package com.clark.fblog;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {

  private static final String NEWS_CHANNEL = "/news";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), NEWS_CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                if("getHotNews".equals(call.method)){
                  int count = call.argument("count");
                    // TODO: 2019/10/24 获取热门新闻
                  result.success("xx");
                }
                if("getRecentNews".equals(call.method)){
                  int count = call.argument("count");
                    // TODO: 2019/10/24 获取最新新闻
                  result.success("xx");
                }
              }
            });

  }
}
