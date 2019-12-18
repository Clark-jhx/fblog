import 'package:flutter/material.dart';
import 'package:fblog/bean/news.dart';

///新闻列表 item布局
class ItemNews extends StatefulWidget {
  ItemNews(this._new, {Key key}) : super(key: key);

  New _new;
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
  _ItemNewsState createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      '${widget._new.title}',
                      textDirection: TextDirection.ltr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: widget._textStyle_1,
                    )),
                Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(left: 5, top: 0, right: 4, bottom: 0),
                    child: Text(
                      '${widget._new.summary}',
                      textDirection: TextDirection.ltr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: widget._textStyle_2,
                    )),
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Text(
                          '${widget._new.diggs}',
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        ),
                        Text(
                          "推荐·",
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        )
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Text(
                          '${widget._new.views}',
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        ),
                        Text(
                          "阅读·",
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        )
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Text(
                          '${widget._new.comments}',
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        ),
                        Text(
                          "评论",
                          textDirection: TextDirection.ltr,
                          style: widget._textStyle_3,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
