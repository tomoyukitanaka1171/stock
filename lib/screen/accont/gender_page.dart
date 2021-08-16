import 'package:bottom_nav_app/constrains.dart';
import 'package:bottom_nav_app/model/signup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'key_page.dart';

class GenderPage extends StatelessWidget {
  GenderPage(this.id);
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ChangeNotifierProvider<SignUpModel>(
        create: (_) => SignUpModel(),
        child: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'あなたは彼氏ですか？彼女ですか？',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  )),
                              child: TextButton(
                                onPressed: () async {
                                  await model.addManGender(id);
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return KeyPage();
                                  }));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      '彼氏',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  color: defaultColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  )),
                              child: TextButton(
                                onPressed: () async {
                                  await model.addWomanGender(id);
                                  Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return KeyPage();
                                    },
                                  ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      '彼女',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                model.isLoading
                    ? Container(
                        color: Colors.black12,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
//fwffefe@icloud.com
