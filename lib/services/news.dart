import 'dart:convert';
// import 'dart:ui_web';

import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';

class News {
  List<ArticalModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5d5a5e44d2c9413aaf680ec06fa6f059";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticalModel articalModel = ArticalModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          news.add(articalModel);
          // news.add(articalModel);
        }
      });
    }
  }
}
