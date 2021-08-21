import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DropDownModel extends ChangeNotifier {
  List docList = [];

  setValue(dropdownValue, newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }

  static final currentUser = FirebaseAuth.instance.currentUser;
  final uid = currentUser?.uid;

  void getDocId() {
    List docList = [];

    FirebaseFirestore.instance
        .collection('room')
        .doc(uid)
        .collection('article')
        .get()
        .then(
          (QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach(
              (doc) {
                docList.add(doc.id);

                notifyListeners();
              },
            ),
          },
        );

    this.docList = docList;
  }
}
