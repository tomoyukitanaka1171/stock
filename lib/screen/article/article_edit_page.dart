import 'package:bottom_nav_app/model/article_model/article_edit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ArticleEditPage extends StatelessWidget {
  ArticleEditPage(this.createdAt, this.content, this.documentId);
  Timestamp? createdAt;
  String? content;
  String documentId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangeNotifierProvider<ArticleEditModel>(
            create: (_) => ArticleEditModel(content, documentId, createdAt),
            builder: (context, snapshot) {
              return Consumer<ArticleEditModel>(
                  builder: (context, model, child) {
                return Scaffold(
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                      DateFormat('yyyy年M月d日').format(createdAt!.toDate()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: TextEditingController(text: content),
                          onChanged: (text) {
                            model.content = text;
                          },
                          decoration: InputDecoration(
                              hintText: content, border: InputBorder.none),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () async {
                                await model.editArticle();
                                Navigator.pop(context);
                              },
                              child: Text(
                                '変更する',
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('削除'),
                                        content: Text('本当に削除しますか?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              await model.deleteArticle();
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text('はい'),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text('いいえ'))
                                        ],
                                      );
                                    });
                              },
                              child: Text(
                                '削除する',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
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
