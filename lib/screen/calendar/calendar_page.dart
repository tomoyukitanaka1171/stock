import 'package:bottom_nav_app/model/caldendar_model/calendar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalendarModel>(
        create: (_) => CalendarModel()..getFireEvents(),
        builder: (context, snapshot) {
          return Consumer<CalendarModel>(builder: (context, model, child) {
            List<Widget>? widgets = model.events?.map((event) {
              return Column(
                children: [
                  ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('削除'),
                                content: Text('イベントを削除しますか？'),
                                actions: [
                                  TextButton(
                                    child: Text('はい'),
                                    onPressed: () {
                                      model.deleteEvent(event.id);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text('いいえ'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      title: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          event.title!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              );
            }).toList();

            return Column(
              children: [
                CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) async {
                    await model.setDay(date);
                    await model.getEvents(events);
                  },
                  locale: 'ja',
                  customGridViewPhysics: NeverScrollableScrollPhysics(),
                  iconColor: Theme.of(context).primaryColor,
                  weekdayTextStyle: TextStyle(color: Colors.black54),
                  headerTextStyle: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                  selectedDayButtonColor:
                      Theme.of(context).primaryColor.withOpacity(0.7),
                  todayButtonColor: Theme.of(context).primaryColor,
                  selectedDateTime: model.currentDate,
                  height: 420.0,
                  weekendTextStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  markedDatesMap: model.markedDateMap,
                ),
                widgets != null
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widgets.length,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? widgets[index]
                                    : Column(
                                        children: [
                                          Divider(
                                            thickness: 1,
                                            indent: 16,
                                            endIndent: 16,
                                          ),
                                          widgets[index],
                                        ],
                                      );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      )
                                    ]),
                                child: TextButton(
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('イベントを追加'),
                                            content: TextField(
                                              onChanged: (text) {
                                                model.event = text;
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    model.setEvent();
                                                    model.getFireEvents();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('保存')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('キャンセル')),
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            );
          });
        });
  }
}
//DateFormat('yyyy年M月d日').format(DateTime.now)
