import 'package:flutter/material.dart';

class CalendarModel extends ChangeNotifier {
  DateTime? focusedDay;
  DateTime? selectedDay;

  setDay(selectedDay, focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    notifyListeners();
  }
}
