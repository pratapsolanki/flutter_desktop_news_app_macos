import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:news/app/data/utils/constants.dart';
import 'package:news/app/modules/news_list/views/news_list_view.dart';

import '../../../data/common_widgets/no_data.dart';
import '../../../models/news_page.dart';
import '../controllers/news_list_controller.dart';
import 'news_item.dart';

class NewsListViewTab extends GetView<NewsListController> {
  final List<NewsPage> newsPage;

  @override
  NewsListController controller = Get.put(NewsListController());

  NewsListViewTab({Key? key, required this.newsPage}) : super(key: key);

  final _controller = MacosTabController(
    initialIndex: 0,
    length: Constants.pages.length,
  );
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: buildMacosTabView(),
    );
  }

  Widget buildMacosTabView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MacosTabView(
          controller: _controller,
          tabs: List.generate(
            Constants.pages.length,
            (index) => MacosTab(label: Constants.pages[index].title),
          ),
          children: List.generate(
            Constants.pages.length,
            (index) => NewsListView(newsPage: newsPage[index]),
          )),
    );
  }
}
