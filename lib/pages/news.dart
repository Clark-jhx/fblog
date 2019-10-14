import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<NewsPage> {
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
          child: Text('news'),
        ),
      ),
    );
  }
}
