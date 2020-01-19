import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  static const String TAG = "blog.dart ";

  @override
  BlogState createState() {
    print(TAG + 'BlogPage createState()');
    return BlogState();
  }
}

class BlogState extends State<BlogPage> {
  static const String TAG = "blog.dart ";
  @override
  void initState() {
    super.initState();
    print(TAG + 'BlogState initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print(TAG + 'BlogState dispose()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blog'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          alignment: Alignment.center,
          child: Text('blog'),
        ),
      ),
    );
  }
}
