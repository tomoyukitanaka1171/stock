import 'package:bottom_nav_app/model/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsColorPage extends StatelessWidget {
  const SettingsColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'テーマカラー設定',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Provider.of<MyTheme>(context, listen: false).toggleGreen();
            },
            title: Text(
              'フレッシュグリーン',
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
              Provider.of<MyTheme>(context, listen: false).toggleBlue();
            },
            title: Text(
              'ディープブルー',
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
              Provider.of<MyTheme>(context, listen: false).toggleCyan();
            },
            title: Text(
              'シアン',
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
              Provider.of<MyTheme>(context, listen: false).toggleBlue();
            },
            title: Text(
              'ディープブルー',
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
              Provider.of<MyTheme>(context, listen: false).toggleYellow();
            },
            title: Text(
              'レモンイエロー',
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
              Provider.of<MyTheme>(context, listen: false).toggleOrange();
            },
            title: Text(
              'オレンジ',
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
              Provider.of<MyTheme>(context, listen: false).toggleRed();
            },
            title: Text(
              'ピンクレッド',
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
    );
  }
}
