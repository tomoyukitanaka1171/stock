import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  Chat(this.name, this.content, this.createdAt);
  String name;
  String content;
  Timestamp createdAt;
}
