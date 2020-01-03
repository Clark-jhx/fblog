import 'dart:async';

import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_news_common.dart';

import '../model/news_model.dart';
import 'bloc_news.dart';

class BlocNewDetail extends BlocNewsCommon {
  NewBody newBody;
  NewComments newComments;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewBody)
  StreamController<NewBody> _newBodyCtrlWidget = StreamController();
  StreamSink<NewBody> get _newBodySink => _newBodyCtrlWidget.sink;
  Stream<NewBody> get newBodyStream => _newBodyCtrlWidget.stream;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为NewComments)
  StreamController<NewComments> _newCommentsCtrlWidget = StreamController();
  StreamSink<NewComments> get _newCommentsSink => _newCommentsCtrlWidget.sink;
  Stream<NewComments> get newCommentsStream => _newCommentsCtrlWidget.stream;

  // 接受命令, 由外面使用(命令类型为Action)
  StreamController<RefreshAction> _ctrlAction = StreamController();
  StreamSink<RefreshAction> get sink => _ctrlAction.sink;
  Stream<RefreshAction> get _stream => _ctrlAction.stream;

  // News model
  NewsModel newsModel;

  BlocNewDetail() {
    newsModel = NewsModel(this);
    _stream.listen(_logic);
  }

  /// 具体命令逻辑
  void _logic(RefreshAction event) {
    switch (event.action) {
      case Action.getNewBody: // 新闻内容
        newsModel.getNewBody(event.newId);
        break;
      case Action.getNewComments: // 新闻评论
        newsModel.getNewComments(event.newId, event.pageIndex, event.pageSize);
        break;
      default:
        break;
    }
  }

  void triggerNewBody(NewBody newBody) {
    print("trigger new body");
    // 通知UI
    this.newBody = newBody;
    _newBodySink.add(newBody);
  }

  void triggerNewComments(NewComments newComments) {
    // 通知UI
    this.newComments = newComments;
    _newCommentsSink.add(newComments);
  }

  @override
  void dispose() {
    _ctrlAction.close();
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
}
