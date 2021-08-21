import 'package:bottom_nav_app/model/settings_model.dart';
import 'package:bottom_nav_app/screen/accont/sign_in_page.dart';
import 'package:bottom_nav_app/screen/setting/profile_page.dart';
import 'package:bottom_nav_app/screen/setting/settings_color_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsModel>(
        create: (_) => SettingsModel()..fetchUser(),
        builder: (context, snapshot) {
          return Consumer<SettingsModel>(builder: (context, model, child) {
            String? name = model.name;

            if (name == null) {
              return Container();
            }

            print(model.name);

            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '${model.name}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        child: Center(
                            child: Text(
                          'プロフィールを編集する',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        onPressed: () async {
                          await Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ProfilePage();
                          })).then(
                            (name) => model.setName(name),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.black12,
                  thickness: 1,
                ),
                Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'このアプリについて',
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(
                      height: 0,
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(
                                "ログアウト",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Text("本当にログアウトしますか？"),
                              actions: [
                                TextButton(
                                  child: Text(
                                    "いいえ",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: Text("はい"),
                                  onPressed: () async {
                                    await _signOut();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignInPage();
                                    }));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      title: Text(
                        'ログアウト',
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(
                      height: 0,
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return SettingsColorPage();
                        }));
                      },
                      title: Text(
                        '色の変更',
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(
                      height: 0,
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }
}
