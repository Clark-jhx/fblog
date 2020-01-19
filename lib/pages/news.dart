import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/pages/common_news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: BlocProvider<BlocNews>(child: NewsPageMain(), bloc: BlocNews()),
    );
  }
}

class NewsPageMain extends StatefulWidget {
  static const String TAG = "news.dart ";
  @override
  NewsState createState() {
    print(TAG + 'NewsPage createState()');
    return NewsState();
  }
}

class NewsState extends State<NewsPageMain> {
  static const String TAG = "news.dart ";
  @override
  void initState() {
    super.initState();
    print(TAG + 'NewsState initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print(TAG + 'NewsState dispose()');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
//        appBar: AppBar(
//          leading: Icon(Icons.menu),
//          actions: <Widget>[Icon(Icons.search)],
//          title: Text('新闻'),
//          elevation: 0,
//          bottom: TabBar(
//            indicatorSize: TabBarIndicatorSize.label,
//            indicatorWeight: 1.0,
//            tabs: <Widget>[
//              new Tab(text: '热门'),
//              new Tab(text: '最新'),
//              new Tab(text: '推荐'),
//            ],
//          ),
//        ),
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                new Tab(text: '热门'),
                new Tab(text: '最新'),
                new Tab(text: '推荐'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CommonNewsContent(Category.Hot),
            CommonNewsContent(Category.Recent),
            CommonNewsContent(Category.Recommend),
          ],
        ),
      ),
    );
  }
}
