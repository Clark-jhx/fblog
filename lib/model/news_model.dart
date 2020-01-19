import 'dart:async';
import 'dart:convert';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';
import 'package:flutter/services.dart';

class NewsModel<T extends BlocNewsCommon> {
  static const String TAG = "NewsModel.dart ";

  static const String CHANNEL_NAME = '/news';

  static const String GET_HOT_NEWS = "getHotNews";
  static const String GET_RECENT_NEWS = "getRecentNews";
  static const String GET_RECOMMEND_NEWS = "getRecommendNews";

  static const String TRIGGER_HOT_NEWS = "triggerHotNews";
  static const String TRIGGER_RECENT_NEWS = "triggerRecentNews";
  static const String TRIGGER_RECOMMEND_NEWS = "triggerRecommendNews";

  static const String KEY_START_DATE = "startDate";
  static const String KEY_END_DATE = "endDate";
  static const String KEY_PAGE_INDEX = "pageIndex";
  static const String KEY_PAGE_SIZE = "pageSize";

  MethodChannel platform;
  T _bloc;

  // 内存中缓存 新闻数据
  List<New> hotNews = List();
  List<New> recentNews = List();
  List<New> recommandNews = List();
  NewBody newBody;
  NewComments newComments;

  NewsModel(this._bloc) {
    platform = MethodChannel('/news');
    platform.setMethodCallHandler((methodCall) {
      switch (methodCall.method) {
        case TRIGGER_HOT_NEWS:
          print(TAG + "trigger hot");
          print(TAG + methodCall.arguments);
          dynamic jsonResult = json.decode(methodCall.arguments);
          News news = News.fromJson(jsonResult);
          hotNews.addAll(news.entrys);
          _bloc.triggerHotNews(hotNews);
          break;
        case TRIGGER_RECENT_NEWS:
          print(TAG + "trigger recent");
          print(TAG + methodCall.arguments);
          dynamic jsonResult = json.decode(methodCall.arguments);
          News news = News.fromJson(jsonResult);
          recentNews.addAll(news.entrys);
          _bloc.triggerRecentNews(recentNews);
          break;
        case TRIGGER_RECOMMEND_NEWS:
          print(TAG + "trigger recommend");
          print(TAG + methodCall.arguments);
          dynamic jsonResult = json.decode(methodCall.arguments);
          News news = News.fromJson(jsonResult);
          recommandNews.addAll(news.entrys);
          _bloc.triggerRecommandNews(recommandNews);
          break;
      }
      return null;
    });
  }

  /// 获取热门新闻
  Future getHotNews(
      int pageIndex, int pageSize, String startDate, String endDate) async {
    try {
      await platform.invokeMethod(GET_HOT_NEWS, <String, dynamic>{
        KEY_PAGE_INDEX: pageIndex,
        KEY_PAGE_SIZE: pageSize,
        KEY_START_DATE: startDate,
        KEY_END_DATE: endDate
      });
    } on PlatformException catch (e) {
      return null;
    }
  }

  /// 获取最新新闻
  Future getRecentNews(int pageIndex, int pageSize) async {
    try {
      await platform.invokeMethod(GET_RECENT_NEWS,
          <String, int>{KEY_PAGE_INDEX: pageIndex, KEY_PAGE_SIZE: pageSize});
    } on PlatformException catch (e) {
      return null;
    }
  }

  // 获取推荐新闻
  Future getRecommendNews(int pageIndex, int pageSize) async {
    try {
      await platform.invokeMethod(GET_RECOMMEND_NEWS,
          <String, int>{KEY_PAGE_INDEX: pageIndex, KEY_PAGE_SIZE: pageSize});
    } on PlatformException catch (e) {
      return null;
    }
  }
}
