class NewBody {
  String title;
  String sourceName;
  String submitDate;
  String content;
  String imageUrl;
  String prevNews;
  String nextNews;
  String commentCount;

  NewBody(this.title, this.sourceName, this.submitDate, this.content,
      this.imageUrl, this.prevNews, this.nextNews, this.commentCount);

  factory NewBody.fromJson(Map<String, dynamic> json) {
    return NewBody(
        json['title'],
        json['sourceName'],
        json['submitDate'],
        json['content'],
        json['imageUrl'],
        json['prevNews'],
        json['nextNews'],
        json['commentCount']);
  }
}
