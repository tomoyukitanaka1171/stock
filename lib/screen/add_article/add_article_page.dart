import 'package:bottom_nav_app/model/article_model/add_article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangeNotifierProvider<AddArticleModel>(
            create: (_) => AddArticleModel(),
            builder: (context, snapshot) {
              return Consumer<AddArticleModel>(
                  builder: (context, model, child) {
                return Scaffold(
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                      DateFormat('yyyy年M月d日').format(DateTime.now()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (text) {
                            model.content = text;
                          },
                          decoration: InputDecoration(
                              hintText: '今日の出来事を入力', border: InputBorder.none),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () async {
                              await model.addArticle();
                              try {
                                await model.setArticle();
                              } catch (e) {
                                print('設定画面から');
                              }
                              Navigator.pop(context);
                            },
                            child: Text(
                              '保存する',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }),
      ],
    );
  }
}
