import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
  String html = """
    网易科技讯，1 月 2 日消息，今日有自称腾讯 7 年的老员工称，&ldquo;人到中年，被腾讯暴力裁员。&rdquo;据他文章披露，2019 年 3 月某天下午，腾讯 HR
	派出大批保安单方面暴力裁员，让很多保安逼迫其收拾东西离开，当场封掉工卡、内网账号、公司邮箱等所有腾讯内部权限和资料，理由是每天工作不足八小时。</p>\r\n<p>据该网友透露，腾讯提供的 10 点到 18
	点的工位监控视频，是本案劳动仲裁和一审的最重要证据。但该网友声称，腾讯提供的监控视频时间节点都是中断的并不连续，每天提供两段视频，10 点到 14 点，14 点到 18 点。&ldquo;腾讯未提供 10 点-18
	点时间段以外及周末的监控视频，不能证明我的工作时间全貌，我在 18 点以后的工作状态被腾讯选择性删除。&rdquo;并表示，该监控视频不是连续的，明显截断翻录。</p>\r\n<p
	style=\"text-align:center;\"><img style=\"text-align: center; display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200102145713500-477819942.png\" alt=\"腾讯暴力裁员？官方回应：该员工不匹配岗位要求\" />
	<!--EndFragment-->
</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200102145713510-1143599373.png\" alt=\"腾讯暴力裁员？官方回应：该员工不匹配岗位要求\" /></p>
	\r\n<p style=\"text-align:center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200102145713582-1681276102.jpg\" alt=\"腾讯暴力裁员？官方回应：该员工不匹配岗位要求\" />
		<!--EndFragment-->
	</p>\r\n<p style=\"text-align: center;\">
		<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200102145713477-31823490.jpg\" alt=\"腾讯暴力裁员？官方回应：该员工不匹配岗位要求\" /></p>
		\r\n<p>对此，腾讯方面回应称，&ldquo;该名前员工在离职之前的相当长时间内，无论是在岗时段、实际工作成果还是其他相关行为表现，均未能匹配对应岗位要求。尤其从 2018
			年底起，本人拒绝履行岗位职责，多次无故缺勤及旷工，确系严重违反劳动纪律和规章制度。2019 年 3 月，公司依法与其解除劳动关系。2019 年 5 月-7
			月，深圳市劳动人事争议仲裁委员会与一审法院先后受理此案，均支持公司与其解除劳动关系的决定。&rdquo;</p>\r\n<p>
			腾讯还表示，在劳动仲裁机构与法院受理过程中，公司按照举证要求，提供包含《劳动合同》、《员工假期管理制度》、工作安排邮件、工作沟通记录、休假记录、日常管理记录、办公楼视频等在内的证据材料。视频证据仅为其中一环，用于相关争议的佐证，其内容取自日常楼宇的安全监控，并非针对单个员工设置。（一橙）
		</p>\r\n
		<!-- 作者 -->
		<!-- 声明 --><img src=\"http://counter.cnblogs.com//news/item/652943\" width=\"1\" height=\"1\" style=\"border:0px;visibility:hidden\"/>
  """;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('HTML'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            child: Html(
              padding: EdgeInsets.only(left: 2, top: 1, right: 2, bottom: 1),
              data: html,
            ),
          ),
        ),
      ),
    );
  }
}