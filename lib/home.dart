import 'package:fblog/pages/blog.dart';
import 'package:fblog/pages/mine.dart';
import 'package:fblog/pages/news.dart';
import 'package:fblog/pages/newsDetails.dart';
import 'package:fblog/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // 路由表
  Map<String, WidgetBuilder> _routes = {
    '/': (context) => HomePage(),
    '/details': (context) => NewsDetails()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: _routes);
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('HomePage createState()');
    return HomePageState();
  }
}

class HomePageState extends State {
  List<BottomNavigationBarItem> _bottomNaivgationBars = new List();
  Map<String, WidgetBuilder> _routes = new Map();
  List<Widget> pages = new List();
  int _currentIndex = 0;

  @override
  void initState() {
    print('HomeState initState()');
    _init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print('HomeState dispose()');
  }

  void _init() {
    // 初始化底部导航栏数据
    _bottomNaivgationBars.add(BottomNavigationBarItem(
        icon: Icon(Icons.assignment), title: Text('新闻')));
    _bottomNaivgationBars.add(BottomNavigationBarItem(
        icon: Icon(Icons.playlist_play), title: Text('博客')));
    _bottomNaivgationBars.add(BottomNavigationBarItem(
        icon: Icon(Icons.person_pin), title: Text('我的')));
    // 初始化页数据
    pages.add(WelcomePage());
    pages.add(NewsPage());
    pages.add(BlogPage());
    pages.add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex + 1,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: _bottomNaivgationBars,
        onTap: _bottomClick,
        fixedColor: Theme.of(context).primaryColor, // 选中时的颜色
        currentIndex: _currentIndex,
      ),
    );
  }

  void _bottomClick(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
