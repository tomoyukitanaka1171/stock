import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/article.dart';

class ArticleCardModel extends ChangeNotifier {
  List<Article>? articles;

  void fetchArticleList() {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('article')
        .orderBy("title")
        .snapshots();

    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Article> articles =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

        final String title = data["title"];
        final String content = data["content"];
        final String imageURl = data["imageURL"];
        return Article(title, content, imageURl);
      }).toList();
      this.articles = articles;
      notifyListeners();
    });
  }
}
