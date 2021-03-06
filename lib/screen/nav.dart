import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constrains.dart';
import '../model/add_article_model.dart';
import '../model/nav_model.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangeNotifierProvider<NavModel>(
            create: (_) => NavModel(),
            builder: (context, snapshot) {
              return Consumer<NavModel>(builder: (context, model, child) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    toolbarHeight: 0,
                    elevation: 0,
                  ),
                  body: Container(
                    child: model.widgetOptions.elementAt(model.selectedIndex),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    elevation: 5,
                    unselectedItemColor: Colors.black38,
                    selectedItemColor: defaultColor,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_a_photo),
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
                );
              });
            }),
        ChangeNotifierProvider<AddArticleModel>(
            create: (_) => AddArticleModel(),
            builder: (context, snapshot) {
              return Consumer<AddArticleModel>(
                  builder: (context, model, child) {
                return model.isLoading
                    ? Container(
                        color: Colors.black26,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox();
              });
            }),
      ],
    );
  }
}
