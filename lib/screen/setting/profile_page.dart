import 'package:bottom_nav_app/model/profile_model.dart';
import 'package:bottom_nav_app/model/settings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'ユーザ情報編集',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<ProfileModel>(
            create: (_) => ProfileModel(),
            builder: (context, snapshot) {
              return Consumer<ProfileModel>(builder: (context, model, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ニックネームを入力してください'),
                        onChanged: (text) {
                          model.name = text;
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () async {
                              await model.createProfile();
                              final String name =
                                  await SettingsModel.returnName();
                              Navigator.pop(context, name);
                            },
                            child: Text('保存')),
                      )
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }
}
