import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/article.dart';
import '../../model/article_card_model.dart';
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
              .map((article) =>
                  ArticleCard(article.title, article.content, article.imageURL))
              .toList();
          return SingleChildScrollView(
            child: Column(
              children: widgets,
            ),
          );
        },
      ),
    );
  }
}
