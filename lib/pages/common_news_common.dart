import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/bloc/bloc_news.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:fblog/widgets/item_news.dart';

class CommonNewsContent extends StatefulWidget {
  Category category;

  CommonNewsContent(this.category);

  @override
  State<StatefulWidget> createState() {
    return CommonNewsContentState();
  }
}

class CommonNewsContentState extends State<CommonNewsContent> with AutomaticKeepAliveClientMixin{
  BlocNews blocNews;
  // 该页的新闻列表
  List<New> news = List();
  int _count = 10;
  int pageIndex = 1;
  int pageSize = 10;

  @override
  void initState() {
    print(widget.category.toString() + ' CommonNewsContent initState()');
    // 必须在新闻页中使用
    blocNews = BlocProvider.of<BlocNews>(context);
    super.initState();
  }

  @override
  void dispose() {
    print(widget.category.toString() + ' CommonNewsContent dispose()');
    blocNews.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: StreamBuilder<List<New>>(
          stream: getStream(),
          initialData: List(),
          builder: (BuildContext context, AsyncSnapshot<List<New>> snapshot) {
            List<New> news = snapshot.data;
            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemBuilder(context, index, news);
                });
          },
        ),
      ),
    );
  }

  ///生成ListView的每个item布局
  Widget _itemBuilder(BuildContext context, int index, List<New> news) {
    return ItemNews(news[index]);
  }

  Stream getStream(){
    switch (widget.category) {
      case Category.Hot:
        return blocNews.hotNewsStream;
      case Category.Recent:
        return blocNews.recentNewsStream;
      case Category.Recommend:
        return blocNews.recommengNewsStream;
      default:
        return blocNews.hotNewsStream;
    }
  }

  // ignore: missing_return
  Future<void> _onRefresh() async {
    switch (widget.category) {
      case Category.Hot:
        blocNews.sink.add(prefix0.Action.getHotNews);
        break;
      case Category.Recent:
        blocNews.sink.add(prefix0.Action.getRecentNews);
        break;
      case Category.Recommend:
        blocNews.sink.add(prefix0.Action.getRecommendNews);
        break;
    }
  }

  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;
}

enum Category {
  Hot,
  Recent,
  Recommend,
}
