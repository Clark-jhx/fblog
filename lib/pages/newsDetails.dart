import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bloc/bloc_common/BlocProvider.dart';
import 'package:fblog/bloc/bloc_new_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocNewDetail>(
        child: NewsDetailsMain(), bloc: BlocNewDetail());
  }
}

class NewsDetailsMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsDetailsMainState();
  }
}

class NewsDetailsMainState extends State<NewsDetailsMain> {
  static const String TAG = "newsDetails.dart ";
  String newID;
  BlocNewDetail _blocNewBody;

  @override
  void initState() {
    _blocNewBody = BlocProvider.of<BlocNewDetail>(context);
    super.initState();
  }

  @override
  void dispose() {
    print(TAG + "newsDetail.dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 从路由中提取参数
    dynamic arguments = ModalRoute.of(context).settings.arguments;
    newID = arguments['newId'];
    // 等候一秒 触发更新
    Future.delayed(Duration(milliseconds: 1000), () {
      _blocNewBody.getNewBody(int.parse(newID));
    });

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
        child: StreamBuilder<NewBody>(
            initialData: null,
            stream: _blocNewBody.newBodyStream,
            builder: (BuildContext context, AsyncSnapshot<NewBody> snapshot) {
              NewBody newBody = snapshot.data;
              if (newBody == null || newBody.content == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Html(
                    padding:
                        EdgeInsets.only(left: 2, top: 1, right: 2, bottom: 1),
                    data: newBody.content,
                  ),
                );
              }
            }),
      ),
    );
  }
}
