class News {
	String id;
	String title;
	String updated;
	String link;
	List<New> entrys;

	News(this.id, this.title, this.updated, this.link, this.entrys);

	factory News.fromJson(Map<String, dynamic> json){
		var entrys = json['entrys'] as List;
		List<New> temp = entrys.map((value) => New.fromJson(value)).toList();

		return News(
			json['id'],
			json['title'],
			json['updated'],
			json['link'],
			temp
		);
	}
}

class New{
	String id;
	String title;
	String summary;
	String published;
	String updated;
	String link;
	String diggs;
	String views;
	String comments;
	String topic;
	String topicIcon;
	String sourceName;

	New(this.id, this.title, this.summary, this.published, this.updated, this.link, this.diggs,
		this.views, this.comments, this.topic, this.topicIcon, this.sourceName);

	factory New.fromJson (Map<String, dynamic> json){
		return New(json['id'], json['title'], json['summary'], json['published'],
		json['updated'], json['link'], json['diggs'], json['views'], json['comments'],
		json['topic'], json['topicIcon'], json['sourceName']);
	}
}