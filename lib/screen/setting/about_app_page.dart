import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'このアプリについて',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'バージョン情報',
            ),
            trailing: Text(
              '1.00',
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
          ),
          Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            onTap: () async {
              final url =
                  "https://github.com/tomoyukitanaka1171/stock_documents/blob/main/TermsService.md";
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            title: Text(
              '利用規約',
            ),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            onTap: () async {
              final url =
                  "https://github.com/tomoyukitanaka1171/stock_documents/blob/main/Privacy_Policy.md";
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            title: Text(
              'プライバシーポリシー',
            ),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            onTap: () async {
              final url = "https://donack.org/contact/";
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            title: Text(
              'お問い合わせ',
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
