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
    <p style="text-align: left;"><strong>今年 1 月底，加拿大最大的比特币交易平台 QuadrigaCX 的创始人被曝意外去世</strong>，其妻子作证说，丈夫意外去世时，没有告诉任何人他的加密笔记本电脑密码，<strong>按当时的币值估计，这将至少 1.37 亿美元的客户资产带进了坟墓</strong>。</p>
 <p>现在，一些愤怒的投资者想挖出这位创始人的尸体，以确保他是真的死了，而不是卷钱跑路玩失踪。</p>
 <p style="text-align: center;"><img src="//img2018.cnblogs.com/news/34358/201912/34358-20191223161856879-777295362.jpg" alt="" data-ratio="0.65125" data-type="png" data-w="800" /></p>
 <p><strong>目前，代表交易所客户的律师已经要求加拿大执法人员开棺验尸</strong>，在申请文件中提到 &ldquo;围绕 Cotten 死亡的可疑情况和在事件中遭受的重大损失&rdquo; 以确认其身份和死因，而且，考虑到尸体随着时间推移会分解的情况，要求挖掘和尸检工作最迟要在 2020 年春季完成。</p>
 <p><strong>一、创始人离奇去世 </strong></p>
 <p>该事件在今年 2 月份首次被媒体报道出来，当时，QuadrigaCX 创始人 Gerry Cotten 的妻子 Jennifer Robertson 提交了一份宣誓书，称 Gerry Cotten 在印度度假时猝死，享年 30 岁，原因是克罗恩病的并发症，这是一种很少致命的肠道疾病。</p>
 <p><strong>受此影响，QuadrigaCX 失去了对至少 1.37 亿美元客户资产的控制，因为它存储在一台笔记本电脑上，根据 Jennifer Robertson 的证词，只有 Cotten 知道密码。</strong></p>
 <p>Jennifer Robertson 表示，她既没有密码，也没有笔记本电脑的恢复密钥，这台笔记本电脑储存了一个加密本地&ldquo;钱包&rdquo;，也就是一个没有连接到互联网的数字钱包，里面装着交易所超过 10 万名客户的至少 1.37 亿美元的加密货币。</p>
 <p>Jennifer Robertson 作证说，她对密码进行了&ldquo;反复和勤奋的搜索&rdquo;，但徒劳无功，也聘请了专家试图解密笔记本电脑，但也失败了，一位专家试图入侵计算机，但这一尝试也毫无结果。</p>
 <p><strong>二、可疑线索被发现</strong></p>
 <p>日前，《纽约时报》报道称，目前该交易所客户无法正常提取交易的金额总计达 2.5 亿美元。与此同时，QuadrigaCX 所在的加拿大和美国执法官员都在调查可能的潜在不法行为，<strong>投资者们也叫嚣着要证明 Cotten 实际上已经死了，活要见人，死要见尸</strong>。</p>
 <p>纽约时报表示，代表交易所客户的律师已经要求加拿大执法人员挖出他的尸体，并进行尸检，在申请文件中提到 &ldquo;围绕 Cotten 死亡的可疑情况和在事件中遭受的重大损失&rdquo; 以确认其身份和死因，<strong>另外，考虑到尸体随着时间推移会分解的情况，要求挖掘和尸检工作最迟要在 2020 年春季完成</strong>。</p>
 <p>QuadrigaCX 方面直到今年 1 月 14 日才在 Facebook 的一篇帖子中披露了创始人 Cotten 死亡，据说这是在事发一个多月后才公布。随后，QuadrigaCX 平台于 2019 年 1 月 28 日关闭，导致用户无法提取在交易所存放的资金，<strong>自此，客户们就开始在社交媒体上纷纷猜疑，死亡和密码丢失可能是创始人为了携加密货币资产潜逃而制造的假象。</strong></p>
 <p>对于此案，除了加拿大新斯科舍省最高法院的调查外，美国联邦调查局还与美国国税局、美国哥伦比亚特区检察官以及司法部计算机犯罪和知识产权科一起对 QuadrigaCX 公司进行了调查。</p>
 <p><strong>其中一项调查发现了一些重要线索。</strong>一份来自 Ernst &amp; Young 会计师事务所（一家由新斯科舍省最高法院聘用的审计公司）的报告显示，QuadrigaCX 似乎没有任何&ldquo;基本公司记录&rdquo;，包括会计记录。</p>
 <p>更令人怀疑的是，报告称该交易所已将 &ldquo;大量加密货币&rdquo; 转入 Gerry Cotten 在其他交易所持有的个人账户中去了，这些可疑的资产转移操作并没有明确的商业理由和公告提醒。</p>
 <p><strong>目前尚不清楚挖掘和尸检工作对于找回丢失的加密货币是否有所帮助，但会证实 Gerry Cotten 是否已经死亡，并向 QuadrigaCX 交易所的客户们如实披露。</strong></p>
 <p>QuadrigaCX 和失踪的 2.5 亿美元的案件是大多数金融机构无法想象的，在充满泡沫且基本上不受监管的加密货币领域，这种平台暴雷事件即便不会频繁发生，也是会时不时出现的。</p>
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
