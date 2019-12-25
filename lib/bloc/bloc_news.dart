import 'dart:async';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';

import '../model/news_model.dart';

class BlocNews extends BlocNewsCommon {
  List<New> hotNews = List();
  List<New> recentNews = List();
  List<New> recommandNews = List();
  NewBody newBody;
  NewComments newComments;

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

  // 接受命令, 由外面使用(命令类型为Action)
  StreamController<RefreshAction> _ctrlAction = StreamController();
  StreamSink<RefreshAction> get sink => _ctrlAction.sink;
  Stream<RefreshAction> get _stream => _ctrlAction.stream;

  // News model
  NewsModel newsModel;

  BlocNews() {
    newsModel = NewsModel(this);
    _stream.listen(_logic);
  }

  @override
  void dispose() {
    _hotCrlWidget.close();
    _recentCtrlWidget.close();
    _recommendCtrlWidget.close();
    _ctrlAction.close();
  }

  /// 具体命令逻辑
  void _logic(RefreshAction event) {
    switch (event.action) {
      case Action.getHotNews: // 热门新闻
        if (!event.loadMore) {
          hotNews.clear();
        }
        newsModel.getHotNews(event.pageSize);
        break;
      case Action.getRecentNews: // 最新新闻
        if (!event.loadMore) {
          recentNews.clear();
        }
        newsModel.getRecentNews(event.pageIndex, event.pageSize);
        break;
      case Action.getRecommendNews: // 推荐新闻
        if (!event.loadMore) {
          recommandNews.clear();
        }
        newsModel.getRecommendNews(event.pageIndex, event.pageSize);
        break;
      default:
        break;
    }
  }

  void triggerHotNews(List<New> news) {
    // 通知UI
    hotNews = news;
    _hotNewsSink.add(news);
  }

  void triggerRecentNews(List<New> news) {
    // 通知UI
    recentNews.addAll(news);
    _recentNewsSink.add(recentNews);
  }

  void triggerRecommandNews(List<New> news) {
    // 通知UI
    recommandNews.addAll(news);
    _recommendNewsSink.add(recommandNews);
  }

  void triggerNewBody(NewBody newBody) {
    // ignore
  }

  void triggerNewComments(NewComments newComments) {
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
  int newId = 651511;
}
