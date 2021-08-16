import 'package:bottom_nav_app/screen/add_article/add_article_page.dart';
import 'package:bottom_nav_app/screen/article/article_page.dart';
import 'package:flutter/material.dart';

class NavModel extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> widgetOptions = <Widget>[
    ArticlePage(),
    AddArticlePage(),
    Text('Profile'),
  ];
}
