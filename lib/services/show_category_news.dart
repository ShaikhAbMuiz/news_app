import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:news_app/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getShowCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5d5a5e44d2c9413aaf680ec06fa6f059";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              // url: element['url'],
              urlToImage: element['urlToImage']);
          categories.add(showCategoryModel);
          // news.add(articalModel);
        }
      });
    }
  }
}
