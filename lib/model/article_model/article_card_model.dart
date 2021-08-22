import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/article.dart';

class ArticleCardModel extends ChangeNotifier {
  List<Article>? articles;
  String title = '';
  static Timestamp? createdAt = Timestamp.now();
  String? date = DateFormat.yMMM('ja').format(createdAt!.toDate());

  void fetchArticleList() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('room')
        .doc(uid!)
        .collection('article')
        .doc(date)
        .collection('article')
        .orderBy('createdAt', descending: false)
        .snapshots();

    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Article> articles =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

        final String content = data["content"];
        final Timestamp createdAt = data["createdAt"];
        final String documentId = document.id;

        return Article(content, createdAt, documentId);
      }).toList();
      this.articles = articles;
      notifyListeners();
    });
  }
}
