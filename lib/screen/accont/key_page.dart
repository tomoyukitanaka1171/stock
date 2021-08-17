import 'package:bottom_nav_app/constrains.dart';
import 'package:bottom_nav_app/model/key_model.dart';
import 'package:bottom_nav_app/screen/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ChangeNotifierProvider<KeyModel>(
        create: (_) => KeyModel(),
        child: Consumer<KeyModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            '彼女の名前を教えてください',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              )),
                              child: TextField(
                                onChanged: (text) {
                                  model.keyword = text;
                                },
                              ),
                            ),
                            SizedBox(width: 30),
                            Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: TextButton(
                                    onPressed: () async {
                                      await model.addKey();
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return Nav();
                                      }));
                                    },
                                    child: Text(
                                      '登録',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
//fwffefe@icloud.com
