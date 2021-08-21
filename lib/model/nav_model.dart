import 'package:bottom_nav_app/model/dropdown_model.dart';
import 'package:bottom_nav_app/screen/article/archive_page.dart';
import 'package:bottom_nav_app/screen/article/article_page.dart';
import 'package:bottom_nav_app/screen/calendar_page.dart';
import 'package:bottom_nav_app/screen/chat_page.dart';
import 'package:bottom_nav_app/screen/setting/settigs_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NavModel extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> widgetOptions = <Widget>[
    ArticlePage(),
    ChatPage(),
    CalendarPage(),
    SettingsPage(),
  ];

  List<PreferredSizeWidget> appBarOptions = <PreferredSizeWidget>[
    AppBar(
      elevation: 4,
      leading: Container(),
      title: Text(
        '${DateFormat('M月').format(DateTime.now())}の出来事',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        ChangeNotifierProvider<DropDownModel>(
            create: (_) => DropDownModel()..getDocId(),
            builder: (context, snapshot) {
              String dropdownValue = 'Archive';

              return Consumer<DropDownModel>(builder: (context, model, child) {
                final List<Widget> widgets = model.docList
                    .map((article) => TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ArchivePage(article);
                          }));
                        },
                        child: Text(
                          article,
                          style: TextStyle(color: Colors.black),
                        )))
                    .toList();

                return PopupMenuButton<String>(
                    onSelected: (String? newValue) {
                      model.setValue(dropdownValue, newValue);
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            child: Column(
                              children: widgets,
                            ),
                          )
                        ]);
              });
            })
      ],
    ),
    AppBar(
      elevation: 4,
      leading: Container(),
      title: Text(
        'みんなの出来事',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
    ),
    AppBar(
      elevation: 4,
      leading: Container(),
      title: Text(
        'カレンダー',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
    ),
    AppBar(
      elevation: 4,
      leading: Container(),
      title: Text(
        '設定',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
    ),
  ];
}
