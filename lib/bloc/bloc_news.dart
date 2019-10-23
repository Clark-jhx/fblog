import 'dart:async';

import 'package:fblog/bloc_common/BlocBase.dart';

class BlocNews extends BlocBase {
  List<News> news;

  // 通知控件, 给接收通知的widget使用(通知的数据类型为News)
  StreamController<List<News>> _ctrlWidget = StreamController();
  StreamSink<List<News>> get _sink => _ctrlWidget.sink;
  Stream<List<News>> get stream => _ctrlWidget.stream;

  // 接受命令, 由外面使用(命令类型为Action)
  StreamController<Action> _ctrlAction = StreamController();
  StreamSink<Action> get sink => _ctrlAction.sink;
  Stream<Action> get _stream => _ctrlAction.stream;

  BlocNews() {
    _stream.listen(_logic);
  }

  @override
  void dispose() {
    _ctrlWidget.close();
    _ctrlAction.close();
  }

  /// 具体命令逻辑
  void _logic(event) {
    switch (event) {
      case Action.get_hot_news:
        //TODO: 获取热门新闻列表
        break;
      case Action.get_recent_news:
        //TODO: 获取最新新闻列表
        break;
    }
    // 通知UI
    _sink.add(news);
  }
}

class News {}

enum Action { get_hot_news, get_recent_news }
