import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/article_category.dart';
import '../../models/news_page.dart';

class Constants {
  static void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  static void showError(String title) {
    Get.snackbar("Error", title,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10.0));
  }

  static var pages = [
    const NewsPage(
        title: 'Top Headlines',
        iconData: FluentIcons.news,
        category: ArticleCategory.general),
    const NewsPage(
        title: 'Business',
        iconData: FluentIcons.business_center_logo,
        category: ArticleCategory.business),
    const NewsPage(
        title: 'Technology',
        iconData: FluentIcons.laptop_secure,
        category: ArticleCategory.technology),
    const NewsPage(
        title: 'Entertainment',
        iconData: FluentIcons.my_movies_t_v,
        category: ArticleCategory.entertainment),
    const NewsPage(
        title: 'Sports',
        iconData: FluentIcons.more_sports,
        category: ArticleCategory.sports),
    const NewsPage(
        title: 'Science',
        iconData: FluentIcons.communications,
        category: ArticleCategory.science),
    const NewsPage(
        title: 'Health',
        iconData: FluentIcons.health,
        category: ArticleCategory.health),
  ];
}
