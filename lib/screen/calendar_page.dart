import 'package:bottom_nav_app/model/caldendar_model/calendar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalendarModel>(
        create: (_) => CalendarModel(),
        builder: (context, snapshot) {
          return Consumer<CalendarModel>(builder: (context, model, child) {
            DateTime? focusedDay;
            DateTime? selectedDay;

            return TableCalendar(
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  )),
              selectedDayPredicate: (day) {
                return isSameDay(model.selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                model.setDay(selectedDay, focusedDay);
              },
              locale: 'ja_JP',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            );
          });
        });
  }
}
//DateFormat('yyyy年M月d日').format(DateTime.now)
