import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  Article(this.content, this.createdAt);
  String content;
  Timestamp createdAt;
}
