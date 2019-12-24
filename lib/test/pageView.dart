import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 3,
			child: Scaffold(
				appBar: AppBar(
					title: Text('pageView'),
				),
				body: Container(
					alignment: Alignment.center,
					child: SizedBox(
						width: 200,
						height: 200,
						child: PageView(
							scrollDirection: Axis.horizontal,
							reverse: false,
							children: <Widget>[
								Text('xxx'),
								Text('xxx'),
								Text('xxx'),
								Text('xxx'),
								Text('xxx'),
							],
						),
					),
				),
			),
		);
	}
}
