import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  Event(this.event, this.createdAt);
  Timestamp? createdAt;
  String? event;
}
