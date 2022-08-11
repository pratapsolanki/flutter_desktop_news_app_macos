import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/article.dart';
import '../models/article_category.dart';

class ApiServices {
  static const int _SUCCESS_CODE = 200;

  static const baseURL = 'https://newsapi.org/v2';

  // static const apiKey = '8da10975d3154f2cb680b4fcb253d510';
  static const apiKey = '063169dde10246db95bd715b1bd240e9';

  Future<List<Article>> fetchArticles(ArticleCategory category) async {
    var url = ApiServices.baseURL;
    url += '/top-headlines';
    url += '?apiKey=$apiKey';
    url += '&language=en';
    url += '&category=${categoryQueryParamValue(category)}';

    printData(url.toString());

    final response = await http.get(Uri.parse(url));
    printData(response.toString());

    if (response.statusCode == _SUCCESS_CODE) {
      final json = jsonDecode(response.body);
      if (json['status'] == 'ok') {
        final dynamic articlesJSON = json['articles'] ?? [];
        final List<Article> articles =
            articlesJSON.map<Article>((e) => Article.fromJson(e)).toList();

        return articles;
      } else {
        throw Exception(json['message'] ?? 'Failed to load articles');
      }
    } else {
      throw Exception('Failed to load articles (bad response)');
    }
  }

  void printData(String msg) {
    if (kDebugMode) {
      print(msg.toString());
    }
  }

  String categoryQueryParamValue(ArticleCategory category) {
    switch (category) {
      case ArticleCategory.general:
        return "general";
      case ArticleCategory.business:
        return "business";
      case ArticleCategory.technology:
        return "technology";
      case ArticleCategory.entertainment:
        return "entertainment";
      case ArticleCategory.sports:
        return "sports";
      case ArticleCategory.science:
        return "science";
      case ArticleCategory.health:
        return "health";
      default:
        return "general";
    }
  }
}
