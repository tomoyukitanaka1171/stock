import 'package:bottom_nav_app/constrains.dart';
import 'package:bottom_nav_app/model/archive_mode/archive_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/article.dart';
import 'article_card.dart';

class ArchivePage extends StatelessWidget {
  ArchivePage(this.archiveId);
  String archiveId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArchiveModel>(
      create: (_) => ArchiveModel(archiveId)..fetchArchiveList(),
      child: Consumer<ArchiveModel>(
        builder: (context, model, child) {
          final List<Article>? articles = model.articles;

          print('---------$articles');

          if (articles == null) {
            return CircularProgressIndicator();
          }

          final List<Widget> widgets = articles
              .map((article) => ArticleCard(article.content, article.createdAt))
              .toList();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                'アーカイブ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      color: Colors.black12,
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      width: double.infinity,
                      child: Text(
                        archiveId,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, color: kTextLightColor),
                      ),
                    ),
                  ),
                  ListView.builder(
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widgets.length,
                    itemBuilder: (context, index) {
                      return widgets[index];
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
