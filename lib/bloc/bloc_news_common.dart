import 'package:fblog/bean/newBody.dart';
import 'package:fblog/bean/newComments.dart';
import 'package:fblog/bean/news.dart';
import 'package:fblog/bloc/bloc_common/BlocBase.dart';

abstract class BlocNewsCommon extends BlocBase {
  void getHotNews(
      int pageIndex, int pageSize, String startDate, String endDate);

  void getRecentNews(int pageIndex, int pageSize);

  void getRecommandNews(int pageIndex, int pageSize);

  void getNewBody(int newId);

  void getNewComments(int newId, int pageIndex, int pageSize);

  void triggerHotNews(List<New> news);

  void triggerRecentNews(List<New> news);

  void triggerRecommandNews(List<New> news);

  void triggerNewBody(NewBody newBody);

  void triggerNewComments(NewComments newComments);
}
