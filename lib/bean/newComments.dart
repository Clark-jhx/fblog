class NewComments {
  String title;
  String id;
  String updated;
  List<Comment> comments;

  NewComments(this.title, this.id, this.updated, this.comments);

  factory NewComments.fromJson(Map<String, dynamic> json) {
    var comments = json['comments'] as List;
    List<Comment> temp =
        comments.map((value) => Comment.fromJson(value)).toList();
    return NewComments(json['title'], json['id'], json['updated'], temp);
  }
}

class Comment {
  String id;
  String published;
  String updated;
  Author author;
  String content;

  Comment(this.id, this.published, this.updated, this.content, this.author);

  factory Comment.fromJson(Map<String, dynamic> json) {
    Author author = Author.fromJson(json['author']);
    return Comment(json['id'], json['published'], json['updated'],
        json['content'], author);
  }
}

class Author {
  String name;
  String uri;

  Author(this.name, this.uri);

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(json['name'], json['uri']);
  }
}
