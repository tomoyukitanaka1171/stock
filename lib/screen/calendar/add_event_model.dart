import 'package:flutter/material.dart';

class AddEventModel extends ChangeNotifier {
  Map<DateTime, List> eventsList = {};
  String? event;
}
