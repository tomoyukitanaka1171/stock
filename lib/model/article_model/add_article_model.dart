import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddArticleModel extends ChangeNotifier {
  AddArticleModel();
  File? imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  static Timestamp? createdAt = Timestamp.now();
  String? content;
  String? date = DateFormat.yMMM('ja').format(createdAt!.toDate());

  String name = '';

  Future addArticle() async {
    if (content == null || content == '') {
      throw '内容が入力されていません';
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    if (uid == null) {
      print('uiがnull');
      return;
    }

    await FirebaseFirestore.instance
        .collection('room')
        .doc(uid)
        .collection('article')
        .doc(date)
        .collection('article')
        .add({
      'content': content,
      'createdAt': createdAt,
      'date': date,
    });

    await FirebaseFirestore.instance
        .collection('room')
        .doc(uid)
        .collection('article')
        .doc(date)
        .set({
      'date': date,
    });
  }

  Future setArticle() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    if (uid == null) {
      print('uiがnull');
      return;
    }

    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'content': content,
      'createdAt': createdAt,
    });
    notifyListeners();
  }
}
