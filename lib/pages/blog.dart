import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  @override
  BlogState createState() {
    print('BlogPage createState()');
    return BlogState();
  }
}

class BlogState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    print('BlogState initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print('BlogState dispose()');
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
