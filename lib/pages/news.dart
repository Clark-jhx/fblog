import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/bloc/bloc_news.dart' as prefix0;
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider<BlocNews>(child: NewsPageMain(), bloc: BlocNews()),
    );
  }
}

class NewsPageMain extends StatefulWidget {
  @override
  NewsState createState() {
    print('NewsPage createState()');
    return NewsState();
  }
}

class NewsState extends State<NewsPageMain> {
  // bloc
  BlocNews blocNews;

  @override
  void initState() {
    super.initState();
    print('NewsState initState()');
    blocNews = BlocProvider.of<BlocNews>(context);
  }

  @override
  void dispose() {
    super.dispose();
    print('NewsState dispose()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: StreamBuilder<List<News>>(
            stream: blocNews.stream,
            initialData: List(),
            builder:
                (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
              List<News> news = snapshot.data;
              return ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemBuilder(context, index, news);
                  });
            },
          ),
        ),
      ),
    );
  }

  ///生成ListView的每个item布局
  Widget _itemBuilder(BuildContext context, int index, List<News> news) {
    return Text('${news[index].title}');
  }

  // ignore: missing_return
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      blocNews.sink.add(prefix0.Action.get_hot_news);
    });
  }
}
