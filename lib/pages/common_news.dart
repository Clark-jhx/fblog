import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/widgets/item_news.dart';
import 'package:flutter/material.dart';

class CommonNewsContent extends StatefulWidget {
  Category category;

  CommonNewsContent(this.category);

  @override
  State<StatefulWidget> createState() {
    return CommonNewsContentState();
  }
}

class CommonNewsContentState extends State<CommonNewsContent>
    with AutomaticKeepAliveClientMixin {
  static const String TAG = "common_news.dart ";
  static const int PAGESIZE = 10;
  bool flag = false;

  int pageIndex = 1;
  int pageSize = PAGESIZE;
  String startDate = '2018-01-16T16:01:34.62';
  String endDate = '2018-10-26T15:33:50.587';

  BlocNews blocNews;

  ScrollController _scrollController;

  @override
  void initState() {
    print(TAG + widget.category.toString() + ' CommonNewsContent initState()');
    _init();
    super.initState();
  }

  void _init() {
    // 必须在新闻页中使用
    blocNews = BlocProvider.of<BlocNews>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_listlistener);
  }

  @override
  void dispose() {
    print(TAG + widget.category.toString() + ' CommonNewsContent dispose()');
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
            print(TAG + "列表有更新 列表大小：" + news.length.toString());
            return ListView.builder(
                itemCount: news.length + 1,
                controller: _scrollController,
                physics:
                    AlwaysScrollableScrollPhysics(), // 解决item数量太少，无法下拉刷新的问题
                itemBuilder: (BuildContext context, int index) {
                  if (index == news.length && news.length != 0 && index > 6) {
                    return _loadMore();
                  } else if (news.length == 0) {
                    return _firstLoad();
                  } else {
                    return _itemBuilder(context, index, news);
                  }
                });
          },
        ),
      ),
    );
  }

  ///生成ListView的每个item布局
  Widget _itemBuilder(BuildContext context, int index, List<New> news) {
    GestureDetector gestureDetector = GestureDetector(
      child: ItemNews(news[index]),
      onTap: () => _itemClick(news[index].id.toString()),
    );
    return gestureDetector;
  }

  /// item点击
  _itemClick(String newId) {
    print(TAG + '新闻id : ' + newId);
    Navigator.pushNamed(context, '/details', arguments: {'newId': newId});
  }

  Stream getStream() {
    Stream stream;
    switch (widget.category) {
      case Category.Hot:
        stream = blocNews.hotNewsStream;
        break;
      case Category.Recent:
        stream = blocNews.recentNewsStream;
        break;
      case Category.Recommend:
        stream = blocNews.recommengNewsStream;
        break;
    }
    return stream;
  }

  // ignore: missing_return
  Future<void> _onRefresh() async {
    if (flag) {
      return;
    }
    flag = true;
    print(TAG + '下拉刷新');
    Future.delayed(Duration(milliseconds: 3000), () {
      flag = false;
    });
    _getNews(1, PAGESIZE, startDate, endDate);
  }

  // list 滑动监听
  void _listlistener() {
    // 滑到最底部
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getMore();
    }
  }

  void _getMore() {
    print(TAG + '上拉加载');
    pageIndex++;
    _getNews(pageIndex, PAGESIZE, startDate, endDate);
  }

  void _getNews(int pageIndex, int pageSize, String startDate, String endDate) {
    switch (widget.category) {
      case Category.Hot:
        blocNews.getHotNews(pageIndex, pageSize, startDate, endDate);
        break;
      case Category.Recent:
        blocNews.getRecentNews(pageIndex, pageSize);
        break;
      case Category.Recommend:
        blocNews.getRecommandNews(pageIndex, pageSize);
        break;
    }
  }

  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;

  // 加载更多
  Widget _loadMore() {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text('加载更多...'),
    );
  }

  // 第一次进入，触发刷新
  Widget _firstLoad() {
    Future.delayed(Duration(milliseconds: 1500), () {
      _onRefresh();
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
          value: null,
          strokeWidth: 1,
        ),
//        Text('下拉刷新'),
      ],
    );
  }
}

enum Category {
  Hot,
  Recent,
  Recommend,
}
