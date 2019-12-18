import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  TextStyle _textStyle_1 = TextStyle(
      fontSize: 17.5,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
      color: Colors.black87);

  TextStyle _textStyle_2 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      letterSpacing: 1,
      color: Colors.black54);

  TextStyle _textStyle_3 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w100, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 150,
        child: Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
              child: Column(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "啊手动阀啊手动阀安抚爱时发是发而法国啊啊阿尔安定发放安文丰安定发顺丰安文丰",
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: _textStyle_1,
                      )),
                  Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 5, top: 0, right: 4, bottom: 0),
                      child: Text(
                        "啊的肥肉额我公司大概微软尴尬的啊福建按u案发时间肯定发甲方缺发票啊手动阀骄傲我佩服紧迫感就怕"
                        "技术的额阿斯蒂芬骄傲微积分期望结果上帝反派静安分局啊啊发生积分派剑法帕维附件安排房间啊爬批发价安排"
                        "芬骄傲微积分期望结果上帝反派静安分局啊啊发生积分派剑法帕维",
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: _textStyle_2,
                      )),
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Text(
                            "0",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          ),
                          Text(
                            "推荐·",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          )
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Text(
                            "40",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          ),
                          Text(
                            "阅读·",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          )
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Text(
                            "2",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          ),
                          Text(
                            "评论",
                            textDirection: TextDirection.ltr,
                            style: _textStyle_3,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
