import 'dart:async';
import 'dart:convert';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';
import 'package:flutter/services.dart';

class NewsModel<T extends BlocNewsCommon> {
  static const String GET_HOT_NEWS = "getHotNews";
  static const String GET_RECENT_NEWS = "getRecentNews";
  static const String GET_RECOMMEND_NEWS = "getRecommendNews";
  static const String GET_NEW_BODY = "getNewBody";
  static const String GET_NEW_COMMENTS = "getNewComments";

  static const String TRIGGER_HOT_NEWS = "triggerHotNews";
  static const String TRIGGER_RECENT_NEWS = "triggerRecentNews";
  static const String TRIGGER_RECOMMEND_NEWS = "triggerRecommendNews";
  static const String TRIGGER_NEW_BODY = "triggerNewBody";
  static const String TRIGGER_NEW_COMMENTS = "triggerNewComments";

  static const String KEY_COUNT = "count";
  static const String KEY_PAGE_INDEX = "pageIndex";
  static const String KEY_PAGE_SIZE = "pageSize";
  static const String KEY_NEW_ID = "newId";

  MethodChannel platform;
  T _bloc;

  NewsModel(this._bloc) {
    platform = MethodChannel('/news');
    platform.setMethodCallHandler((methodCall) {
      // ignore: missing_return
      switch (methodCall.method) {
        case TRIGGER_HOT_NEWS:
          print(methodCall.arguments);
          var jsonResult = json.decode(methodCall.arguments);
          var news = News.fromJson(jsonResult);
          _bloc.triggerHotNews(news.entrys);
          break;
        case TRIGGER_RECENT_NEWS:
          print(methodCall.arguments);
          var jsonResult = json.decode(methodCall.arguments);
          var news = News.fromJson(jsonResult);
          _bloc.triggerRecentNews(news.entrys);
          break;
        case TRIGGER_RECOMMEND_NEWS:
          print(methodCall.arguments);
          var jsonResult = json.decode(methodCall.arguments);
          var news = News.fromJson(jsonResult);
          _bloc.triggerRecommandNews(news.entrys);
          break;
        case TRIGGER_NEW_BODY:
          print(methodCall.arguments);
          var jsonResult = json.decode(methodCall.arguments);
          var newBody = NewBody.fromJson(jsonResult);
          _bloc.triggerNewBody(newBody);
          break;
        case TRIGGER_NEW_COMMENTS:
          print(methodCall.arguments);
          var jsonResult = json.decode(methodCall.arguments);
          var newComments = NewComments.fromJson(jsonResult);
          _bloc.triggerNewComments(newComments);
      }
    });
  }

  /// 获取热门新闻
  Future getHotNews(int count) async {
    try {
      await platform
          .invokeMethod(GET_HOT_NEWS, <String, int>{KEY_COUNT: count});
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

  // 获取新闻内容
  Future getNewBody(int newId) async {
    try {
      await platform
          .invokeMethod(GET_NEW_BODY, <String, int>{KEY_NEW_ID: newId});
    } on PlatformException catch (e) {
      return null;
    }
  }

  // 获取新闻评论
  Future getNewComments(int newId, int pageIndex, int pageSize) async {
    try {
      await platform.invokeMethod(GET_NEW_COMMENTS, <String, int>{
        KEY_PAGE_INDEX: pageIndex,
        KEY_PAGE_SIZE: pageSize,
        KEY_NEW_ID: newId
      });
    } on PlatformException catch (e) {
      return null;
    }
  }
}
