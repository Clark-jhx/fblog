import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Example(),
    ));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 3000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 3000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PullToRefresh"),
        ),
        body: Container(
          alignment: Alignment.center,
          width: 400,
          height: 400,
          color: Colors.blue,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            header: ClassicHeader(
              refreshStyle: RefreshStyle.Follow,
            ),
            footer: ClassicFooter(),
            child: ListView.builder(
              itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
              itemExtent: 100.0,
              itemCount: items.length,
            ),
          ),
        ));
  }
}
