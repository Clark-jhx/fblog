import 'dart:async';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';

import 'bloc_common/BlocBase.dart';
import '../model/news_model.dart';

class BlocNews extends BlocBase {
  List<New> hotNews = List();
  List<New> recentNews = List();
  List<New> recommandNews = List();
  NewBody newBody;
  NewComments newComments;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为List<New>)
  StreamController<List<New>> _ctrlWidget = StreamController();
  StreamSink<List<New>> get _newsSink => _ctrlWidget.sink;
  Stream<List<New>> get newsStream => _ctrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewBody)
  StreamController<NewBody> _newBodyCtrlWidget = StreamController();
  StreamSink<NewBody> get _newBodySink => _newBodyCtrlWidget.sink;
  Stream<NewBody> get newBodyStream => _newBodyCtrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewComments)
  StreamController<NewComments> _newCommentsCtrlWidget = StreamController();
  StreamSink<NewComments> get _newCommentsSink => _newCommentsCtrlWidget.sink;
  Stream<NewComments> get newCommentsStream => _newCommentsCtrlWidget.stream;

  // 接受命令, 由外面使用(命令类型为Action)
  StreamController<Action> _ctrlAction = StreamController();
  StreamSink<Action> get sink => _ctrlAction.sink;
  Stream<Action> get _stream => _ctrlAction.stream;

  // News model
  NewsModel newsModel;
  int _count = 2;
  int pageIndex = 1;
  int pageSize = 2;
  int newId = 651511;

  BlocNews() {
    newsModel = NewsModel(this);
    _stream.listen(_logic);
  }

  @override
  void dispose() {
    _ctrlWidget.close();
    _ctrlAction.close();
    _newBodyCtrlWidget.close();
    _newCommentsCtrlWidget.close();
  }

  /// 具体命令逻辑
  void _logic(event) {
    switch (event) {
      case Action.getHotNews: // 热门新闻
        newsModel.getHotNews(_count);
        break;
      case Action.getRecentNews: // 最新新闻
        newsModel.getRecentNews(pageIndex, pageSize);
        break;
      case Action.getRecommendNews: // 推荐新闻
        newsModel.getRecommendNews(pageIndex, pageSize);
        break;
      case Action.getNewBody: // 新闻内容
        newsModel.getNewBody(newId);
        break;
      case Action.getNewComments: // 新闻评论
        newsModel.getNewComments(newId, pageIndex, pageSize);
    }
  }

  void triggerHotNews(List<New> news) {
    // 通知UI
    hotNews = news;
    _newsSink.add(hotNews);
  }

  void triggerRecentNews(List<New> news) {
    // 通知UI
    recentNews.addAll(news);
    _newsSink.add(recentNews);
  }

  void triggerRecommandNews(List<New> news) {
    // 通知UI
    recommandNews = news;
    _newsSink.add(recommandNews);
  }

  void triggerNewBody(NewBody newBody) {
    // 通知UI
    this.newBody = newBody;
    _newBodySink.add(newBody);
  }

  void triggerNewComments(NewComments newComments) {
    // 通知UI
    this.newComments = newComments;
    _newCommentsSink.add(newComments);
  }
}

enum Action {
  getHotNews,
  getRecentNews,
  getRecommendNews,
  getNewBody,
  getNewComments
}
