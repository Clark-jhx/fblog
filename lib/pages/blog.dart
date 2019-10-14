import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  @override
  BlogState createState() => BlogState();
}

class BlogState extends State<BlogPage> {
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
