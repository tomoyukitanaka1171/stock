import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KeyModel extends ChangeNotifier {
  String keyword = '';
  static String roomId = '';

  static final _firestoreInstance = FirebaseFirestore.instance;
  final roomRef = _firestoreInstance.collection('room');

  Future<void> addKey() async {
    await FirebaseFirestore.instance.collection('room').add({
      'key': keyword,
      'createdAt': Timestamp.now(),
    });

    print(roomId);
    print(keyword);
  }
}
