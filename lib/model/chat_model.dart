import 'package:bottom_nav_app/domain/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  List<Chat>? chats;

  fetchChat() async {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('user')
        .orderBy('createdAt')
        .snapshots();

    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Chat> chats = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        print(data);

        final String name = data["name"];
        final String content = data["content"];
        final Timestamp createdAt = data["createdAt"];

        return Chat(name, content, createdAt);
      }).toList();
      this.chats = chats;

      notifyListeners();
    });
  }
}
