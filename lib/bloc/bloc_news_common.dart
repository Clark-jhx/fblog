import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_common/BlocBase.dart';

abstract class BlocNewsCommon extends BlocBase {
  void triggerHotNews(List<New> news);

  void triggerRecentNews(List<New> news);

  void triggerRecommandNews(List<New> news);

  void triggerNewBody(NewBody newBody);

  void triggerNewComments(NewComments newComments);
}
