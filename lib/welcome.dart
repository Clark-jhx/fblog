import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  WelcomeState createState() {
    print('WelcomePage createState()');
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    print('WelcomeState initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print('WelcomeState dispose()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          alignment: Alignment.center,
          child: Text('welcome'),
        ),
      ),
    );
  }
}
