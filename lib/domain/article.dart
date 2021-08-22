import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  Article(this.content, this.createdAt, this.documentId);
  String content;
  Timestamp createdAt;
  String? documentId;
}
