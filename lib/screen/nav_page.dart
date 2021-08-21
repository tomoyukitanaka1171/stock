import 'package:bottom_nav_app/screen/add_article/add_article_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/nav_model.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangeNotifierProvider<NavModel>(
            create: (_) => NavModel(),
            builder: (context, snapshot) {
              return Consumer<NavModel>(builder: (context, model, child) {
                return Scaffold(
                  appBar: model.appBarOptions.elementAt(model.selectedIndex),
                  body: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          model.widgetOptions.elementAt(model.selectedIndex),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top:
                                BorderSide(color: Colors.black26, width: 1.0))),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      elevation: 5,
                      selectedItemColor: Theme.of(context).primaryColor,
                      unselectedItemColor: Colors.black54,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.chat_outlined),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.calendar_today_outlined),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.settings),
                          label: '',
                        ),
                      ],
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: model.selectedIndex,
                      onTap: model.onItemTap,
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return AddArticlePage();
                      }));
                    },
                    child: const Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                  ),
                );
              });
            }),
      ],
    );
  }
}
