import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  MineState createState() => MineState();
}

class MineState extends State<MinePage> {
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
          child: Text('mine'),
        ),
      ),
    );
  }
}
