import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  String newID;

  @override
  State<StatefulWidget> createState() {
    return NewsDetailsState();
  }
}

class NewsDetailsState extends State<NewsDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;
    widget.newID = arguments['newId'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('新闻详情'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(widget.newID),
      ),
    );
  }
}
