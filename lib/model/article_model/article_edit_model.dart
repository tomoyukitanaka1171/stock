import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleEditModel extends ChangeNotifier {
  ArticleEditModel(this.content, this.documentId, this.createdAt);
  String? documentId;
  String? content;
  Timestamp? createdAt;

  Future<void> editArticle() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    String date = DateFormat.yMMM('ja').format(createdAt!.toDate());

    await FirebaseFirestore.instance
        .collection('room')
        .doc(uid)
        .collection('article')
        .doc(date)
        .collection('article')
        .doc(documentId)
        .set({'content': content}, SetOptions(merge: true));

    print(uid);
    print(documentId);
    print(content);
    notifyListeners();
  }

  Future<void> deleteArticle() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    String date = DateFormat.yMMM('ja').format(createdAt!.toDate());

    await FirebaseFirestore.instance
        .collection('room')
        .doc(uid)
        .collection('article')
        .doc(date)
        .collection('article')
        .doc(documentId)
        .delete();
  }
}
