import 'dart:async';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';
import 'package:fblog/model/news_detail_model.dart';
import 'package:fblog/pages/common_news.dart';

class BlocNewDetail extends BlocNewsCommon {
  static const String TAG = "bloc_new_detail.dart ";

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewBody)
  StreamController<NewBody> _newBodyCtrlWidget = StreamController();
  StreamSink<NewBody> get _newBodySink => _newBodyCtrlWidget.sink;
  Stream<NewBody> get newBodyStream => _newBodyCtrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewComments)
  StreamController<NewComments> _newCommentsCtrlWidget = StreamController();
  StreamSink<NewComments> get _newCommentsSink => _newCommentsCtrlWidget.sink;
  Stream<NewComments> get newCommentsStream => _newCommentsCtrlWidget.stream;

  // News model
  NewsDetailModel newsModel;

  BlocNewDetail() {
    print(TAG + "BlocNewDetail()");
    newsModel = NewsDetailModel<BlocNewDetail>(this);
  }

  void triggerNewBody(NewBody newBody) {
    print(TAG + "trigger new body");
    // 通知UI
    _newBodySink.add(newBody);
  }

  void triggerNewComments(NewComments newComments) {
    // 通知UI
    _newCommentsSink.add(newComments);
  }

  @override
  void dispose() {
    print(TAG + "BlocNewDetail.dispose");
    _newBodyCtrlWidget.close();
    _newCommentsCtrlWidget.close();
  }

  @override
  void triggerHotNews(List<New> news) {
    // ignore
  }

  @override
  void triggerRecentNews(List<New> news) {
    // ignore
  }

  @override
  void triggerRecommandNews(List<New> news) {
    // ignore
  }

  @override
  void getNewBody(int newId) {
    newsModel.getNewBody(newId);
  }

  @override
  void getNewComments(int newId, int pageIndex, int pageSize) {
    newsModel.getNewComments(newId, pageIndex, pageSize);
  }

  @override
  void getHotNews(int pageIndex, int pageSize, String startDate, String endDate,
      OnSuccessCallback onSuccessCallback, OnErrorCallback onErrorCallback) {
    // ignore
  }

  @override
  void getRecentNews(int pageIndex, int pageSize,
      OnSuccessCallback onSuccessCallback, OnErrorCallback onErrorCallback) {
    // ignore
  }

  @override
  void getRecommandNews(int pageIndex, int pageSize,
      OnSuccessCallback onSuccessCallback, OnErrorCallback onErrorCallback) {
    // ignore
  }
}
