import 'package:bottom_nav_app/screen/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  String mail = '';
  String pass = '';
  String key = '';
  String? keyword;

  bool isLoading = false;

  String? documentId;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> signUp() async {
    if (mail == '' && pass == '') {
      throw 'メールアドレスとパスワードを入力してください';
    }

    if (mail == '') {
      throw 'メールアドレスを入力してください';
    }

    if (pass == '') {
      throw 'パスワードを入力してください';
    }

    final User? user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: pass))
        .user;
    if (user == null) {
      return print('userがnull');
    }
    String? email = user.email;

    final users = await FirebaseFirestore.instance.collection('user').add({
      'email': email,
      'createdAt': Timestamp.now(),
    }); //kinoko@icloud.com 123456

    final DocumentSnapshot _user = await users.get();
    final documentId = _user.id;
    this.documentId = documentId;
    print(documentId);
  }

  Future<void> signIn() async {
    if (mail == '' && pass == '') {
      throw 'メールアドレスとパスワードを入力してください';
    }

    if (mail == '') {
      throw 'メールアドレスを入力してください';
    }

    if (pass == '') {
      throw 'パスワードを入力してください';
    }

    final User? user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: pass))
        .user;

    if (user == null) {
      throw 'userがはいってない';
    }
  }

  addManGender(id) {
    print(id);
    FirebaseFirestore.instance.collection('user').doc(id).set(
        {'gender': 'man'}, SetOptions(merge: true)); //kinoko@icloud.com 123456
  }

  addWomanGender(id) {
    print(id);
    FirebaseFirestore.instance.collection('user').doc(id).set(
        {'gender': 'woman'},
        SetOptions(merge: true)); //kinoko@icloud.com 123456
  }

  checkSignIn(context) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Nav();
        }));
      }
    });
  }
}
