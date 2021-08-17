import 'package:flutter/material.dart';

class NavModel extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> widgetOptions = <Widget>[
    Text('Profile'),
    Text('Profile'),
    Text('Profile'),
  ];
}
