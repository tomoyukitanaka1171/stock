import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddArticleModel extends ChangeNotifier {
  AddArticleModel(this.keyword);
  File? imageFile;
  bool isLoading = false;
  String? keyword;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      throw '画像が選択されていません';
    }

    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  String? title;
  String? content;

  Future addArticle() async {
    if (title == null || title == '') {
      throw 'タイトルが入力されていません';
    }

    if (content == null || content == '') {
      throw '内容が入力されていません';
    }

    if (imageFile == null) {
      throw '画像が選択されていません';
    }

    final imageURL = await _uploadImage();
    print(keyword);

    await FirebaseFirestore.instance.collection('article').add({
      'title': 'd',
      'content': 'dd',
      'imagePath': 'fsd',
    });
    notifyListeners();
  }

  Future<String> _uploadImage() async {
    // firestorageに追加
    final storage = FirebaseStorage.instance;

    if (imageFile == null) {
      throw '画像が選択されていません';
    }

    TaskSnapshot snapshot =
        await storage.ref().child("article/$title").putFile(imageFile!);

    final String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
