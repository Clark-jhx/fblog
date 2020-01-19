import 'dart:async';
import 'dart:convert';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bloc/bloc_news_common.dart';
import 'package:flutter/services.dart';

class NewsDetailModel<T extends BlocNewsCommon> {
  static const String TAG = "NewsModel.dart ";

  static const String CHANNEL_NAME = '/news_detail';

  static const String GET_NEW_BODY = "getNewBody";
  static const String GET_NEW_COMMENTS = "getNewComments";

  static const String TRIGGER_NEW_BODY = "triggerNewBody";
  static const String TRIGGER_NEW_COMMENTS = "triggerNewComments";

  static const String KEY_PAGE_INDEX = "pageIndex";
  static const String KEY_PAGE_SIZE = "pageSize";
  static const String KEY_NEW_ID = "newId";

  MethodChannel platform;
  T _bloc;

  // 内存中缓存 新闻数据
  NewBody newBody;
  NewComments newComments;

  NewsDetailModel(this._bloc) {
    platform = MethodChannel(CHANNEL_NAME);
    platform.setMethodCallHandler((methodCall) {
      switch (methodCall.method) {
        case TRIGGER_NEW_BODY:
          print(TAG + "trigger new body");
          print(TAG + methodCall.arguments);
          //var jsonResult = json.decode(methodCall.arguments);
          // var newBody = NewBody.fromJson(jsonResult);
          NewBody tempNewBody = NewBody(
              null, null, null, methodCall.arguments, null, null, null, null);
          newBody = tempNewBody;
          _bloc.triggerNewBody(newBody);
          break;
        case TRIGGER_NEW_COMMENTS:
          print(TAG + "trigger new comments");
          print(TAG + methodCall.arguments);
          dynamic jsonResult = json.decode(methodCall.arguments);
          NewComments tempNewComments = NewComments.fromJson(jsonResult);
          newComments = tempNewComments;
          _bloc.triggerNewComments(newComments);
      }
      return null;
    });
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
