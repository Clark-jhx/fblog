import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/bloc_common/BlocProvider.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocNews>(child: NewsPageMain(), bloc: BlocNews());
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
  }

  @override
  void dispose() {
    super.dispose();
    print('NewsState dispose()');
    blocNews = BlocProvider.of<BlocNews>(context);
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
        child: Container(
          alignment: Alignment.center,
          child: ListView.builder(itemCount: 3, itemBuilder: _itemBuilder),
        ),
      ),
    );
  }

  ///生成ListView的每个item布局
  Widget _itemBuilder(BuildContext context, int index) {
    return Text('index');
  }
}
