import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MinePage extends StatefulWidget {
  static const String TAG = "mine.dart ";
  @override
  MineState createState() {
    print(TAG + 'MinePage createState()');
    return MineState();
  }
}

class MineState extends State<MinePage> {
  static const String TAG = "mine.dart ";
  @override
  void initState() {
    super.initState();
    print(TAG + 'MineState initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print(TAG + 'MineState dispose()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mine'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          alignment: Alignment.center,
          child: WebView(
            initialUrl: 'https://www.baidu.com',
          ),
        ),
      ),
    );
  }
}
