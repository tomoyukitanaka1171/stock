import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {
  String? name;

  createProfile() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    if (name == null) {
      name = '名無し';
    }

    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'name': name,
    });
  }

  static initializeProfile(email) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    await FirebaseFirestore.instance.collection('user').doc(uid).set({
      'createdAt': DateTime.now(),
      'content': '',
      'email': email,
      'name': '名無しさん',
    });
  }
}
