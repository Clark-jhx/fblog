import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_news.dart';
import 'package:fblog/widgets/item_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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

  int pageIndex = 1;
  int pageSize = PAGESIZE;
  String startDate = '2018-01-16T16:01:34.62';
  String endDate = '2018-10-26T15:33:50.587';

  BlocNews blocNews;

  bool refreshing = false;
  EasyRefreshController _controller;

  @override
  void initState() {
    print(TAG + widget.category.toString() + ' CommonNewsContent initState()');
    _init();
    super.initState();
  }

  void _init() {
    // 必须在新闻页中使用
    blocNews = BlocProvider.of<BlocNews>(context);
    _controller = EasyRefreshController();
    Future.delayed(Duration(milliseconds: 1000), () {
      _onRefresh();
    });
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
      child: EasyRefresh(
        controller: _controller,
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        firstRefresh: false,
        firstRefreshWidget: null,
        emptyWidget: null,
        topBouncing: true,
        bottomBouncing: true,
        headerIndex: null,
        taskIndependence: true,
        onLoad: _onLoad,
        onRefresh: _onRefresh,
        child: StreamBuilder<List<New>>(
          stream: getStream(),
          initialData: List(),
          builder: (BuildContext context, AsyncSnapshot<List<New>> snapshot) {
            List<New> news = snapshot.data;
            print(TAG + "列表有更新 列表大小：" + news.length.toString());
            if (news.length == 0) {
              return _getLoadWidget();
            } else {
              return ListView.builder(
                  shrinkWrap:
                      true, //解决异常：Vertical viewport was given unbounded height
                  physics:
                      ClampingScrollPhysics(), //解决异常：Vertical viewport was given unbounded height
                  primary:
                      false, //解决异常：Vertical viewport was given unbounded height
                  itemCount: news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemBuilder(context, index, news);
                  });
            }
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
    print(TAG + '开始 下拉刷新');
    if (!refreshing) {
      refreshing = true;
      pageIndex = 1;
      await _getNews(pageIndex, PAGESIZE, startDate, endDate, (dataSize) {
        print(TAG + '结束 下拉刷新 成功');
        refreshing = false;
        _controller.finishRefresh();
      }, (errorString) {
        print(TAG + '结束 下拉刷新 失败');
        refreshing = false;
        _controller.finishRefresh();
        // TODO: 土司：下拉刷新失败
      });
    }
  }

  // ignore: missing_return
  Future<void> _onLoad() async {
    print(TAG + '开始 上拉加载');
    if (!refreshing) {
      pageIndex++;
      refreshing = true;
      await _getNews(pageIndex, PAGESIZE, startDate, endDate, (dataSize) {
        print(TAG + '结束 上拉加载 成功');
        refreshing = false;
        _controller.finishLoad();
      }, (errorString) {
        print(TAG + '结束 上拉加载 失败');
        refreshing = false;
        _controller.finishLoad();
        // TODO: 土司：上拉加载失败
      });
    }
  }

  void _getNews(int pageIndex, int pageSize, String startDate, String endDate,
      OnSuccessCallback onSuccess, OnErrorCallback onError) {
    switch (widget.category) {
      case Category.Hot:
        blocNews.getHotNews(
            pageIndex, pageSize, startDate, endDate, onSuccess, onError);
        break;
      case Category.Recent:
        blocNews.getRecentNews(pageIndex, pageSize, onSuccess, onError);
        break;
      case Category.Recommend:
        blocNews.getRecommandNews(pageIndex, pageSize, onSuccess, onError);
        break;
    }
  }

  Widget _getLoadWidget() {
//    return ListView.builder(
//        shrinkWrap: true,
//        itemCount: 10,
//        itemBuilder: (BuildContext context, int index) {
//          return SampleListItem();
//        });
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            value: null,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }

  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;
}

// 上拉/下拉 成功与否的回调
typedef OnSuccessCallback = void Function(int dataSize);
typedef OnErrorCallback = void Function(String errorString);

enum Category {
  Hot,
  Recent,
  Recommend,
}
