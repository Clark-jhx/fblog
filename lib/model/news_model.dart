import 'package:fblog/bean/News.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:flutter/services.dart';

class NewsModel {
  MethodChannel platform;
  NewsModel() {
    platform = MethodChannel('/news');
  }

  /// 获取热门新闻
  Future<List<News>> getHotNews(int count) async {
    try {
      String result = await platform
          .invokeMethod('getHotNews', <String, int>{'count': count});
      // TODO 转换成json格式
      return List();
    } on PlatformException catch (e) {
      return List();
    }
  }

  /// 获取最新新闻
  Future<List<News>> getRecentNews(int count) async {
    try {
      String result = await platform
          .invokeMethod('getRecentNews', <String, int>{'count': count});
      // TODO 转换成json格式
      return List();
    } on PlatformException catch (e) {
      return List();
    }
  }
}
