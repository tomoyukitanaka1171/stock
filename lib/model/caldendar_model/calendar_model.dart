import 'dart:math' as math;

import 'package:bottom_nav_app/domain/event.dart' as Domain;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarModel extends ChangeNotifier {
  FirebaseFirestore _firebaseInstance = FirebaseFirestore.instance;

  DateTime? currentDate;
  String? event;
  List<Event>? events;

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  EventList<Event> markedDateMap = EventList<Event>(
    events: {
      DateTime(2019, 8, 9): [
        Event(
          date: DateTime(2019, 8, 9),
          title: '',
          icon: null,
        ),
      ],
    },
  );

  getFireEvents() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    final snapshot = await _firebaseInstance
        .collection('event')
        .where('uid', isEqualTo: uid)
        .get();

    print(uid);

    final List<Domain.Event> eventsList = snapshot.docs.map((document) {
      final String event = document['event'];
      final Timestamp createdAt = document['createdAt'];
      final int id = document['id'];

      this.markedDateMap.add(
          createdAt.toDate(),
          Event(
            id: id,
            date: createdAt.toDate(),
            title: event,
            icon: _eventIcon,
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: Colors.red,
              height: 5.0,
              width: 5.0,
            ),
          ));

      notifyListeners();

      return Domain.Event(event, createdAt);
    }).toList();
  }

  setDay(date) {
    this.currentDate = date;
    notifyListeners();
  }

  setEvent() async {
    this.markedDateMap = EventList<Event>(
      events: {
        DateTime(2019, 8, 9): [
          Event(
            date: DateTime(2019, 8, 9),
            title: '',
            icon: null,
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: Colors.red,
              height: 5.0,
              width: 5.0,
            ),
          ),
        ],
      },
    );

    final int id = math.Random().nextInt(1000000);
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    await _firebaseInstance.collection('event').add({
      'id': id,
      'uid': uid,
      'createdAt': currentDate,
      'event': event,
    });
    notifyListeners();
  }

  getEvents(events) {
    this.events = events;
  }

  deleteEvent(id) async {
    final snapshot = _firebaseInstance.collection('event');

    await snapshot
        .where('id', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        String id = doc.id;
        snapshot.doc(id).delete();
      });
    });
  }
}
