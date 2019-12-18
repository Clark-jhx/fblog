import 'package:flutter/material.dart';

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
					flexibleSpace: SafeArea(
						child: TabBar(
							tabs: <Widget>[
								new Tab(text: '热门'),
								new Tab(text: '热门'),
								new Tab(text: '热门'),
							],
						),
					),
				),
				body: TabBarView(
					children: <Widget>[
						new Center(child: new Text('自行车')),
						new Center(child: new Text('船')),
						new Center(child: new Text('巴士')),
					],
				),
			),
		);
	}
}
