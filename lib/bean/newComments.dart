class NewComments {
//  String title;
//  String id;
//  String updated;
//  List<Comment> comments;
//
//  NewComments(this.title, this.id, this.updated, this.comments);
//
//  factory NewComments.fromJson(Map<String, dynamic> json) {
//    var comments = json['comments'] as List;
//    List<Comment> temp =
//        comments.map((value) => Comment.fromJson(value)).toList();
//    return NewComments(json['title'], json['id'], json['updated'], temp);
//  }

  List<Comment> comments;

  NewComments(this.comments);

  factory NewComments.fromJson(Map<String, dynamic> json) {
    var comments = json['NewComments'] as List;
    List<Comment> temp =
        comments.map((value) => Comment.fromJson(value)).toList();
    return NewComments(temp);
  }
}

class Comment {
//  String id;
//  String published;
//  String updated;
//  Author author;
//  String content;
//
//  Comment(this.id, this.published, this.updated, this.content, this.author);
//
//  factory Comment.fromJson(Map<String, dynamic> json) {
//    Author author = Author.fromJson(json['author']);
//    return Comment(json['id'], json['published'], json['updated'],
//        json['content'], author);
//  }

  int commentId;
  int contentId;
  String commentContent;
  String userGuid;
  int userId;
  String userName;
  String faceUrl;
  int floor;
  String dateAdded;
  int agreeCount;
  int antiCount;
  int parentCommentId;
  String parentComment;

  Comment(
      this.commentId,
      this.contentId,
      this.commentContent,
      this.userGuid,
      this.userId,
      this.userName,
      this.faceUrl,
      this.floor,
      this.dateAdded,
      this.agreeCount,
      this.antiCount,
      this.parentCommentId,
      this.parentComment);

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        json['CommentID'],
        json['ContentID'],
        json['CommentContent'],
        json['UserGuid'],
        json['UserId'],
        json['UserName'],
        json['FaceUrl'],
        json['Floor'],
        json['DateAdded'],
        json['AgreeCount'],
        json['AntiCount'],
        json['ParentCommentID'],
        json['ParentComment']);
  }
}

//class Author {
//  String name;
//  String uri;
//
//  Author(this.name, this.uri);
//
//  factory Author.fromJson(Map<String, dynamic> json) {
//    return Author(json['name'], json['uri']);
//  }
//}
