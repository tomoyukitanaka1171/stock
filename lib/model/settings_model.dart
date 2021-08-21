import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  String? name;
  setName(name) {
    this.name = name;
    notifyListeners();
  }

  startLoading() {
    return CircularProgressIndicator();
  }

  Future<void> fetchUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    print(uid);

    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();

    print(uid);

    final data = documentSnapshot.data() as Map<String, dynamic>;
    final name = data['name'];
    print('---$name');
    this.name = name;
    notifyListeners();
  }

  static Future<String> returnName() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    print(uid);

    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();

    print(uid);

    final data = documentSnapshot.data() as Map<String, dynamic>;
    final name = data['name'];
    print(data);
    return name;
  }
}
