import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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
  EasyRefreshController _controller;

  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyRefresh"),
      ),
      body: EasyRefresh(
        controller: _controller,
        onRefresh: () async {
          // 下拉刷新
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          // 上拉加载更多
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            setState(() {
              items.add('xx');
            });
            _controller.finishLoad();
          });
        },
        enableControlFinishLoad: false, // 由controll控制结束上拉下拉
        enableControlFinishRefresh: false, // 由controll控制结束上拉下拉
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        firstRefresh: false,
        firstRefreshWidget: null,
        emptyWidget: null,
        topBouncing: true,
        bottomBouncing: true,
        headerIndex: null,
        taskIndependence: false,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }
}
