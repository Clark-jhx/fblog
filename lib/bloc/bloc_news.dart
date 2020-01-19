import 'dart:async';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';

import '../model/news_model.dart';

class BlocNews extends BlocNewsCommon {
  static const String TAG = "bloc_news.dart ";

  // 通知控件, 给接收通知的widget使用(通知的数据类型为List<New>)
  StreamController<List<New>> _hotCrlWidget = StreamController();
  StreamSink<List<New>> get _hotNewsSink => _hotCrlWidget.sink;
  Stream<List<New>> get hotNewsStream => _hotCrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为List<New>)
  StreamController<List<New>> _recentCtrlWidget = StreamController();
  StreamSink<List<New>> get _recentNewsSink => _recentCtrlWidget.sink;
  Stream<List<New>> get recentNewsStream => _recentCtrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为List<New>)
  StreamController<List<New>> _recommendCtrlWidget = StreamController();
  StreamSink<List<New>> get _recommendNewsSink => _recommendCtrlWidget.sink;
  Stream<List<New>> get recommengNewsStream => _recommendCtrlWidget.stream;

  // News model
  NewsModel newsModel;

  BlocNews() {
    print(TAG + "BlocNews()");
    newsModel = NewsModel(this);
  }

  @override
  void dispose() {
    print(TAG + "BlocNews.dispose");
    _hotCrlWidget.close();
    _recentCtrlWidget.close();
    _recommendCtrlWidget.close();
  }

  void triggerHotNews(List<New> news) {
    if (_hotCrlWidget.isClosed) {
      print(TAG + "error: trigger Hot, but stream has been closed");
      return;
    }
    print(TAG + "trigger Hot");
    // 通知UI
    _hotNewsSink.add(news);
  }

  void triggerRecentNews(List<New> news) {
    if (_recentCtrlWidget.isClosed) {
      print(TAG + "error: trigger Recent, but stream has been closed");
      return;
    }
    print(TAG + "trigger Recent");
    // 通知UI
    _recentNewsSink.add(news);
  }

  void triggerRecommandNews(List<New> news) {
    if (_recommendCtrlWidget.isClosed) {
      print(TAG + "error: trigger Recommand, but stream has been closed");
      return;
    }
    print(TAG + "trigger Recommand");
    // 通知UI
    _recommendNewsSink.add(news);
  }

  void triggerNewBody(NewBody newBody) {
    // ignore
  }

  void triggerNewComments(NewComments newComments) {
    // ignore
  }

  @override
  void getHotNews(
      int pageIndex, int pageSize, String startDate, String endDate) {
    newsModel.getHotNews(pageIndex, pageSize, startDate, endDate);
  }

  @override
  void getRecentNews(int pageIndex, int pageSize) {
    newsModel.getRecentNews(pageIndex, pageSize);
  }

  @override
  void getRecommandNews(int pageIndex, int pageSize) {
    newsModel.getRecommendNews(pageIndex, pageSize);
  }

  @override
  void getNewBody(int newId) {
    // ignore
  }

  @override
  void getNewComments(int newId, int pageIndex, int pageSize) {
    // ignore
  }
}

enum Action {
  getHotNews,
  getRecentNews,
  getRecommendNews,
  getNewBody,
  getNewComments
}

class RefreshAction {
  Action action;
  // 标记是下拉还是上拉刷新
  bool loadMore;
  int pageIndex = 1;
  int pageSize = 10;
  String startDate = '2018-01-16T16:01:34.62';
  String endDate = '2018-10-26T15:33:50.587';
  int newId = 651511;
}
