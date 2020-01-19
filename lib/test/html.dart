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
    "<p><strong>洪恒飞&nbsp;吴雅兰&nbsp;</strong></p>\r\n<p><strong>科技日报记者&nbsp;江耘</strong></p>\r\n<p>
	&ldquo;握住，很棒，向自己的嘴巴移动，再往回一些，好差不多，停！&rdquo;随着张先生吸溜一口可乐，浙大二院神经外科病房内响起了一片掌声。</p>\r\n<p>
	<strong>如此简单的一个动作，大家为何要为他喝彩？</strong></p>\r\n<p>72 岁高龄的张先生是中国第一位在大脑中植入脑机接口电极的患者，目前住在浙江大学医学院附属第二医院神经外科的病房里。</p>\r\n
<p>&ldquo;太不容易了！对四肢完全瘫痪的人来说，这是不可能完成的任务。今天，通过脑机接口，他做到了！&rdquo;浙大二院神经外科主任张建民激动地说。</p>\r\n<p>16
	日，浙江大学发布&ldquo;双脑计划&rdquo;最新科研成果。该校求是高等研究院&ldquo;脑机接口&rdquo;团队与浙大医学院附属第二医院神经外科合作完成了国内首例植入式脑机接口临床研究。</p>\r\n<p>
	该团队在国内首次通过对一位高位截瘫志愿者脑内植入 Utah
	阵列电极，<strong>患者可以利用大脑运动皮层信号精准控制外部机械手臂，完成进食、饮水和握手等一系列上肢重要功能运动。</strong>首次证明了高龄患者利用植入式脑机接口进行复杂运动控制的可行性。</p>\r\n<p>
	&ldquo;相比以往在患者大脑皮层表面&lsquo;盖&rsquo;上一块电极片，属于开颅但不插入皮层的半植入式操作，我们这次把微电极阵列直接插入大脑运动皮层里面，可以检测单个神经元细胞放电情况，获取的信号更直接、稳定和丰富。&rdquo;浙大求是高等研究院教授王跃明说。
</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200116173535179-1750644885.gif\" alt=\"\" data-cropselx1=\"0\" data-cropselx2=\"544\" data-cropsely1=\"0\" data-cropsely2=\"343\" data-ratio=\"0.5628571428571428\" data-s=\"300,640\" data-type=\"gif\" data-w=\"350\" /><br /><span style=\"font-size: 13px; color: #888888;\">图片来源：浙大二院</span>
</p>\r\n<p>据介绍，大脑皮层神经元共分为 6 层，该实验需要将电极植入到第 5 层位置，植入位置太浅达不到效果，太深则会损伤其他神经。研究人员采用步进为 0.1 毫米的手术机器人，准确地将 2 个微电极阵列送入既定位置，误差控制在
	0.5 毫米以内。</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200116173534672-686740734.jpg\" alt=\"\" data-ratio=\"0.5\" data-type=\"jpeg\" data-w=\"1080\" /><br /><span style=\"font-size: 13px; color: #888888;\">图片来源：浙大二院</span>
</p>\r\n<p>&ldquo;在 4 毫米&times;4 毫米大小的微电极阵列上有 100 个电极针脚，每一个针脚都可能检测到 1
	个甚至多个神经元细胞放电。电极的另一端连接着计算机，可以实时记录大脑发出的神经信号。&rdquo;王跃明解释道，大脑中上千亿个神经元通过发出微小的电脉冲相互交流，从而对人体行为发号施令，实现意念控制需要对电极检测范围内的人脑神经电信号进行实时采集和解码，将不同的电信号特征与机械手臂的动作匹配对应。
</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200116173534694-1057868838.jpg\" alt=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"600\" /><br /><span style=\"font-size: 13px; color: #888888;\">张建民教授团队为张先生手术。图片来源：浙大二院</span>
</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200116173534666-1719567667.png\" alt=\"\" data-ratio=\"0.4125\" data-type=\"png\" data-w=\"400\" /><br /><span style=\"font-size: 13px; color: #888888;\">术后复查确认电极植入位置无误。图片来源：浙大二院</span>
</p>\r\n<p>
	由于脑机接口技术同时依赖患者脑电信号特征及机器算法设计，目前尚无统一的信号采集、解码等分析手段，且老年患者的脑电信号质量与稳定性都要差些，研究团队为此设计了个性化的非线性解码器，并通过四个多月的反馈式学习，使该患者能操控机械手臂进行饮水、进食、握手等动作。
</p>\r\n<p style=\"text-align: center;\">
	<img src=\"https://img2018.cnblogs.com/news/34358/202001/34358-20200116173534669-1140936751.jpg\" alt=\"\" data-ratio=\"0.6033333333333334\" data-type=\"png\" data-w=\"600\" /><br /><span style=\"font-size: 13px; color: #888888;\">患者通过意念操作机械手臂与研究人员握手。卢绍庆摄</span>
</p>\r\n<p>
	<strong>&ldquo;高位截瘫、肌萎缩侧索硬化、闭锁综合征等重度运动功能障碍患者有望应用植入式脑机接口技术并借助外部设备重建肢体运动、语言等功能。&rdquo;</strong>浙大医学院附二医院神经外科主任张建民说，随着脑科学的不断发展，这一领域的临床应用将从现有的以运动为主的功能重建逐渐推广到语言、感觉、认知等更多更复杂的功能重建上。
</p><img src=\"http://counter.cnblogs.com//news/item/653777\" width=\"1\" height=\"1\" style=\"border:0px;visibility:hidden\"/>"
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
