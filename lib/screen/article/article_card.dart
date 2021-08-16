import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard(this.title, this.content, this.imageURL);
  final String title;
  final String content;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Image.network(
            imageURL,
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '10時間前',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
