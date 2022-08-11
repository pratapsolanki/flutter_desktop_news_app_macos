import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../data/common_widgets/no_data.dart';
import '../../../models/news_page.dart';
import '../controllers/news_list_controller.dart';
import 'news_item.dart';

class NewsListView extends GetView<NewsListController> {
  final NewsPage newsPage;

  @override
  NewsListController controller = Get.put(NewsListController());



  NewsListView({Key? key, required this.newsPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getNewsList(newsPage);
    return ScaffoldPage(
      header: PageHeader(title: Text(newsPage.title)),
      content: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.newsList.isEmpty) {
          return const NoDataView();
        } else {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 270,
                  mainAxisExtent: 290,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              padding: const EdgeInsets.all(16),
              itemCount: controller.newsList.length,
              itemBuilder: (ctx, index) {
                return NewsItem(article: controller.newsList[index]);
              });
        }
      }),
    );
  }


  Future<void> refresh() async {
    controller.getNewsList(newsPage);
  }
}
