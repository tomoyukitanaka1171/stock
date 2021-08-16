import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/add_article_model.dart';

class AddArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddArticleModel>(
      create: (_) => AddArticleModel(),
      child: Consumer<AddArticleModel>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: InkWell(
                    onTap: () async {
                      await model.getImage();
                    },
                    child: model.imageFile != null
                        ? Image.file(model.imageFile!)
                        : Container(
                            color: Colors.black26,
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.black12,
                              size: 40,
                            ),
                          ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'タイトルを入力',
                  ),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '内容を入力',
                  ),
                  onChanged: (text) {
                    model.content = text;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () async {
                        try {
                          await model.addArticle();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('投稿しました'),
                              action: SnackBarAction(
                                label: '',
                                onPressed: () {},
                              ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                              action: SnackBarAction(
                                label: '',
                                onPressed: () {},
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('投稿する'),
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
