import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/article.dart';
import '../../model/article_model/article_card_model.dart';
import 'article_card.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleCardModel>(
      create: (_) => ArticleCardModel()..fetchArticleList(),
      child: Consumer<ArticleCardModel>(
        builder: (context, model, child) {
          final List<Article>? articles = model.articles;

          if (articles == null) {
            return CircularProgressIndicator();
          }

          final List<Widget> widgets = articles
              .map((article) => ArticleCard(
                  content: article.content,
                  createdAt: article.createdAt,
                  documentId: article.documentId))
              .toList();
          return StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    SizedBox(height: 8),
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
                );
              });
        },
      ),
    );
  }
}
